<?php

namespace Modules\Subscriptions\Http\Controllers\Backend;

use Carbon\Carbon;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Str;
use Modules\CustomField\Models\CustomField;
use Modules\CustomField\Models\CustomFieldGroup;
use Modules\Subscriptions\Http\Requests\PlanLimitationRequest;
use Modules\Subscriptions\Models\PlanLimitation;
use Yajra\DataTables\DataTables;
use Modules\Service\Models\SystemService;
use Modules\Category\Models\Category;

class PlanLimitationController extends Controller
{
    public function __construct()
    {
        // Page Title
        $this->module_title = 'plan_limitation.title';

        // module name
        $this->module_name = 'planlimitation';

        // module icon
        $this->module_icon = 'fa-solid fa-clipboard-list';

        view()->share([
            'module_title' => $this->module_title,
            'module_icon' => $this->module_icon,
            'module_name' => $this->module_name,
        ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Renderable
     */
    public function index()
    {

        $module_action = 'List';
        $columns = CustomFieldGroup::columnJsonValues(new PlanLimitation());

        return view('subscriptions::backend.planlimitation.index', compact('module_action', 'columns'));
    }

    public function bulk_action(Request $request)
    {
        $ids = explode(',', $request->rowIds);

        $actionType = $request->action_type;

        $message = __('messages.bulk_update');

        switch ($actionType) {
            case 'change-status':
                $branches = PlanLimitation::whereIn('id', $ids)->update(['status' => $request->status]);
                $message = __('messages.bulk_planlimit_update');
                break;

            case 'delete':
                PlanLimitation::whereIn('id', $ids)->delete();
                $message = __('messages.bulk_planlimit_delete');
                break;

            default:
                return response()->json(['status' => false, 'message' => __('branch.invalid_action')]);
                break;
        }

        return response()->json(['status' => true, 'message' => __('messages.bulk_update')]);
    }

    public function index_data(Datatables $datatable, Request $request)
    {
        $module_name = $this->module_name;
        $query = PlanLimitation::query();

        $filter = $request->filter;

        if (isset($filter)) {
            if (isset($filter['column_status'])) {
                $query->where('status', $filter['column_status']);
            }
        }

        $datatable = $datatable->eloquent($query)
            ->addColumn('check', function ($row) {
                return '<input type="checkbox" class="form-check-input select-table-row"  id="datatable-row-'.$row->id.'"  name="datatable_ids[]" value="'.$row->id.'" onclick="dataTableRowCheck('.$row->id.')">';
            })
            ->addColumn('action', function ($data) {
                return view('subscriptions::backend.planlimitation.action_column', compact('data'));
            })

            ->editColumn('type', function ($data) {

                return ucwords(str_replace('_', ' ', $data->type));
                
            })


            ->editColumn('limit', function ($data) {

                if($data->type == 'ai_image'|| $data->type == 'ai_art_generator' ){

                    return  $data->limit  . " Images";
                }else{

                    return  $data->limit  . " Words";
                }

         
                
            })



            ->editColumn('status', function ($row) {
                $checked = '';
                if ($row->status) {
                    $checked = 'checked="checked"';
                }

                return '
                <div class="form-check form-switch ">
                    <input type="checkbox" data-url="'.route('backend.subscription.planlimitation.update_status', $row->id).'" data-token="'.csrf_token().'" class="switch-status-change form-check-input"  id="datatable-row-'.$row->id.'"  name="status" value="'.$row->id.'" '.$checked.'>
                </div>
               ';
            })
            ->editColumn('updated_at', function ($data) {
                $module_name = $this->module_name;

                $diff = Carbon::now()->diffInHours($data->updated_at);

                if ($diff < 25) {
                    return $data->updated_at->diffForHumans();
                } else {
                    return $data->updated_at->isoFormat('llll');
                }
            })
            ->orderColumns(['id'], '-:column $1');

        // Custom Fields For export
        $customFieldColumns = CustomField::customFieldData($datatable, PlanLimitation::CUSTOM_FIELD_MODEL, null);

        return $datatable->rawColumns(array_merge(['action', 'status', 'check','limit'], $customFieldColumns))
            ->toJson();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Renderable
     */
    public function store(PlanLimitationRequest $request)
    {
       $data=$request->all();

         if($data['type'] =='ai_image'||  $data['type'] =='ai_art_generator'){
  
            $data['key']='image_count';
  
          }else{
  
           $data['key']='word_count';
  
         }
    
        $data = PlanLimitation::create( $data);

        $message = __('messages.create_form', ['form' => __($this->module_title)]);

        return response()->json(['message' => $message, 'status' => true], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Renderable
     */
    public function edit($id)
    {
        $data = PlanLimitation::findOrFail($id);

        return response()->json(['data' => $data, 'status' => true]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Renderable
     */
    public function update(PlanLimitationRequest $request, $id)
    {
        $data = PlanLimitation::findOrFail($id);


        $request_data=$request->all();

        if($request_data['limit_type'] !='category' || $request_data['type'] =='ai_image'||  $request_data['type'] =='ai_art_generator'){
 
           $request_data['key']='image_count';
 
         }else{
 
          $request_data['key']='word_count';
 
        }
   
        $data->update($request_data);

        $message = __('messages.update_form', ['form' => __($this->module_title)]);

        return response()->json(['message' => $message, 'status' => true], 200);
    }


    public function index_list(Request $request)
    {
        $term = trim($request->q);

        $query_data = PlanLimitation::where('status', 1)
            ->where(function ($q) {
                if (! empty($term)) {
                    $q->orWhere('name', 'LIKE', "%$term%");
                }
            })->get();

        $data = [];

        foreach ($query_data as $row) {
            $data[] = [
                'id' => $row->id,
                'type' => $row->type,
                'name' => $row->name,
                'limit' => $row->limit,
               
            ];
        }

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Renderable
     */
    public function destroy($id)
    {
        $data = PlanLimitation::findOrFail($id);

        $data->delete();

        $message = __('messages.delete_form', ['form' => __($this->module_title)]);

        return response()->json(['message' => $message, 'status' => true], 200);
    }

    public function trashed()
    {
        $module_name_singular = Str::singular($this->module_name);

        $module_action = 'Trash List';

        $data = PlanLimitation::with('user')->onlyTrashed()->orderBy('deleted_at', 'desc')->paginate();

        return view('subscriptions::backend.planlimitation.trash', compact('data', 'module_name_singular', 'module_action'));
    }

    public function restore($id)
    {
        $data = PlanLimitation::withTrashed()->find($id);
        $data->restore();

        $message = Str::singular($this->module_title).' Data Restoreded Successfully';

        return redirect('app/subscription/planlimitation');
    }

    public function update_status(Request $request, PlanLimitation $id)
    {
        $id->update(['status' => $request->status]);

        return response()->json(['status' => true, 'message' => __('branch.status_update')]);
    }

    public function system_service_list(Request $request)
    {
       
        $query_data = SystemService::where('status',1 )->get();

        $data = [];

        foreach ($query_data as $row) {
            $data[] = [
                'id' => $row->type,
                'name' => $row->name,
            ];
        }
        return response()->json($data);
    }

    public function category_list(Request $request)
    {
        $query_data = Category::where('type','ai_writer')->whereNull('parent_id');


        $query_data=$query_data->get();

        $data = [];

        foreach ($query_data as $row) {
            $data[] = [
                'id' => $row->slug,
                'name' => $row->name,
            ];
         }

        return response()->json($data);
     }

}

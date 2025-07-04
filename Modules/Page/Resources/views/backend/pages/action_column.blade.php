<div class="d-flex gap-2 align-items-center">
<button type="button" class="fs-4  border-0 bg-transparent" title="{{ __('page.lbl_page_url') }}"  data-bs-toggle="tooltip"  onclick="copyUrl(event, {{$data->id}})"> <a class="text-success"   id="myLink_{{$data->id}}" href='<?= route('pages', ['slug' => $data->type]) ?>' target='_blank'><i class="ph ph-clipboard"></i></a></button>
    @hasPermission('edit_page')
        <button type="button" class="fs-4 text-primary border-0 bg-transparent" data-crud-id="{{$data->id}}" title="{{__('Edit')}} {{ __('page.lbl_page') }}" data-bs-toggle="tooltip"> <i class="ph ph-pencil-simple"></i></button>
    @endhasPermission
    @hasPermission('delete_page')
    <a href="{{route("backend.$module_name.destroy", $data->id)}}" id="delete-{{$module_name}}-{{$data->id}}" class="fs-4 text-danger" data-type="ajax" data-method="DELETE" data-token="{{csrf_token()}}" data-bs-toggle="tooltip" title="{{__('Delete')}}"  data-confirm="{{ __('messages.are_you_sure?') }}"> <i class="ph ph-trash"></i></a>
    @endhasPermission
   
</button>
</div>

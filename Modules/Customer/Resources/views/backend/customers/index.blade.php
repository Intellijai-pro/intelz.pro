@extends('backend.layouts.app')

@section('title')
  {{ __($module_title) }}
@endsection


@push('after-styles')
<link rel="stylesheet" href="{{ mix('modules/constant/style.css') }}">
@endpush
@section('content')
<div class="card">
    <div class="card-header">
      <x-backend.section-header>
        <div>
          <x-backend.quick-action url='{{route("backend.$module_name.bulk_action")}}'>
            <div class="">
              <select name="action_type" class="form-control select2 col-12" id="quick-action-type" style="width:100%">
                <option value="">{{ __('messages.no_action') }}</option>
                <option value="change-status">{{ __('messages.status') }}</option>
                <option value="delete">{{ __('messages.delete') }}</option>
              </select>
            </div>
            <div class="select-status d-none quick-action-field" id="change-status-action">
              <select name="status" class="form-control select2" id="status" style="width:100%">
                <option value="1">{{ __('messages.active') }}</option>
                <option value="0">{{ __('messages.inactive') }}</option>
              </select>
            </div>
          </x-backend.quick-action>
        </div>


        <x-slot name="toolbar">
          @if($type=='soon-to-expire')
            <button id="send-email-btn" class="btn btn-primary">{{ __('messages.send_reminder') }}</button>
          @endif
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping"><i class="ph ph-magnifying-glass"></i></span>
            <input type="text" class="form-control form-control-sm dt-search" placeholder="Search..." aria-label="Search"
              aria-describedby="addon-wrapping">
            
          </div>
         @hasPermission('add_user') 
            @if($type == null ) 
              <x-buttons.offcanvas target='#form-offcanvas' title="{{ __('Create') }} {{ __($module_title) }}" class=" d-flex align-items-center gap-1">{{ __('messages.new') }}</x-buttons.offcanvas>
            @endif
         @endhasPermission 
        </x-slot>
      </x-backend.section-header>
    </div>
  <div class="card-body p-0">
    
    <table id="datatable" class="table table-striped border table-responsive">
    </table>
  </div>
</div>
<div data-render="app">
  <customer-offcanvas default-image="{{user_avatar()}}" create-title="{{ __('Create') }} {{ __($module_title) }}"
    edit-title="{{ __('Edit') }} {{ __($module_title) }}" :customefield="{{ json_encode($customefield) }}">
  </customer-offcanvas>
   <change-password create-title="Change Password"></change-password>
   <send-push-notification create-title="Send Push Notification"></send-push-notification>
</div>

<!-- Success Message Container -->
<div id="success-message" class="alert alert-success" style="display: none; text-align: center; width: auto; position: fixed; top: 0; right: 0; margin: 50px;">
  <strong>{{__('messages.mail_success')}}</strong> {{__('messages.mail_send')}}
</div>

@endsection

@push('after-styles')
<!-- DataTables Core and Extensions -->
<link rel="stylesheet" href="{{ asset('vendor/datatable/datatables.min.css') }}">
@endpush

@push('after-scripts')
<script src="{{ mix('modules/customer/script.js') }}"></script>
<script src="{{ asset('js/form-offcanvas/index.js') }}" defer></script>

<!-- DataTables Core and Extensions -->
<script type="text/javascript" src="{{ asset('vendor/datatable/datatables.min.js') }}"></script>

<script type="text/javascript" defer>
  const columns = [{
        name: 'check',
        data: 'check',
        title: '<input type="checkbox" class="form-check-input" name="select_all_table" id="select-all-table" onclick="selectAllTable(this)">',
        width: '0%',
        exportable: false,
        orderable: false,
        searchable: false,
      },
       {
            data: 'user_id',
            name: 'user_id',
            title: "{{__('customer.lbl_name')}}",
            orderable: true,
            searchable: true,
        },
      {
        data: 'email_verified_at',
        name: 'email_verified_at',
        orderable: false,
        searchable: true,
        title: "{{ __('customer.lbl_verification_status') }}"
      },
      // {
      //   data: 'is_banned',
      //   name: 'is_banned',
      //   orderable: false,
      //   searchable: true,
      //   title: "{{ __('customer.lbl_blocked') }}"
      // },
      {
        data: 'status',
        name: 'status',
        orderable: false,
        searchable: true,
        title: "{{ __('customer.lbl_status') }}"
      },
    ]

    const actionColumn = [{
      data: 'action',
      name: 'action',
      orderable: false,
      searchable: false,
      title: "{{ __('customer.lbl_action') }}"
    }]

    const customFieldColumns = JSON.parse(@json($columns))

    let finalColumns = [
      ...columns,
      ...customFieldColumns,
      
    ]
     
    if (!('{{ $type }}')) {
        finalColumns = [...finalColumns, ...actionColumn];
    }

    if (('{{ $type }}' == 'soon-to-expire')) {
      finalColumns.push({
          name: 'expire_date',
          data: 'expire_date',
          title: 'Expire Date',
          orderable: false,
          searchable: false,
      });
    }

    document.addEventListener('DOMContentLoaded', (event) => {
      initDatatable({
        url: '{{ route("backend.$module_name.index_data",['type' => $type]) }}',
        finalColumns,
      })


      const datatable = $('#datatable').DataTable();

      datatable.on('draw', function () {
          const rowCount = datatable.rows().count();

          if (rowCount === 0) {
              document.getElementById('send-email-btn').style.display = 'none';
          }
      });
    })

    function resetQuickAction() {
      const actionValue = $('#quick-action-type').val();
      if (actionValue != '') {
        $('#quick-action-apply').removeAttr('disabled');

        if (actionValue == 'change-status') {
          $('.quick-action-field').addClass('d-none');
          $('#change-status-action').removeClass('d-none');
        } else {
          $('.quick-action-field').addClass('d-none');
        }
      } else {
        $('#quick-action-apply').attr('disabled', true);
        $('.quick-action-field').addClass('d-none');
      }
    }

    $('#quick-action-type').change(function() {
      resetQuickAction()
    });

    $(document).on('update_quick_action', function() {
      // resetActionButtons()
    })

    function showMessage(message) {
            Snackbar.show({
                text: message,
                pos: 'bottom-left'
            });
        }
        $(document).ready(function() {
          $('#send-email-btn').click(function() {
              const confirmationMessage = "Are you sure you want to send the email?";
              confirmSwal(confirmationMessage).then((result) => {
                  if (result.isConfirmed) {
                      sendEmail();
                  }
              });
          });

          function sendEmail() {
            
              var csrfToken = $('meta[name="csrf-token"]').attr('content');
              $.ajax({
                  url: '{{ route("backend.send.email") }}',
                  type: 'POST',
                  data: {
                      _token: csrfToken 
                  },
                  success: function(response) {
                      showMessage(response.message);
                  },
                  error: function(xhr, status, error) {
                      console.log('Failed to send emails' + error);
                  }
              });
          }
        });
</script>
@endpush

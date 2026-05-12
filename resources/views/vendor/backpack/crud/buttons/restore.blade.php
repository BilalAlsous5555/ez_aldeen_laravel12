@if ($crud->hasAccess('restore', $entry) && method_exists($entry, 'trashed') && $entry->trashed())
    <a href="javascript:void(0)"
        onclick="restoreEntry(this)"
        bp-button="restore"
        data-route="{{ url($crud->route.'/'.$entry->getKey().'/restore') }}"
        data-table-id="{{ isset($crudTableId) ? $crudTableId : 'crudTable' }}"
        data-confirm-text="هل أنت متأكد من استعادة هذا المستخدم؟"
        data-restore-text="استعادة"
        data-cancel-text="إلغاء"
        data-success-text="تمت استعادة المستخدم بنجاح"
        class="btn btn-sm btn-link text-success"
        data-button-type="restore"
    >
        <i class="la la-undo"></i> <span>استعادة</span>
    </a>
@endif

@push('after_scripts') @if (request()->ajax()) @endpush @endif
@bassetBlock('backpack/crud/buttons/restore-button.js')
<script>
    if (typeof restoreEntry != 'function') {
        $("[data-button-type=restore]").unbind('click');

        function restoreEntry(button) {
            var route = $(button).attr('data-route');

            swal({
                text: button.getAttribute('data-confirm-text'),
                icon: "info",
                buttons: {
                    cancel: {
                        text: button.getAttribute('data-cancel-text'),
                        value: null,
                        visible: true,
                        className: "bg-secondary",
                        closeModal: true,
                    },
                    restore: {
                        text: button.getAttribute('data-restore-text'),
                        value: true,
                        visible: true,
                        className: "bg-success",
                    },
                },
            }).then((value) => {
                if (value) {
                    $.ajax({
                        url: route,
                        type: 'POST',
                        success: function(result) {
                            if (result == 1) {
                                let tableId = $(button).data('table-id') || 'crudTable';
                                
                                if (typeof window.crud !== 'undefined' && 
                                    typeof window.crud.tables !== 'undefined' && 
                                    window.crud.tables[tableId]) {
                                    
                                    let table = window.crud.tables[tableId];
                                    new Noty({
                                        type: "success",
                                        text: button.getAttribute('data-success-text')
                                    }).show();
                                    table.draw(false);
                                }
                            } else {
                                new Noty({
                                    type: "success",
                                    text: button.getAttribute('data-success-text')
                                }).show();
                            }
                        },
                        error: function(xhr) {
                            var errorMessage = 'حدث خطأ أثناء استعادة المستخدم';
                            try {
                                var response = JSON.parse(xhr.responseText);
                                if (response && response.error) {
                                    errorMessage = response.error;
                                }
                            } catch (e) {}
                            swal({
                                title: "خطأ",
                                text: errorMessage,
                                icon: "error",
                                buttons: true,
                            });
                        }
                    });
                }
            });
        }
    }
</script>
@endBassetBlock
@if (!request()->ajax()) @endpush @endif

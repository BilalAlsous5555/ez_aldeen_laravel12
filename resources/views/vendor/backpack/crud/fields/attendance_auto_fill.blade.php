<input type="hidden" name="halakat_id" id="halakat_id_input" value="">
<input type="hidden" name="recorded_by" id="recorded_by_input" value="{{ backpack_auth()->id() }}">

@push('crud_fields_scripts')
<script>
(function($) {
    $(document).ready(function() {
        var studentSelect = $('select[name="student_id"]');
        var halakaInput = $('#halakat_id_input');

        function fetchHalakaInfo(studentId) {
            if (!studentId) {
                halakaInput.val('');
                return;
            }
            $.getJSON('{{ backpack_url("students") }}/' + studentId + '/halaka-info', function(data) {
                if (data.halakat_id) {
                    halakaInput.val(data.halakat_id);
                }
            });
        }

        studentSelect.on('change', function() {
            fetchHalakaInfo($(this).val());
        });

        if (studentSelect.val()) {
            fetchHalakaInfo(studentSelect.val());
        }
    });
})(jQuery);
</script>
@endpush
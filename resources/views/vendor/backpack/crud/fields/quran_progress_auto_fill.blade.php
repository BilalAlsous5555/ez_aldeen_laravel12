<input type="hidden" name="teacher_id" id="teacher_id_input" value="">
<input type="hidden" name="halakat_id" id="halakat_id_input" value="">

@php
    $surahAyahCounts = \App\Models\Surah::pluck('aya_count', 'id');
@endphp

@push('crud_fields_scripts')
<script>
(function($) {
    $(document).ready(function() {
        var studentSelect = $('select[name="student_id"]');
        var halakaInput = $('#halakat_id_input');

        function fetchHalakaInfo(studentId) {
            if (!studentId) {
                $('#teacher_id_input').val('');
                halakaInput.val('');
                return;
            }
            $.getJSON('{{ backpack_url("students") }}/' + studentId + '/halaka-info', function(data) {
                if (data.halakat_id) {
                    halakaInput.val(data.halakat_id);
                }
                if (data.teacher_id) {
                    $('#teacher_id_input').val(data.teacher_id);
                }
            });
        }

        studentSelect.on('change', function() {
            fetchHalakaInfo($(this).val());
        });

        if (studentSelect.val()) {
            fetchHalakaInfo(studentSelect.val());
        }

        // --- Surah validation ---
        var surahAyahCounts = @json($surahAyahCounts);
        var surahSelect = $('select[name="surah_id"]');
        var toAyaInput = $('input[name="to_aya"]');
        var toAyaWrapper = toAyaInput.closest('[bp-field-wrapper]') || toAyaInput.closest('.form-group');
        var hintEl = $('<small class="form-text text-muted surah-ayah-hint"></small>');

        toAyaWrapper.append(hintEl);

        function updateToAyaLimit() {
            var surahId = surahSelect.val();
            var maxAyah = surahAyahCounts[surahId];

            if (surahId && maxAyah) {
                toAyaInput.attr('max', maxAyah);
                hintEl.text('اقصى عدد آيات: ' + maxAyah);
                if (parseInt(toAyaInput.val()) > maxAyah) {
                    toAyaInput.val(maxAyah);
                }
            } else {
                toAyaInput.removeAttr('max');
                hintEl.text('');
            }
        }

        surahSelect.on('change', updateToAyaLimit);
        updateToAyaLimit();
    });
})(jQuery);
</script>
@endpush

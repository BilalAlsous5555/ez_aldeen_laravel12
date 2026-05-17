<div @class(['form-group col-md-3', 'has-error' => $errors->has('juz_number')])>
    <label class="form-label fw-bold">رقم الجزء (اختياري — إذا حفظ الطالب جزءاً كاملاً)</label>
    <select
        name="juz_number[]"
        id="juz_number_select"
        multiple
        class="form-control"
        style="width: 100%; height: 120px;"
    >
        @for($i = 1; $i <= 30; $i++)
            <option value="{{ $i }}">{{ $i }}</option>
        @endfor
    </select>
    <small class="form-text text-muted">اضغط Ctrl أو Shift لاختيار أكثر من جزء</small>
    @if($errors->has('juz_number'))
        <div class="invalid-feedback d-block">{{ $errors->first('juz_number') }}</div>
    @endif
</div>

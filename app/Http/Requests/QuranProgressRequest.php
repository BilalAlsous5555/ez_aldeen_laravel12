<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuranProgressRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // only allow updates if the user is logged in
        return backpack_auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'student_id' => 'required|exists:users,id',
            'halakat_id' => 'required|exists:halakat,id',
            'surah_id' => 'nullable|exists:surah,id',
            'quran_page_number' => 'nullable|integer|min:1|max:604',
            'from_aya' => 'nullable|integer|min:1',
            'to_aya' => [
                'nullable',
                'integer',
                'min:1',
                'gte:from_aya',
                function ($attribute, $value, $fail) {
                    if ($value === null) {
                        return;
                    }
                    $surah = \App\Models\Surah::find((int) $this->input('surah_id'));
                    if ($surah && $value > $surah->aya_count) {
                        $fail("رقم الآية لا يمكن أن يتجاوز {$surah->aya_count} (عدد آيات {$surah->name})");
                    }
                },
            ],
            'memorize_type' => 'required|in:حفظ,مراجعة',
            'juz_number' => 'nullable|array',
            'juz_number.*' => 'integer|between:1,30',
            'evaluation' => 'required|in:ممتاز,جيد جدا,جيد,اعادة',
            'notes' => 'nullable|string|max:1000',
            'date' => 'required|date',
        ];
    }

    public function attributes()
    {
        return [
            'student_id' => 'الطالب',
            'halakat_id' => 'الحلقة',
            'surah_id' => 'السورة',
            'quran_page_number' => 'رقم الصفحة',
            'from_aya' => 'من الآية',
            'to_aya' => 'إلى الآية',
            'memorize_type' => 'نوع الحفظ',
            'evaluation' => 'تقييم الحفظ او المراجعة',
            'notes' => 'ملاحظات',
            'date' => 'التاريخ',
        ];
    }

    public function messages()
    {
        return [
            'to_aya.gte' => 'يجب أن تكون الآية "إلى" أكبر من أو تساوي الآية "من"',
        ];
    }
}

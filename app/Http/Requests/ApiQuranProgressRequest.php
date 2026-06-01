<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ApiQuranProgressRequest extends FormRequest
{
    public function authorize(): bool
    {
        return backpack_auth()->check() || auth('sanctum')->check();
    }

    public function rules(): array
    {
        return [
            'student_id' => 'required|exists:users,id',
            'surah_id' => 'required_without:juz_number|exists:surah,id',
            'from_aya' => 'nullable|integer|min:1',
            'to_aya' => 'nullable|integer|min:1',
            'juz_number' => 'nullable|array',
            'evaluation' => 'required|in:ممتاز,جيد جدا,جيد,اعادة',
            'memorize_type' => 'required|in:حفظ,مراجعة',
            'notes' => 'nullable|string|max:500',
            'date' => 'required|date',
        ];
    }

    public function messages(): array
    {
        return [
            'student_id.required' => 'رقم الطالب مطلوب',
            'student_id.exists' => 'الطالب غير موجود',
            'surah_id.required_without' => 'يجب تحديد السورة أو الجزء',
            'surah_id.exists' => 'السورة غير موجودة',
            'evaluation.required' => 'التقييم مطلوب',
            'evaluation.in' => 'التقييم يجب أن يكون: ممتاز، جيد جدا، جيد، أو اعادة',
            'memorize_type.required' => 'نوع الجلسة مطلوب',
            'memorize_type.in' => 'نوع الجلسة يجب أن يكون حفظ أو مراجعة',
            'date.required' => 'التاريخ مطلوب',
            'date.date' => 'صيغة التاريخ غير صحيحة',
        ];
    }
}

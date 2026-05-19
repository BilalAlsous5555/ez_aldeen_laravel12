<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AttendanceRequest extends FormRequest
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
            'attendance_date' => 'required|date',
            'status' => 'required|in:حاضر,غائب',
            'excused_reason' => 'nullable|string|max:500',
        ];
    }

    public function attributes()
    {
        return [
            'student_id' => 'الطالب',
            'halakat_id' => 'الحلقة',
            'attendance_date' => 'تاريخ الحضور',
            'status' => 'حالة الحضور',
            'excused_reason' => 'عذر الغياب',
        ];
    }

    public function messages()
    {
        return [
            'halakat_id.required' => 'يجب تحديد حلقة الطالب',
        ];
    }
}

<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ApiAttendanceRequest extends FormRequest
{
    public function authorize(): bool
    {
        return backpack_auth()->check() || auth('sanctum')->check();
    }

    public function rules(): array
    {
        return [
            'students' => 'required|array|min:1',
            'students.*.student_id' => 'required|exists:users,id',
            'students.*.status' => 'required|in:حاضر,غائب',
            'students.*.excused_reason' => 'nullable|string|max:500',
        ];
    }

    public function attributes(): array
    {
        return [
            'students' => 'الطلاب',
            'students.*.student_id' => 'رقم الطالب',
            'students.*.status' => 'حالة الحضور',
            'students.*.excused_reason' => 'عذر الغياب',
        ];
    }
}

<?php

namespace App\Http\Controllers\UserController;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApiAttendanceRequest;
use App\Models\Attendance;
use Illuminate\Http\JsonResponse;

class ApiAttendanceController extends Controller
{
    public function create(): JsonResponse
    {
        $teacher = auth()->user()->fresh();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $halqa = $teacher->halqa;

        if (! $halqa) {
            return response()->json([
                'teacher_name' => $teacher->name,
                'halaka_name' => null,
                'attendance_date' => now()->format('Y-m-d'),
                'students' => [],
            ]);
        }

        $activeStudents = $halqa->activeStudents()->orderBy('name')->get();

        $studentsData = $activeStudents->map(function ($student) {
            return [
                'id' => $student->id,
                'name' => $student->name,
            ];
        });

        return response()->json([
            'teacher_name' => $teacher->name,
            'halaka_name' => $halqa->name,
            'attendance_date' => now()->format('Y-m-d'),
            'students' => $studentsData,
        ]);
    }

    public function store(ApiAttendanceRequest $request): JsonResponse
    {
        $teacher = auth()->user();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $halqa = $teacher->halqa;

        if (! $halqa) {
            return response()->json(['message' => 'لا يوجد حلقة مسجلة لهذا المدرس'], 422);
        }

        $halakatId = $halqa->id;
        $teacherId = $teacher->id;
        $attendanceDate = now()->format('Y-m-d');

        $halakaStudentIds = $halqa->activeStudents()->pluck('users.id')->toArray();

        $created = [];
        $errors = [];

        foreach ($request->input('students') as $item) {
            $studentId = $item['student_id'];
            $status = $item['status'];
            $excusedReason = $item['excused_reason'] ?? null;

            if (! in_array($studentId, $halakaStudentIds)) {
                $errors[] = "الطالب رقم {$studentId} ليس في حلقتك";

                continue;
            }

            $exists = Attendance::where('student_id', $studentId)
                ->where('halakat_id', $halakatId)
                ->where('attendance_date', $attendanceDate)
                ->exists();

            if ($exists) {
                $errors[] = "تم تسجيل حضور الطالب رقم {$studentId} مسبقاً في هذا التاريخ";

                continue;
            }

            $attendance = Attendance::create([
                'student_id' => $studentId,
                'halakat_id' => $halakatId,
                'recorded_by' => $teacherId,
                'attendance_date' => $attendanceDate,
                'status' => $status,
                'excused_reason' => $status === 'غائب' ? $excusedReason : null,
            ]);

            \Illuminate\Support\Facades\Cache::forget('dashboard.stats');

            $created[] = $attendance;
        }

        return response()->json([
            'message' => count($created) > 0 ? '   تم تسجيل الحضور بنجاح' : '   لا يمكن تسجيل الحضور اكثر من مره لنفس اليوم ',
            'attendance_count' => count($created),
            'errors' => $errors,
        ], count($created) > 0 ? 201 : 422);
    }
}

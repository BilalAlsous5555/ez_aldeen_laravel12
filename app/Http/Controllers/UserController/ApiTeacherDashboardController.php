<?php

namespace App\Http\Controllers\UserController;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\QuranProgress;
use Illuminate\Http\JsonResponse;

class ApiTeacherDashboardController extends Controller
{
    public function dashboard(): JsonResponse
    {
        $teacher = auth()->user()->fresh();
        // Auth::user();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $halqa = $teacher->halqa()->with('activeStudents')->first();

        if (! $halqa) {
            return response()->json([
                'teacher_name' => $teacher->name,
                'halaka_name' => null,
                'active_students_count' => 0,
                'students' => [],
            ]);
        }

        $activeStudents = $halqa->activeStudents()->get();

        $studentsData = $activeStudents->map(function ($student) use ($halqa) {
            $lastProgress = QuranProgress::where('student_id', $student->id)
                ->where('memorize_type', 'حفظ')
                ->whereNotNull('surah_id')
                ->with('surah')
                ->orderByDesc('id')
                ->first();

            $halqaAttTotal = Attendance::where('student_id', $student->id)
                ->where('halakat_id', $halqa->id)
                ->count();
            $halqaAttPresent = Attendance::where('student_id', $student->id)
                ->where('halakat_id', $halqa->id)
                ->where('status', 'حاضر')
                ->count();
            $halqaAttPct = $halqaAttTotal > 0 ? round(($halqaAttPresent / $halqaAttTotal) * 100) : 0;

            return [
                'id' => $student->id,
                'name' => $student->name,
                'phone' => $student->phone ?? '',
                'halaka_attendance_percentage' => $halqaAttPct,
                'last_memorize_progress' => $lastProgress ? [
                    'surah_name' => $lastProgress->surah?->name,
                    'from_aya' => $lastProgress->from_aya,
                    'to_aya' => $lastProgress->to_aya,
                    'evaluation' => $lastProgress->evaluation,
                    'date' => $lastProgress->date?->format('Y-m-d'),
                ] : null,
            ];
        });

        return response()->json([
            'teacher_name' => $teacher->name,
            'halaka_name' => $halqa->name,
            'active_students_count' => $activeStudents->count(),
            'students' => $studentsData,
        ]);
    }
}

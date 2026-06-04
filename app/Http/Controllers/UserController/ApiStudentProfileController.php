<?php

namespace App\Http\Controllers\UserController;

use App\Http\Controllers\Controller;
use App\Models\Studentachievement;
use App\Models\User;
use Illuminate\Http\JsonResponse;

class ApiStudentProfileController extends Controller
{
    public function show(int $id): JsonResponse
    {
        $teacher = auth()->user();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'غير مصرح لك'], 403);
        }

        $student = User::where('role', 'student')
            ->whereNull('deleted_at')
            ->with(['activeEnrollment.halqa.teacher'])
            ->find($id);

        if (! $student) {
            return response()->json(['message' => 'الطالب غير موجود'], 404);
        }

        $currentEnrollment = $student->activeEnrollment()->with('halqa.teacher')->first();
        $currentHalqa = $currentEnrollment?->halqa;
        $currentHalqaId = $currentHalqa?->id;

        $currentSurahs = collect();
        $currentJuz = collect();
        $revisionSurahs = collect();
        $revisionJuzProgress = collect();

        if ($currentHalqaId) {
            $currentSurahs = Studentachievement::where('student_id', $student->id)
                ->where('type', 'surah_memorized')
                ->where('halakat_id', $currentHalqaId)
                ->with('surah')
                ->get()
                ->map(fn ($a) => [
                    'id' => $a->id,
                    'surah_name' => $a->surah?->name,
                    'achieved_at' => $a->achieved_at?->format('Y-m-d'),
                    'teacher_name' => $a->teacher?->name,
                ]);

            $currentJuz = collect();
            if ($currentHalqaId) {
                $currentJuz = $student->progress()
                    ->where('memorize_type', 'حفظ')
                    ->whereNotNull('juz_number')
                    ->whereNull('surah_id')
                    ->where('halakat_id', $currentHalqaId)
                    ->orderBy('date', 'desc')
                    ->get()
                    ->map(fn ($p) => [
                        'id' => $p->id,
                        'juz_number' => $p->juz_number,
                        'evaluation' => $p->evaluation,
                        'notes' => $p->notes,
                        'teacher_name' => $p->teacher?->name,
                        'date' => $p->date?->format('Y-m-d'),
                    ]);
            }

            $revisionSurahs = $student->progress()
                ->where('memorize_type', 'مراجعة')
                ->whereNotNull('surah_id')
                ->where('halakat_id', $currentHalqaId)
                ->with('surah')
                ->orderBy('date', 'desc')
                ->get()
                ->unique('surah_id')
                ->map(fn ($p) => [
                    'id' => $p->id,
                    'surah_name' => $p->surah?->name,
                    'from_aya' => $p->from_aya,
                    'to_aya' => $p->to_aya,
                    'evaluation' => $p->evaluation,
                    'notes' => $p->notes,
                    'date' => $p->date?->format('Y-m-d'),
                ]);

            $revisionJuzProgress = $student->progress()
                ->where('memorize_type', 'مراجعة')
                ->whereNotNull('juz_number')
                ->whereNull('surah_id')
                ->where('halakat_id', $currentHalqaId)
                ->with('surah')
                ->orderBy('date', 'desc')
                ->get()
                ->map(fn ($p) => [
                    'id' => $p->id,
                    'juz_number' => $p->juz_number,
                    'evaluation' => $p->evaluation,
                    'notes' => $p->notes,
                    'date' => $p->date?->format('Y-m-d'),
                ]);
        }

        $last4Progress = $student->progress()
            ->with(['surah', 'teacher'])
            ->orderByDesc('date')
            ->orderByDesc('id')
            ->limit(4)
            ->get()
            ->map(fn ($p) => [
                'id' => $p->id,
                'surah_name' => $p->surah?->name,
                'juz_number' => $p->juz_number,
                'from_aya' => $p->from_aya,
                'to_aya' => $p->to_aya,
                'evaluation' => $p->evaluation,
                'memorize_type' => $p->memorize_type,
                'notes' => $p->notes,
                'teacher_name' => $p->teacher?->name,
                'date' => $p->date?->format('Y-m-d'),
            ]);

        $last4Attendance = $student->attendances()
            ->orderByDesc('attendance_date')
            ->limit(4)
            ->get()
            ->map(fn ($a) => [
                'id' => $a->id,
                'date' => $a->attendance_date?->format('Y-m-d'),
                'status' => $a->status,
                'excused_reason' => $a->excused_reason,
            ]);

        $totalAtt = $student->attendances()->count();
        $presentAtt = $student->attendances()->where('status', 'حاضر')->count();
        $attPct = $totalAtt > 0 ? round(($presentAtt / $totalAtt) * 100) : 0;

        $halqaAttTotal = 0;
        $halqaAttPresent = 0;
        $halqaAttPct = 0;
        if ($currentHalqaId) {
            $halqaAttTotal = $student->attendances()->where('halakat_id', $currentHalqaId)->count();
            $halqaAttPresent = $student->attendances()->where('halakat_id', $currentHalqaId)->where('status', 'حاضر')->count();
            $halqaAttPct = $halqaAttTotal > 0 ? round(($halqaAttPresent / $halqaAttTotal) * 100) : 0;
        }

        $oldEnrollments = $student->enrollments()
            ->where('is_active', false)
            ->with(['halqa' => fn ($q) => $q->withTrashed(), 'halqa.teacher' => fn ($q) => $q->withTrashed()])
            ->get()
            ->map(function ($enrollment) use ($student) {
                $halqa = $enrollment->halqa;
                $oldSurahs = Studentachievement::where('student_id', $student->id)
                    ->where('type', 'surah_memorized')
                    ->where('halakat_id', $enrollment->halakat_id)
                    ->with('surah')
                    ->get()
                    ->map(fn ($a) => [
                        'surah_name' => $a->surah?->name,
                        'achieved_at' => $a->achieved_at?->format('Y-m-d'),
                    ]);

                $oldJuz = Studentachievement::where('student_id', $student->id)
                    ->where('type', 'juz_memorized')
                    ->where('halakat_id', $enrollment->halakat_id)
                    ->get()
                    ->map(fn ($a) => [
                        'juz_number' => $a->juz_number,
                        'achieved_at' => $a->achieved_at?->format('Y-m-d'),
                    ]);

                return [
                    'halaka_name' => $halqa?->name,
                    'teacher_name' => $halqa?->teacher?->name,
                    'joined_at' => $enrollment->joined_at?->format('Y-m-d'),
                    'left_at' => $enrollment->left_at?->format('Y-m-d'),
                    'surahs' => $oldSurahs,
                    'juz_list' => $oldJuz,
                ];
            });

        return response()->json([
            'student' => [
                'id' => $student->id,
                'name' => $student->name,
                // 'email' => $student->email,
                // 'phone' => $student->phone,
                // 'birth_date' => $student->birth_date?->format('Y-m-d'),
                // 'role' => $student->arabic_role ?? $student->role,
                'created_at' => $student->created_at?->format('Y-m-d'),
            ],
            'current_halaka' => $currentHalqa ? [
                'id' => $currentHalqa->id,
                'name' => $currentHalqa->name,
                'teacher_name' => $currentHalqa->teacher?->name,
            ] : null,
            'memorized_surahs' => $currentSurahs,
            'memorized_juz' => $currentJuz,
            'revision_surahs' => $revisionSurahs,
            'revision_juz' => $revisionJuzProgress,
            'last_progress' => $last4Progress,
            'last_attendance' => $last4Attendance,
            'previous_enrollments' => $oldEnrollments,
        ]);
    }
}

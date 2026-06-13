<?php

namespace App\Http\Controllers\UserController;

use App\Http\Controllers\Controller;
use App\Models\QuranProgress;
use App\Models\Surah;
use Illuminate\Http\JsonResponse;

class ApiQuranProgressController extends Controller
{
    public function create(): JsonResponse
    {
        $teacher = auth()->user()->fresh();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'غير مصرح لك'], 403);
        }

        $halqa = $teacher->halqa;

        if (! $halqa) {
            return response()->json([
                'teacher_name' => $teacher->name,
                'halaka_name' => null,
                'students' => [],
                'surahs' => [],
                'juz_list' => [],
                'evaluations' => [],
                'memorize_types' => [],
            ]);
        }

        $activeStudents = $halqa->activeStudents()
            ->orderBy('name')
            ->get()
            ->map(fn ($student) => [
                'id' => $student->id,
                'name' => $student->name,
                'gender' => $student->gender,
                'last_progress' => $this->getLastProgress($student->id, $halqa->id),
            ]);

        $surahs = Surah::select('id', 'name', 'aya_count')
            ->orderBy('id')
            ->get()
            ->map(fn ($s) => [
                'id' => $s->id,
                'name' => $s->name,
                'aya_count' => $s->aya_count,
            ]);

        $juzList = collect(range(1, 30))->map(fn ($i) => [
            'value' => $i,
            'label' => $i,
        ]);

        $evaluations = [
            ['value' => 'ممتاز', 'label' => 'ممتاز'],
            ['value' => 'جيد جدا', 'label' => 'جيد جدا'],
            ['value' => 'جيد', 'label' => 'جيد'],
            ['value' => 'اعادة', 'label' => 'اعادة'],
        ];

        $memorizeTypes = [
            ['value' => 'حفظ', 'label' => 'حفظ'],
            ['value' => 'مراجعة', 'label' => 'مراجعة'],
        ];

        return response()->json([
            'teacher_name' => $teacher->name,
            'halaka_name' => $halqa->name,
            'students' => $activeStudents,
            'surahs' => $surahs,
            'juz_list' => $juzList,
            'evaluations' => $evaluations,
            'memorize_types' => $memorizeTypes,
        ]);
    }

    public function store(): JsonResponse
    {
        $teacher = auth()->user();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'غير مصرح لك'], 403);
        }

        $halqa = $teacher->halqa;

        if (! $halqa) {
            return response()->json(['message' => 'لا يوجد حلقة مسجلة لهذا المدرس'], 422);
        }

        $validated = request()->validate([
            'student_id' => 'required|exists:users,id',
            'surah_id' => 'nullable|exists:surah,id',
            'quran_page_number' => 'nullable|integer|min:1|max:604',
            'from_aya' => 'nullable|integer',
            'to_aya' => 'nullable|integer',
            'juz_number' => 'nullable|array',
            'juz_number.*' => 'nullable',
            'evaluation' => 'required|in:ممتاز,جيد جدا,جيد,اعادة',
            'memorize_type' => 'required|in:حفظ,مراجعة',
            'notes' => 'nullable|string|max:500',
            'date' => 'nullable|date',
        ]);

        $validated['from_aya'] = ! empty($validated['from_aya']) ? (int) $validated['from_aya'] : null;
        $validated['to_aya'] = ! empty($validated['to_aya']) ? (int) $validated['to_aya'] : null;
        $validated['quran_page_number'] = ! empty($validated['quran_page_number']) ? (int) $validated['quran_page_number'] : null;
        $validated['surah_id'] = ! empty($validated['surah_id']) ? (int) $validated['surah_id'] : null;
        if (! empty($validated['juz_number'])) {
            $validated['juz_number'] = array_map('intval', $validated['juz_number']);
        }

        if (empty($validated['date'])) {
            $validated['date'] = now()->toDateString();
        }

        $halakaStudentIds = $halqa->activeStudents()->pluck('users.id')->toArray();

        if (! in_array($validated['student_id'], $halakaStudentIds)) {
            return response()->json(['message' => 'هذا الطالب ليس في حلقتك'], 422);
        }

        if (! empty($validated['surah_id'])) {
            $surah = Surah::find($validated['surah_id']);
            $fromAya = $validated['from_aya'] ?? null;
            $toAya = $validated['to_aya'] ?? null;
            if ($surah && $fromAya && $fromAya > $surah->aya_count) {
                return response()->json([
                    'message' => 'ادخل الرقم الصحيح للآيات',
                    'max_aya' => $surah->aya_count,
                ], 422);
            }
            if ($surah && $toAya && $toAya > $surah->aya_count) {
                return response()->json([
                    'message' => 'لا يمكن تجاوز عدد آيات السورة ('.$surah->name.')',
                    'max_aya' => $surah->aya_count,
                ], 422);
            }
        }

        $progress = QuranProgress::create([
            'student_id' => $validated['student_id'],
            'halakat_id' => $halqa->id,
            'teacher_id' => $teacher->id,
            'surah_id' => ! empty($validated['surah_id']) ? $validated['surah_id'] : null,
            'quran_page_number' => ! empty($validated['quran_page_number']) ? $validated['quran_page_number'] : null,
            'from_aya' => ! empty($validated['from_aya']) ? $validated['from_aya'] : null,
            'to_aya' => ! empty($validated['to_aya']) ? $validated['to_aya'] : null,
            'juz_number' => ! empty($validated['juz_number']) ? $validated['juz_number'] : null,
            'evaluation' => $validated['evaluation'],
            'memorize_type' => $validated['memorize_type'],
            'notes' => $validated['notes'] ?? null,
            'date' => $validated['date'],
        ]);

        \Illuminate\Support\Facades\Cache::forget('dashboard.stats');

        $progress->load(['student', 'surah']);

        return response()->json([
            'message' => 'تم تسجيل التقدم بنجاح',
            'progress' => [
                'id' => $progress->id,
                'student_name' => $progress->student->name,
                'surah_id' => $progress->surah_id,
                'surah_name' => $progress->surah?->name,
                'quran_page_number' => $progress->quran_page_number,
                'from_aya' => $progress->from_aya,
                'to_aya' => $progress->to_aya,
                'juz_number' => $progress->juz_number,
                'evaluation' => $progress->evaluation,
                'memorize_type' => $progress->memorize_type,
                'notes' => $progress->notes,
                'date' => $progress->date->format('Y-m-d'),
            ],
        ], 201);
    }

    public function history(): JsonResponse
    {
        $teacher = auth()->user()->fresh();

        if (! $teacher || $teacher->role !== 'teacher') {
            return response()->json(['message' => 'غير مصرح لك'], 403);
        }

        $halqa = $teacher->halqa;

        if (! $halqa) {
            return response()->json([
                'teacher_name' => $teacher->name,
                'halaka_name' => null,
                'progress' => [],
            ]);
        }

        $progress = QuranProgress::where('halakat_id', $halqa->id)
            ->where('teacher_id', $teacher->id)
            ->with(['student', 'surah'])
            ->orderByDesc('date')
            ->orderByDesc('id')
            ->limit(50)
            ->get()
            ->map(fn ($p) => [
                'id' => $p->id,
                'student_name' => $p->student->name,
                'surah_id' => $p->surah_id,
                'surah_name' => $p->surah?->name,
                'quran_page_number' => $p->quran_page_number,
                'from_aya' => $p->from_aya,
                'to_aya' => $p->to_aya,
                'juz_number' => $p->juz_number,
                'evaluation' => $p->evaluation,
                'memorize_type' => $p->memorize_type,
                'notes' => $p->notes,
                'date' => $p->date->format('Y-m-d'),
            ]);

        return response()->json([
            'teacher_name' => $teacher->name,
            'halaka_name' => $halqa->name,
            'progress' => $progress,
        ]);
    }

    private function getLastProgress(int $studentId, int $halakaId): ?array
    {
        $last = QuranProgress::where('student_id', $studentId)
            ->where('halakat_id', $halakaId)
            ->where('memorize_type', 'حفظ')
            ->whereNotNull('surah_id')
            ->with('surah')
            ->orderByDesc('date')
            ->orderByDesc('id')
            ->first();

        if (! $last) {
            return null;
        }

        return [
            'surah_name' => $last->surah?->name,
            'from_aya' => $last->from_aya,
            'to_aya' => $last->to_aya,
            'evaluation' => $last->evaluation,
            'date' => $last->date->format('Y-m-d'),
        ];
    }
}

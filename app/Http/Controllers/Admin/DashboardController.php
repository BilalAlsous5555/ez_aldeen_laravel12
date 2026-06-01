<?php

namespace App\Http\Controllers\Admin;

use App\Models\Attendance;
use App\Models\Halakat;
use App\Models\Studentachievement;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Cache;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(backpack_middleware());
    }

    public function dashboard()
    {
        $this->data['title'] = trans('backpack::base.dashboard');

        $this->data = array_merge($this->data, $this->getDashboardData());

        return view(backpack_view('dashboard'), $this->data);
    }

    private function getDashboardData(): array
    {
        return Cache::remember('dashboard.stats', now()->addMinutes(5), function () {
            $now = now();
            $thisMonthStart = $now->copy()->startOfMonth();

            $activeStudentsCount = User::where('role', 'student')
                ->whereNull('deleted_at')
                ->count();

            $activeTeachersCount = User::where('role', 'teacher')
                ->whereNull('deleted_at')
                ->whereHas('halqa')
                ->count();

            $activeHalakatCount = Halakat::whereNull('deleted_at')->count();

            $withoutHalqaCount = $this->getWithoutHalqaCount();

            $todayAttendanceCount = Attendance::whereDate('attendance_date', $now->toDateString())
                ->whereHas('student', fn ($q) => $q->whereNull('deleted_at'))
                ->count();

            $todayAbsentCount = Attendance::whereDate('attendance_date', $now->toDateString())
                ->where('status', 'غائب')
                ->whereHas('student', fn ($q) => $q->whereNull('deleted_at'))
                ->count();

            $totalSurahsCount = Studentachievement::where('type', 'surah_memorized')->count();
            $totalJuzCount = Studentachievement::where('type', 'juz_memorized')->count();

            $halakat = Halakat::whereNull('deleted_at')
                ->with(['teacher', 'activeStudents'])
                ->get();

            $allStudentIds = $halakat->flatMap(fn ($h) => $h->activeStudents->pluck('id'))->unique();

            $attendanceData = collect();
            if ($allStudentIds->isNotEmpty()) {
                $attendanceData = Attendance::whereIn('student_id', $allStudentIds)
                    ->where('attendance_date', '>=', $thisMonthStart)
                    ->select('student_id', 'halakat_id', 'status', 'excused_reason', 'attendance_date')
                    ->get()
                    ->groupBy(fn ($a) => $a->student_id.'_'.$a->halakat_id);
            }

            $halqaAttendanceData = collect();
            if ($allStudentIds->isNotEmpty()) {
                $halqaAttendanceData = Attendance::whereIn('student_id', $allStudentIds)
                    ->select('student_id', 'halakat_id', 'status')
                    ->get()
                    ->groupBy(fn ($a) => $a->student_id.'_'.$a->halakat_id);
            }

            $allStudents = $halakat->flatMap(fn ($h) => $h->activeStudents)->keyBy('id');

            $allAttendanceByStudent = collect();
            if ($allStudentIds->isNotEmpty()) {
                $allAttendanceByStudent = Attendance::whereIn('student_id', $allStudentIds)
                    ->select('student_id', 'status')
                    ->get()
                    ->groupBy('student_id');
            }

            $committedStudents = collect();
            foreach ($allStudents as $student) {
                $records = $allAttendanceByStudent->get($student->id, collect());
                $present = $records->where('status', 'حاضر')->count();
                $absent = $records->where('status', 'غائب')->count();
                $total = $records->count();
                $pct = $total > 0 ? round(($present / $total) * 100) : 0;
                $committedStudents->push((object) [
                    'student' => $student,
                    'present' => $present,
                    'absent' => $absent,
                    'percentage' => $pct,
                ]);
            }
            $committedStudents = $committedStudents->sortByDesc('percentage')->values();

            $ageGroups = ['under8' => 0, 'bet8_12' => 0, 'bet12_18' => 0, 'over18' => 0];
            foreach ($allStudents as $student) {
                $age = $student->birth_date ? Carbon::parse($student->birth_date)->diffInYears($now) : null;
                if ($age === null) {
                    continue;
                }
                if ($age < 8) {
                    $ageGroups['under8']++;
                } elseif ($age <= 12) {
                    $ageGroups['bet8_12']++;
                } elseif ($age <= 18) {
                    $ageGroups['bet12_18']++;
                } else {
                    $ageGroups['over18']++;
                }
            }

            $recentSurahs = Studentachievement::where('type', 'surah_memorized')
                ->whereHas('student', fn ($q) => $q->whereNull('deleted_at'))
                ->whereIn('id', function ($q) {
                    $q->select(\DB::raw('MAX(id)'))
                        ->from('student_achievements')
                        ->where('type', 'surah_memorized')
                        ->groupBy('student_id');
                })
                ->with(['student', 'surah', 'teacher'])
                ->orderBy('achieved_at', 'desc')
                ->get();

            $recentJuz = Studentachievement::where('type', 'juz_memorized')
                ->whereHas('student', fn ($q) => $q->whereNull('deleted_at'))
                ->whereIn('id', function ($q) {
                    $q->select(\DB::raw('MAX(id)'))
                        ->from('student_achievements')
                        ->where('type', 'juz_memorized')
                        ->groupBy('student_id');
                })
                ->with(['student', 'teacher'])
                ->orderBy('achieved_at', 'desc')
                ->get();

            $juzProgress = Studentachievement::where('type', 'juz_memorized')
                ->whereHas('student', fn ($q) => $q->whereNull('deleted_at'))
                ->with('student')
                ->get()
                ->groupBy('juz_number')
                ->sortKeys();

            return compact(
                'activeStudentsCount',
                'activeTeachersCount',
                'activeHalakatCount',
                'withoutHalqaCount',
                'todayAttendanceCount',
                'todayAbsentCount',
                'totalSurahsCount',
                'totalJuzCount',
                'halakat',
                'attendanceData',
                'halqaAttendanceData',
                'allStudents',
                'allAttendanceByStudent',
                'committedStudents',
                'ageGroups',
                'recentSurahs',
                'recentJuz',
                'juzProgress',
            );
        });
    }

    private function getWithoutHalqaCount(): int
    {
        return User::where('role', 'student')
            ->whereNull('deleted_at')
            ->where(function ($q) {
                $q->whereDoesntHave('activeEnrollment')
                    ->orWhereHas('activeEnrollment.halqa', fn ($hq) => $hq->onlyTrashed());
            })
            ->count();
    }
}

<?php

namespace Database\Seeders;

use App\Models\Studentachievement;
use App\Models\Surah;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StudentAchievementsTableSeeder extends Seeder
{
    public function run(): void
    {
        // Clear existing records
        DB::table('student_achievements')->truncate();

        // 1. Auto-generate surah achievements from quran_progress records
        // where memorize_type = 'حفظ' AND to_aya = surah.aya_count
        $progressRecords = DB::table('quran_progress')
            ->where('memorize_type', 'حفظ')
            ->get();

        foreach ($progressRecords as $progress) {
            $surah = Surah::find($progress->surah_id);
            if (! $surah || (int) $progress->to_aya !== (int) $surah->aya_count) {
                continue;
            }

            // Check for duplicate
            $exists = Studentachievement::where('student_id', $progress->student_id)
                ->where('type', 'surah_memorized')
                ->where('surah_id', $progress->surah_id)
                ->exists();

            if ($exists) {
                continue;
            }

            Studentachievement::create([
                'student_id' => $progress->student_id,
                'teacher_id' => $progress->teacher_id,
                'halakat_id' => $progress->halakat_id,
                'type' => 'surah_memorized',
                'surah_id' => $progress->surah_id,
                'juz_number' => null,
                'achieved_at' => $progress->date,
            ]);
        }

        // 2. Seed some juz achievements manually
        $teachers = DB::table('users')->where('role', 'teacher')->orderBy('id')->pluck('id')->toArray();
        $halakat = DB::table('halakat')->orderBy('id')->pluck('id')->toArray();
        $students = DB::table('users')->where('role', 'student')->orderBy('id')->pluck('id')->toArray();

        $juzAchievements = [
            ['student_idx' => 0, 'juz' => 30, 'halakat_idx' => 0, 'teacher_idx' => 0, 'date' => '2026-03-15'],
            ['student_idx' => 4, 'juz' => 30, 'halakat_idx' => 2, 'teacher_idx' => 2, 'date' => '2026-03-20'],
            ['student_idx' => 7, 'juz' => 30, 'halakat_idx' => 3, 'teacher_idx' => 3, 'date' => '2026-04-10'],
            ['student_idx' => 12, 'juz' => 30, 'halakat_idx' => 6, 'teacher_idx' => 6, 'date' => '2026-03-25'],
            ['student_idx' => 14, 'juz' => 30, 'halakat_idx' => 7, 'teacher_idx' => 7, 'date' => '2026-03-20'],
        ];

        foreach ($juzAchievements as $achievement) {
            $exists = Studentachievement::where('student_id', $students[$achievement['student_idx']])
                ->where('type', 'juz_memorized')
                ->where('juz_number', $achievement['juz'])
                ->exists();

            if (! $exists) {
                Studentachievement::create([
                    'student_id' => $students[$achievement['student_idx']],
                    'teacher_id' => $teachers[$achievement['teacher_idx']],
                    'halakat_id' => $halakat[$achievement['halakat_idx']],
                    'type' => 'juz_memorized',
                    'surah_id' => null,
                    'juz_number' => $achievement['juz'],
                    'achieved_at' => $achievement['date'],
                ]);
            }
        }
    }
}

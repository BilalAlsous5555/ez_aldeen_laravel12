<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class QuranProgressTableSeeder extends Seeder
{
    public function run(): void
    {
        // Get student IDs
        $students = DB::table('users')->where('role', 'student')->pluck('id')->toArray();

        // Get halakat IDs
        $halakat = DB::table('halakat')->pluck('id')->toArray();

        // Get teacher IDs
        $teachers = DB::table('users')->where('role', 'teacher')->pluck('id')->toArray();

        $progress = [
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'ممتاز', 'notes' => 'أحسنت', 'date' => '2026-04-01'],
            ['student_id' => $students[1], 'halakat_id' => $halakat[1], 'teacher_id' => $teachers[1], 'surah_id' => 2, 'quran_page_number' => 2, 'from_aya' => 1, 'to_aya' => 20, 'evaluation' => 'جيد', 'notes' => 'يحتاج مراجعة', 'date' => '2026-04-02'],
            ['student_id' => $students[2], 'halakat_id' => $halakat[2], 'teacher_id' => $teachers[2], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'ممتاز', 'notes' => 'ممتاز', 'date' => '2026-04-03'],
            ['student_id' => $students[3], 'halakat_id' => $halakat[3], 'teacher_id' => $teachers[3], 'surah_id' => 113, 'quran_page_number' => 603, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'جيد', 'notes' => 'تحتاج تحسين', 'date' => '2026-04-04'],
            ['student_id' => $students[4], 'halakat_id' => $halakat[4], 'teacher_id' => $teachers[4], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'ممتاز', 'notes' => 'استمر', 'date' => '2026-04-05'],
            ['student_id' => $students[5], 'halakat_id' => $halakat[5], 'teacher_id' => $teachers[5], 'surah_id' => 36, 'quran_page_number' => 442, 'from_aya' => 1, 'to_aya' => 30, 'evaluation' => 'جيد', 'notes' => null, 'date' => '2026-04-06'],
            ['student_id' => $students[6], 'halakat_id' => $halakat[6], 'teacher_id' => $teachers[6], 'surah_id' => 114, 'quran_page_number' => 604, 'from_aya' => 1, 'to_aya' => 6, 'evaluation' => 'اعادة', 'notes' => 'يحتاج مزيد من العمل', 'date' => '2026-04-07'],
            ['student_id' => $students[7], 'halakat_id' => $halakat[7], 'teacher_id' => $teachers[7], 'surah_id' => 67, 'quran_page_number' => 562, 'from_aya' => 1, 'to_aya' => 15, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-04-08'],
            ['student_id' => $students[8], 'halakat_id' => $halakat[8], 'teacher_id' => $teachers[8], 'surah_id' => 55, 'quran_page_number' => 531, 'from_aya' => 1, 'to_aya' => 20, 'evaluation' => 'جيد', 'notes' => 'أداء جيد', 'date' => '2026-04-09'],
            ['student_id' => $students[9], 'halakat_id' => $halakat[9], 'teacher_id' => $teachers[9], 'surah_id' => 18, 'quran_page_number' => 293, 'from_aya' => 1, 'to_aya' => 31, 'evaluation' => 'جيد', 'notes' => 'يحتاج تمرين أكثر', 'date' => '2026-04-10'],
        ];

        DB::table('quran_progress')->insert($progress);
    }
}

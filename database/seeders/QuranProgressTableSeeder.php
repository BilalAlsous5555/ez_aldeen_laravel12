<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class QuranProgressTableSeeder extends Seeder
{
    public function run(): void
    {
        $students = DB::table('users')->where('role', 'student')->orderBy('id')->pluck('id')->toArray();
        $teachers = DB::table('users')->where('role', 'teacher')->orderBy('id')->pluck('id')->toArray();
        $halakat = DB::table('halakat')->orderBy('id')->pluck('id')->toArray();

        $evaluations = ['ممتاز', 'جيد جدا', 'جيد', 'اعادة'];

        $progress = [
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'ممتاز', 'notes' => 'أحسنت', 'date' => '2026-03-01'],
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 2, 'quran_page_number' => 5, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'جيد جدا', 'notes' => 'بداية جيدة', 'date' => '2026-03-15'],
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 2, 'quran_page_number' => 10, 'from_aya' => 60, 'to_aya' => 65, 'evaluation' => 'جيد', 'notes' => 'يحتاج مراجعة التجويد', 'date' => '2026-04-01'],
            ['student_id' => $students[1], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'جيد جدا', 'notes' => 'تلاوة واضحة', 'date' => '2026-03-05'],
            ['student_id' => $students[1], 'halakat_id' => $halakat[0], 'teacher_id' => $teachers[0], 'surah_id' => 2, 'quran_page_number' => 2, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-03-20'],
            ['student_id' => $students[2], 'halakat_id' => $halakat[1], 'teacher_id' => $teachers[1], 'surah_id' => 36, 'quran_page_number' => 442, 'from_aya' => 1, 'to_aya' => 10, 'evaluation' => 'ممتاز', 'notes' => 'حفظ رائع', 'date' => '2026-03-01'],
            ['student_id' => $students[2], 'halakat_id' => $halakat[1], 'teacher_id' => $teachers[1], 'surah_id' => 36, 'quran_page_number' => 443, 'from_aya' => 11, 'to_aya' => 20, 'evaluation' => 'جيد جدا', 'notes' => 'استمر', 'date' => '2026-03-18'],
            ['student_id' => $students[3], 'halakat_id' => $halakat[1], 'teacher_id' => $teachers[1], 'surah_id' => 67, 'quran_page_number' => 562, 'from_aya' => 1, 'to_aya' => 15, 'evaluation' => 'جيد', 'notes' => 'تحتاج تحسين', 'date' => '2026-03-10'],
            ['student_id' => $students[3], 'halakat_id' => $halakat[1], 'teacher_id' => $teachers[1], 'surah_id' => 67, 'quran_page_number' => 562, 'from_aya' => 16, 'to_aya' => 30, 'evaluation' => 'جيد جدا', 'notes' => 'تحسن ملحوظ', 'date' => '2026-04-01'],
            ['student_id' => $students[4], 'halakat_id' => $halakat[2], 'teacher_id' => $teachers[2], 'surah_id' => 113, 'quran_page_number' => 603, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'ممتاز', 'notes' => 'إتقان كامل', 'date' => '2026-03-01'],
            ['student_id' => $students[4], 'halakat_id' => $halakat[2], 'teacher_id' => $teachers[2], 'surah_id' => 114, 'quran_page_number' => 604, 'from_aya' => 1, 'to_aya' => 6, 'evaluation' => 'ممتاز', 'notes' => 'أحسنت', 'date' => '2026-03-15'],
            ['student_id' => $students[5], 'halakat_id' => $halakat[2], 'teacher_id' => $teachers[2], 'surah_id' => 55, 'quran_page_number' => 531, 'from_aya' => 1, 'to_aya' => 20, 'evaluation' => 'جيد', 'notes' => 'يحتاج تمرين أكثر', 'date' => '2026-03-05'],
            ['student_id' => $students[5], 'halakat_id' => $halakat[2], 'teacher_id' => $teachers[2], 'surah_id' => 55, 'quran_page_number' => 532, 'from_aya' => 21, 'to_aya' => 40, 'evaluation' => 'جيد', 'notes' => 'التركيز على المخارج', 'date' => '2026-03-22'],
            ['student_id' => $students[6], 'halakat_id' => $halakat[3], 'teacher_id' => $teachers[3], 'surah_id' => 18, 'quran_page_number' => 293, 'from_aya' => 1, 'to_aya' => 15, 'evaluation' => 'جيد جدا', 'notes' => 'أداء جيد', 'date' => '2026-03-01'],
            ['student_id' => $students[6], 'halakat_id' => $halakat[3], 'teacher_id' => $teachers[3], 'surah_id' => 18, 'quran_page_number' => 295, 'from_aya' => 25, 'to_aya' => 40, 'evaluation' => 'ممتاز', 'notes' => 'تقدم ممتاز', 'date' => '2026-03-20'],
            ['student_id' => $students[7], 'halakat_id' => $halakat[3], 'teacher_id' => $teachers[3], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'جيد', 'notes' => 'يحتاج ممارسة أكثر', 'date' => '2026-03-12'],
            ['student_id' => $students[7], 'halakat_id' => $halakat[3], 'teacher_id' => $teachers[3], 'surah_id' => 109, 'quran_page_number' => 599, 'from_aya' => 1, 'to_aya' => 6, 'evaluation' => 'جيد جدا', 'notes' => 'أحسن الحفظ', 'date' => '2026-04-05'],
            ['student_id' => $students[8], 'halakat_id' => $halakat[4], 'teacher_id' => $teachers[4], 'surah_id' => 78, 'quran_page_number' => 582, 'from_aya' => 1, 'to_aya' => 20, 'evaluation' => 'اعادة', 'notes' => 'يحتاج مزيد من العمل', 'date' => '2026-03-01'],
            ['student_id' => $students[8], 'halakat_id' => $halakat[4], 'teacher_id' => $teachers[4], 'surah_id' => 78, 'quran_page_number' => 582, 'from_aya' => 21, 'to_aya' => 40, 'evaluation' => 'جيد', 'notes' => 'تحسن بعد المراجعة', 'date' => '2026-03-18'],
            ['student_id' => $students[9], 'halakat_id' => $halakat[4], 'teacher_id' => $teachers[4], 'surah_id' => 112, 'quran_page_number' => 602, 'from_aya' => 1, 'to_aya' => 4, 'evaluation' => 'ممتاز', 'notes' => 'حفظ ممتاز', 'date' => '2026-03-10'],
            ['student_id' => $students[9], 'halakat_id' => $halakat[4], 'teacher_id' => $teachers[4], 'surah_id' => 113, 'quran_page_number' => 603, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'ممتاز', 'notes' => 'استمر', 'date' => '2026-04-01'],
            ['student_id' => $students[10], 'halakat_id' => $halakat[5], 'teacher_id' => $teachers[5], 'surah_id' => 2, 'quran_page_number' => 21, 'from_aya' => 142, 'to_aya' => 150, 'evaluation' => 'جيد جدا', 'notes' => 'تقدم جيد', 'date' => '2026-03-01'],
            ['student_id' => $students[10], 'halakat_id' => $halakat[5], 'teacher_id' => $teachers[5], 'surah_id' => 2, 'quran_page_number' => 23, 'from_aya' => 155, 'to_aya' => 162, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-03-20'],
            ['student_id' => $students[11], 'halakat_id' => $halakat[5], 'teacher_id' => $teachers[5], 'surah_id' => 3, 'quran_page_number' => 62, 'from_aya' => 1, 'to_aya' => 10, 'evaluation' => 'جيد', 'notes' => 'يحتاج تركيز', 'date' => '2026-03-15'],
            ['student_id' => $students[11], 'halakat_id' => $halakat[5], 'teacher_id' => $teachers[5], 'surah_id' => 3, 'quran_page_number' => 63, 'from_aya' => 11, 'to_aya' => 20, 'evaluation' => 'جيد جدا', 'notes' => 'تحسن واضح', 'date' => '2026-04-01'],
            ['student_id' => $students[12], 'halakat_id' => $halakat[6], 'teacher_id' => $teachers[6], 'surah_id' => 87, 'quran_page_number' => 591, 'from_aya' => 1, 'to_aya' => 19, 'evaluation' => 'ممتاز', 'notes' => 'أحسنت', 'date' => '2026-03-05'],
            ['student_id' => $students[12], 'halakat_id' => $halakat[6], 'teacher_id' => $teachers[6], 'surah_id' => 88, 'quran_page_number' => 592, 'from_aya' => 1, 'to_aya' => 26, 'evaluation' => 'جيد جدا', 'notes' => 'عمل ممتاز', 'date' => '2026-03-22'],
            ['student_id' => $students[13], 'halakat_id' => $halakat[6], 'teacher_id' => $teachers[6], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'اعادة', 'notes' => 'يحتاج مراجعة الفاتحة', 'date' => '2026-03-10'],
            ['student_id' => $students[13], 'halakat_id' => $halakat[6], 'teacher_id' => $teachers[6], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'جيد', 'notes' => 'تحسن بعد المراجعة', 'date' => '2026-04-01'],
            ['student_id' => $students[14], 'halakat_id' => $halakat[7], 'teacher_id' => $teachers[7], 'surah_id' => 111, 'quran_page_number' => 599, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-03-01'],
            ['student_id' => $students[14], 'halakat_id' => $halakat[7], 'teacher_id' => $teachers[7], 'surah_id' => 112, 'quran_page_number' => 602, 'from_aya' => 1, 'to_aya' => 4, 'evaluation' => 'ممتاز', 'notes' => 'أداء رائع', 'date' => '2026-03-18'],
            ['student_id' => $students[15], 'halakat_id' => $halakat[7], 'teacher_id' => $teachers[7], 'surah_id' => 103, 'quran_page_number' => 598, 'from_aya' => 1, 'to_aya' => 3, 'evaluation' => 'جيد جدا', 'notes' => 'جيد', 'date' => '2026-03-25'],
            ['student_id' => $students[15], 'halakat_id' => $halakat[7], 'teacher_id' => $teachers[7], 'surah_id' => 104, 'quran_page_number' => 598, 'from_aya' => 1, 'to_aya' => 9, 'evaluation' => 'جيد', 'notes' => 'يحتاج تحسين النطق', 'date' => '2026-04-05'],
            ['student_id' => $students[16], 'halakat_id' => $halakat[8], 'teacher_id' => $teachers[8], 'surah_id' => 56, 'quran_page_number' => 535, 'from_aya' => 1, 'to_aya' => 30, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-03-01'],
            ['student_id' => $students[16], 'halakat_id' => $halakat[8], 'teacher_id' => $teachers[8], 'surah_id' => 56, 'quran_page_number' => 537, 'from_aya' => 31, 'to_aya' => 60, 'evaluation' => 'جيد جدا', 'notes' => 'استمر', 'date' => '2026-03-20'],
            ['student_id' => $students[17], 'halakat_id' => $halakat[8], 'teacher_id' => $teachers[8], 'surah_id' => 110, 'quran_page_number' => 600, 'from_aya' => 1, 'to_aya' => 3, 'evaluation' => 'جيد', 'notes' => 'بداية جيدة', 'date' => '2026-03-28'],
            ['student_id' => $students[17], 'halakat_id' => $halakat[8], 'teacher_id' => $teachers[8], 'surah_id' => 109, 'quran_page_number' => 599, 'from_aya' => 1, 'to_aya' => 6, 'evaluation' => 'جيد جدا', 'notes' => 'أداء جيد', 'date' => '2026-04-10'],
            ['student_id' => $students[18], 'halakat_id' => $halakat[9], 'teacher_id' => $teachers[9], 'surah_id' => 14, 'quran_page_number' => 255, 'from_aya' => 1, 'to_aya' => 15, 'evaluation' => 'جيد', 'notes' => 'يحتاج مراجعة', 'date' => '2026-03-05'],
            ['student_id' => $students[18], 'halakat_id' => $halakat[9], 'teacher_id' => $teachers[9], 'surah_id' => 14, 'quran_page_number' => 256, 'from_aya' => 16, 'to_aya' => 30, 'evaluation' => 'جيد جدا', 'notes' => 'تحسن', 'date' => '2026-03-25'],
            ['student_id' => $students[19], 'halakat_id' => $halakat[9], 'teacher_id' => $teachers[9], 'surah_id' => 1, 'quran_page_number' => 1, 'from_aya' => 1, 'to_aya' => 7, 'evaluation' => 'ممتاز', 'notes' => 'حفظ متقن', 'date' => '2026-03-15'],
            ['student_id' => $students[19], 'halakat_id' => $halakat[9], 'teacher_id' => $teachers[9], 'surah_id' => 2, 'quran_page_number' => 2, 'from_aya' => 1, 'to_aya' => 5, 'evaluation' => 'جيد جدا', 'notes' => 'استمر', 'date' => '2026-04-01'],
        ];

        $timestamps = ['created_at' => now(), 'updated_at' => now()];
        DB::table('quran_progress')->insert(array_map(fn ($p) => $p + $timestamps, $progress));
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NotesTableSeeder extends Seeder
{
    public function run(): void
    {
        // Get student IDs
        $students = DB::table('users')->where('role', 'student')->pluck('id')->toArray();

        // Get teacher and admin IDs for sender_id
        $admin = DB::table('users')->where('role', 'admin')->first()->id;
        $teachers = DB::table('users')->where('role', 'teacher')->pluck('id')->toArray();

        // Get halakat IDs
        $halakat = DB::table('halakat')->pluck('id')->toArray();

        $notes = [
            ['student_id' => $students[0], 'sender_id' => $teachers[0], 'halakat_id' => $halakat[0], 'content' => 'أداء ممتاز في الحفظ، استمر على هذا المستوى'],
            ['student_id' => $students[1], 'sender_id' => $teachers[1], 'halakat_id' => $halakat[1], 'content' => 'تحتاج إلى مراجعة سورة البقرة'],
            ['student_id' => $students[2], 'sender_id' => $teachers[2], 'halakat_id' => $halakat[2], 'content' => 'ممتاز! أتممت حفظ سورة يس بإتقان'],
            ['student_id' => $students[3], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تم ترقية الطالب إلى المستوى المتقدم'],
            ['student_id' => $students[4], 'sender_id' => $teachers[4], 'halakat_id' => $halakat[4], 'content' => 'النطق يحتاج تحسين في بعض الكلمات'],
            ['student_id' => $students[5], 'sender_id' => $teachers[5], 'halakat_id' => $halakat[5], 'content' => 'يحتاج مزيد من الجهد في الحفظ'],
            ['student_id' => $students[6], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تقرر منح الطالب شهادة تقدير'],
            ['student_id' => $students[7], 'sender_id' => $teachers[7], 'halakat_id' => $halakat[7], 'content' => 'حفظ رائع، استمر على هذا النهج'],
            ['student_id' => $students[8], 'sender_id' => $teachers[8], 'halakat_id' => $halakat[8], 'content' => 'تحسن ملحوظ في التلاوة والتجويد'],
            ['student_id' => $students[9], 'sender_id' => $teachers[9], 'halakat_id' => $halakat[9], 'content' => 'يحتاج إلى التركيز على مخارج الحروف'],
        ];

        DB::table('notes')->insert($notes);
    }
}

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
            ['student_id' => $students[0], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تم ترقية الطالب إلى المستوى المتقدم'],
            ['student_id' => $students[1], 'sender_id' => $teachers[1], 'halakat_id' => $halakat[2], 'content' => 'تحتاج إلى مراجعة سورة البقرة'],
            ['student_id' => $students[1], 'sender_id' => $teachers[1], 'halakat_id' => $halakat[2], 'content' => 'النطق يحتاج تحسين في بعض الكلمات'],
            ['student_id' => $students[2], 'sender_id' => $teachers[2], 'halakat_id' => $halakat[4], 'content' => 'ممتاز! أتممت حفظ سورة يس بإتقان'],
            ['student_id' => $students[2], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تقرر منح الطالب شهادة تقدير'],
            ['student_id' => $students[0], 'sender_id' => $teachers[2], 'halakat_id' => $halakat[6], 'content' => 'يحتاج مزيد من الجهد في الحفظ'],
        ];

        DB::table('notes')->insert($notes);
    }
}

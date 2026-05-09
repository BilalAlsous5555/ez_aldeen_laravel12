<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NotesTableSeeder extends Seeder
{
    public function run(): void
    {
        $students = DB::table('users')->where('role', 'student')->orderBy('id')->pluck('id')->toArray();
        $admin = DB::table('users')->where('role', 'admin')->first()->id;
        $teachers = DB::table('users')->where('role', 'teacher')->orderBy('id')->pluck('id')->toArray();
        $halakat = DB::table('halakat')->orderBy('id')->pluck('id')->toArray();

        $notes = [
            ['student_id' => $students[0], 'sender_id' => $teachers[0], 'halakat_id' => $halakat[0], 'content' => 'أداء ممتاز في الحفظ، استمر على هذا المستوى'],
            ['student_id' => $students[1], 'sender_id' => $teachers[0], 'halakat_id' => $halakat[0], 'content' => 'تحتاج إلى مراجعة سورة البقرة أكثر'],
            ['student_id' => $students[2], 'sender_id' => $teachers[1], 'halakat_id' => $halakat[1], 'content' => 'ممتاز! أتممت حفظ سورة يس بإتقان'],
            ['student_id' => $students[3], 'sender_id' => $teachers[1], 'halakat_id' => $halakat[1], 'content' => 'تحسن واضح في التلاوة والتجويد'],
            ['student_id' => $students[4], 'sender_id' => $teachers[2], 'halakat_id' => $halakat[2], 'content' => 'تم ترقية الطالب إلى المستوى المتقدم'],
            ['student_id' => $students[5], 'sender_id' => $teachers[2], 'halakat_id' => $halakat[2], 'content' => 'يحتاج مزيد من الجهد في حفظ سورة الرحمن'],
            ['student_id' => $students[6], 'sender_id' => $teachers[3], 'halakat_id' => $halakat[3], 'content' => 'النطق يحتاج تحسين في بعض الكلمات'],
            ['student_id' => $students[7], 'sender_id' => $teachers[3], 'halakat_id' => $halakat[3], 'content' => 'تقرر منح الطالب شهادة تقدير'],
            ['student_id' => $students[8], 'sender_id' => $teachers[4], 'halakat_id' => $halakat[4], 'content' => 'حفظ رائع لسورة النبأ، استمر على هذا النهج'],
            ['student_id' => $students[9], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تم قبول الطالب في برنامج التحفيظ المكثف'],
            ['student_id' => $students[10], 'sender_id' => $teachers[5], 'halakat_id' => $halakat[5], 'content' => 'تقدم ممتاز في حفظ سورة البقرة'],
            ['student_id' => $students[11], 'sender_id' => $teachers[5], 'halakat_id' => $halakat[5], 'content' => 'يحتاج التركيز على مخارج الحروف'],
            ['student_id' => $students[12], 'sender_id' => $teachers[6], 'halakat_id' => $halakat[6], 'content' => 'أداء ممتاز في حفظ الجزء الثلاثون'],
            ['student_id' => $students[13], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تم تحويل الطالب إلى حلقة أخرى لتحسين المستوى'],
            ['student_id' => $students[14], 'sender_id' => $teachers[7], 'halakat_id' => $halakat[7], 'content' => 'حفظ متقن للسور القصيرة'],
            ['student_id' => $students[15], 'sender_id' => $teachers[7], 'halakat_id' => $halakat[7], 'content' => 'يحتاج تحسين سرعة التلاوة'],
            ['student_id' => $students[16], 'sender_id' => $teachers[8], 'halakat_id' => $halakat[8], 'content' => 'تقدم ملحوظ في حفظ سورة الواقعة'],
            ['student_id' => $students[17], 'sender_id' => $teachers[8], 'halakat_id' => $halakat[8], 'content' => 'بداية جيدة في حفظ القرآن، شجعه في البيت'],
            ['student_id' => $students[18], 'sender_id' => $teachers[9], 'halakat_id' => $halakat[9], 'content' => 'يحتاج مراجعة يومية لسورة إبراهيم'],
            ['student_id' => $students[19], 'sender_id' => $teachers[9], 'halakat_id' => $halakat[9], 'content' => 'حفظ ممتاز لسورة الفاتحة والبقرة'],
            ['student_id' => $students[2], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'طالب متميز يُرشح للمشاركة في مسابقة حفظ القرآن'],
            ['student_id' => $students[6], 'sender_id' => $teachers[3], 'halakat_id' => $halakat[3], 'content' => 'انضباط ممتاز في الحضور والمراجعة'],
            ['student_id' => $students[10], 'sender_id' => $teachers[5], 'halakat_id' => $halakat[5], 'content' => 'يحتاج مراجعة الآيات المنسوخة في سورة البقرة'],
            ['student_id' => $students[14], 'sender_id' => $admin, 'halakat_id' => null, 'content' => 'تم منحه شهادة تقدير لحفظه الجزء الثلاثون'],
            ['student_id' => $students[16], 'sender_id' => $teachers[8], 'halakat_id' => $halakat[8], 'content' => 'أخوه الأكبر يشرفه ويساعده في المراجعة'],
        ];

        DB::table('notes')->insert($notes);
    }
}

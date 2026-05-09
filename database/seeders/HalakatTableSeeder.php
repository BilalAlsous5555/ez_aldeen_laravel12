<?php

namespace Database\Seeders;

use App\Models\Halakat;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HalakatTableSeeder extends Seeder
{
    public function run(): void
    {
        $teachers = DB::table('users')->where('role', 'teacher')->pluck('id')->toArray();

        $halakat = [
            ['name' => 'حلقة الفجر', 'teacher_id' => $teachers[0], 'notes' => 'حلقة الصباح الباكر'],
            ['name' => 'حلقة التحفيظ الصباحية', 'teacher_id' => $teachers[1], 'notes' => 'للمبتدئين'],
            ['name' => 'حلقة المراجعة', 'teacher_id' => $teachers[2], 'notes' => 'للمتقدمين'],
            ['name' => 'حلقة التجويد', 'teacher_id' => $teachers[3], 'notes' => 'تجويد وترتيل'],
            ['name' => 'حلقة حفظ المختصر', 'teacher_id' => $teachers[4], 'notes' => null],
            ['name' => 'حلقة التميز', 'teacher_id' => $teachers[5], 'notes' => 'طلاب متفوقون'],
            ['name' => 'حلقة النور', 'teacher_id' => $teachers[6], 'notes' => null],
            ['name' => 'حلقة الرحمة', 'teacher_id' => $teachers[7], 'notes' => 'للأطفال'],
            ['name' => 'حلقة الفرقان', 'teacher_id' => $teachers[8], 'notes' => 'حفظ القرآن الكريم'],
            ['name' => 'حلقة البركة', 'teacher_id' => $teachers[9], 'notes' => 'للمبتدئين'],
            ['name' => 'حلقة الهدى', 'teacher_id' => $teachers[10], 'notes' => 'تجويد وحفظ'],
            ['name' => 'حلقة الحكمة', 'teacher_id' => $teachers[11], 'notes' => 'للمراجعة المتقدمة'],
            ['name' => 'حلقة الصبر', 'teacher_id' => $teachers[12], 'notes' => null],
            ['name' => 'حلقة الشكر', 'teacher_id' => $teachers[13], 'notes' => 'للإتقان'],
            ['name' => 'حلقة الإخلاص', 'teacher_id' => $teachers[14], 'notes' => 'لحفاظ الجزء الثلاثون'],
            ['name' => 'حلقة التوبة', 'teacher_id' => null, 'notes' => 'بانتظار مدرس'],
            ['name' => 'حلقة الاستقامة', 'teacher_id' => null, 'notes' => null],
            ['name' => 'حلقة التقوى', 'teacher_id' => null, 'notes' => 'حلقة جديدة'],
            ['name' => 'حلقة الورع', 'teacher_id' => null, 'notes' => 'قيد التأسيس'],
            ['name' => 'حلقة اليقين', 'teacher_id' => null, 'notes' => null],
        ];

        foreach ($halakat as $halqa) {
            Halakat::create($halqa);
        }
    }
}

<?php

namespace Database\Seeders;

use App\Models\Halakat;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HalakatTableSeeder extends Seeder
{
    public function run(): void
    {
        // Get teacher IDs (users with role 'teacher')
        $teachers = DB::table('users')->where('role', 'teacher')->pluck('id')->toArray();

        $halakat = [
            ['name' => 'حلقة التحفيظ الصباحية', 'teacher_id' => $teachers[0], 'notes' => 'للمبتدئين'],
            ['name' => 'حلقة المراجعة', 'teacher_id' => $teachers[1], 'notes' => 'للمتقدمين'],
            ['name' => 'حلقة التجويد', 'teacher_id' => $teachers[2], 'notes' => 'تجويد وترتيل'],
            ['name' => 'حلقة حفظ المختصر', 'teacher_id' => $teachers[3], 'notes' => null],
            ['name' => 'حلقة التميز', 'teacher_id' => $teachers[4], 'notes' => 'طلاب متفوقون'],
            ['name' => 'حلقة النور', 'teacher_id' => $teachers[5], 'notes' => null],
            ['name' => 'حلقة الرحمة', 'teacher_id' => $teachers[6], 'notes' => 'للأطفال'],
            ['name' => 'حلقة الفرقان', 'teacher_id' => $teachers[7], 'notes' => 'حفظ القرآن الكريم'],
            ['name' => 'حلقة البركة', 'teacher_id' => $teachers[8], 'notes' => 'للمبتدئين'],
            ['name' => 'حلقة الهدى', 'teacher_id' => $teachers[9], 'notes' => 'تجويد وحفظ'],
        ];

        foreach ($halakat as $halqa) {
            Halakat::create($halqa);
        }
    }
}

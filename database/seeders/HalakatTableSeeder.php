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
            ['name' => 'حلقة المراجعة', 'teacher_id' => $teachers[0], 'notes' => 'للمتقدمين'],
            ['name' => 'حلقة التجويد', 'teacher_id' => $teachers[1], 'notes' => 'تجويد وترتيل'],
            ['name' => 'حلقة حفظ المختصر', 'teacher_id' => $teachers[1], 'notes' => null],
            ['name' => 'حلقة التميز', 'teacher_id' => $teachers[2], 'notes' => 'طلاب متفوقون'],
            ['name' => 'حلقة النور', 'teacher_id' => $teachers[2], 'notes' => null],
            ['name' => 'حلقة الرحمة', 'teacher_id' => $teachers[2], 'notes' => 'للأطفال'],
        ];

        foreach ($halakat as $halqa) {
            Halakat::create($halqa);
        }
    }
}

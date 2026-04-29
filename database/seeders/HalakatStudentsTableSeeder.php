<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HalakatStudentsTableSeeder extends Seeder
{
    public function run(): void
    {
        $students = DB::table('users')->where('role', 'student')->pluck('id')->toArray();
        $halakat = DB::table('halakat')->pluck('id')->toArray();

        $enrollments = [
            [
                'student_id' => $students[0],
                'halakat_id' => $halakat[0],
                'joined_at' => '2025-09-01',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[0],
                'halakat_id' => $halakat[1],
                'joined_at' => '2024-09-01',
                'left_at' => '2025-08-31',
                'is_active' => false,
            ],
            [
                'student_id' => $students[1],
                'halakat_id' => $halakat[2],
                'joined_at' => '2025-10-01',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[1],
                'halakat_id' => $halakat[0],
                'joined_at' => '2025-01-15',
                'left_at' => '2025-09-30',
                'is_active' => false,
            ],
            [
                'student_id' => $students[2],
                'halakat_id' => $halakat[4],
                'joined_at' => '2025-08-15',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[2],
                'halakat_id' => $halakat[5],
                'joined_at' => '2025-02-01',
                'left_at' => '2025-08-14',
                'is_active' => false,
            ],
            [
                'student_id' => $students[0],
                'halakat_id' => $halakat[6],
                'joined_at' => '2026-01-15',
                'left_at' => '2026-04-01',
                'is_active' => false,
            ],
        ];

        foreach ($enrollments as $enrollment) {
            DB::table('halakat_students')->insert($enrollment);
        }
    }
}

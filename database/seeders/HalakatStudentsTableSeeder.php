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
                'student_id' => $students[1],
                'halakat_id' => $halakat[1],
                'joined_at' => '2025-09-01',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[2],
                'halakat_id' => $halakat[2],
                'joined_at' => '2025-10-01',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[3],
                'halakat_id' => $halakat[3],
                'joined_at' => '2025-09-15',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[4],
                'halakat_id' => $halakat[4],
                'joined_at' => '2025-08-15',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[5],
                'halakat_id' => $halakat[5],
                'joined_at' => '2025-10-10',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[6],
                'halakat_id' => $halakat[6],
                'joined_at' => '2025-09-20',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[7],
                'halakat_id' => $halakat[7],
                'joined_at' => '2025-11-01',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[8],
                'halakat_id' => $halakat[8],
                'joined_at' => '2025-10-15',
                'left_at' => null,
                'is_active' => true,
            ],
            [
                'student_id' => $students[9],
                'halakat_id' => $halakat[9],
                'joined_at' => '2025-09-25',
                'left_at' => null,
                'is_active' => true,
            ],
        ];

        foreach ($enrollments as $enrollment) {
            DB::table('halakat_students')->insert($enrollment);
        }
    }
}

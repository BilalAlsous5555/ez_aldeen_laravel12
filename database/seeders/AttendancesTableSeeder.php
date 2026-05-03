<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AttendancesTableSeeder extends Seeder
{
    public function run(): void
    {
        // Get student IDs
        $students = DB::table('users')->where('role', 'student')->pluck('id')->toArray();

        // Get halakat IDs
        $halakat = DB::table('halakat')->pluck('id')->toArray();

        // Get teacher IDs for recorded_by
        $teachers = DB::table('users')->where('role', 'teacher')->pluck('id')->toArray();

        $attendances = [
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-04-01', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[0]],
            ['student_id' => $students[1], 'halakat_id' => $halakat[1], 'attendance_date' => '2026-04-01', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[1]],
            ['student_id' => $students[2], 'halakat_id' => $halakat[2], 'attendance_date' => '2026-04-02', 'status' => 'absent', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[2]],
            ['student_id' => $students[3], 'halakat_id' => $halakat[3], 'attendance_date' => '2026-04-02', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[3]],
            ['student_id' => $students[4], 'halakat_id' => $halakat[4], 'attendance_date' => '2026-04-03', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[4]],
            ['student_id' => $students[5], 'halakat_id' => $halakat[5], 'attendance_date' => '2026-04-03', 'status' => 'absent', 'excused_reason' => 'ظروف عائلية', 'recorded_by' => $teachers[5]],
            ['student_id' => $students[6], 'halakat_id' => $halakat[6], 'attendance_date' => '2026-04-05', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[6]],
            ['student_id' => $students[7], 'halakat_id' => $halakat[7], 'attendance_date' => '2026-04-05', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[7]],
            ['student_id' => $students[8], 'halakat_id' => $halakat[8], 'attendance_date' => '2026-04-06', 'status' => 'present', 'excused_reason' => null, 'recorded_by' => $teachers[8]],
            ['student_id' => $students[9], 'halakat_id' => $halakat[9], 'attendance_date' => '2026-04-06', 'status' => 'absent', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[9]],
        ];

        DB::table('attendances')->insert($attendances);
    }
}

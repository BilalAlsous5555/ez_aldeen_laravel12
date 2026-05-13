<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AttendancesTableSeeder extends Seeder
{
    public function run(): void
    {
        $students = DB::table('users')->where('role', 'student')->orderBy('id')->pluck('id')->toArray();
        $teachers = DB::table('users')->where('role', 'teacher')->orderBy('id')->pluck('id')->toArray();
        $halakat = DB::table('halakat')->orderBy('id')->pluck('id')->toArray();

        $attendances = [
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[0]],
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-03-15', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[0]],
            ['student_id' => $students[0], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-04-01', 'status' => 'غائب', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[0]],
            ['student_id' => $students[1], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-03-05', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[0]],
            ['student_id' => $students[1], 'halakat_id' => $halakat[0], 'attendance_date' => '2026-03-20', 'status' => 'غائب', 'excused_reason' => 'ظروف عائلية', 'recorded_by' => $teachers[0]],
            ['student_id' => $students[2], 'halakat_id' => $halakat[1], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[1]],
            ['student_id' => $students[2], 'halakat_id' => $halakat[1], 'attendance_date' => '2026-03-18', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[1]],
            ['student_id' => $students[3], 'halakat_id' => $halakat[1], 'attendance_date' => '2026-03-10', 'status' => 'غائب', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[1]],
            ['student_id' => $students[3], 'halakat_id' => $halakat[1], 'attendance_date' => '2026-04-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[1]],
            ['student_id' => $students[4], 'halakat_id' => $halakat[2], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[2]],
            ['student_id' => $students[4], 'halakat_id' => $halakat[2], 'attendance_date' => '2026-03-15', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[2]],
            ['student_id' => $students[5], 'halakat_id' => $halakat[2], 'attendance_date' => '2026-03-05', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[2]],
            ['student_id' => $students[5], 'halakat_id' => $halakat[2], 'attendance_date' => '2026-03-22', 'status' => 'غائب', 'excused_reason' => 'سفر', 'recorded_by' => $teachers[2]],
            ['student_id' => $students[6], 'halakat_id' => $halakat[3], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[3]],
            ['student_id' => $students[6], 'halakat_id' => $halakat[3], 'attendance_date' => '2026-03-20', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[3]],
            ['student_id' => $students[7], 'halakat_id' => $halakat[3], 'attendance_date' => '2026-03-12', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[3]],
            ['student_id' => $students[7], 'halakat_id' => $halakat[3], 'attendance_date' => '2026-04-05', 'status' => 'غائب', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[3]],
            ['student_id' => $students[8], 'halakat_id' => $halakat[4], 'attendance_date' => '2026-03-01', 'status' => 'غائب', 'excused_reason' => 'ظروف عائلية', 'recorded_by' => $teachers[4]],
            ['student_id' => $students[8], 'halakat_id' => $halakat[4], 'attendance_date' => '2026-03-18', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[4]],
            ['student_id' => $students[9], 'halakat_id' => $halakat[4], 'attendance_date' => '2026-03-10', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[4]],
            ['student_id' => $students[9], 'halakat_id' => $halakat[4], 'attendance_date' => '2026-04-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[4]],
            ['student_id' => $students[10], 'halakat_id' => $halakat[5], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[5]],
            ['student_id' => $students[10], 'halakat_id' => $halakat[5], 'attendance_date' => '2026-03-20', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[5]],
            ['student_id' => $students[11], 'halakat_id' => $halakat[5], 'attendance_date' => '2026-03-15', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[5]],
            ['student_id' => $students[11], 'halakat_id' => $halakat[5], 'attendance_date' => '2026-04-01', 'status' => 'غائب', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[5]],
            ['student_id' => $students[12], 'halakat_id' => $halakat[6], 'attendance_date' => '2026-03-05', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[6]],
            ['student_id' => $students[12], 'halakat_id' => $halakat[6], 'attendance_date' => '2026-03-22', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[6]],
            ['student_id' => $students[13], 'halakat_id' => $halakat[6], 'attendance_date' => '2026-03-10', 'status' => 'غائب', 'excused_reason' => 'ظروف عائلية', 'recorded_by' => $teachers[6]],
            ['student_id' => $students[13], 'halakat_id' => $halakat[6], 'attendance_date' => '2026-04-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[6]],
            ['student_id' => $students[14], 'halakat_id' => $halakat[7], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[7]],
            ['student_id' => $students[14], 'halakat_id' => $halakat[7], 'attendance_date' => '2026-03-18', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[7]],
            ['student_id' => $students[15], 'halakat_id' => $halakat[7], 'attendance_date' => '2026-03-25', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[7]],
            ['student_id' => $students[15], 'halakat_id' => $halakat[7], 'attendance_date' => '2026-04-05', 'status' => 'غائب', 'excused_reason' => 'سفر', 'recorded_by' => $teachers[7]],
            ['student_id' => $students[16], 'halakat_id' => $halakat[8], 'attendance_date' => '2026-03-01', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[8]],
            ['student_id' => $students[16], 'halakat_id' => $halakat[8], 'attendance_date' => '2026-03-20', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[8]],
            ['student_id' => $students[17], 'halakat_id' => $halakat[8], 'attendance_date' => '2026-03-28', 'status' => 'غائب', 'excused_reason' => 'مرض', 'recorded_by' => $teachers[8]],
            ['student_id' => $students[17], 'halakat_id' => $halakat[8], 'attendance_date' => '2026-04-10', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[8]],
            ['student_id' => $students[18], 'halakat_id' => $halakat[9], 'attendance_date' => '2026-03-05', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[9]],
            ['student_id' => $students[18], 'halakat_id' => $halakat[9], 'attendance_date' => '2026-03-25', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[9]],
            ['student_id' => $students[19], 'halakat_id' => $halakat[9], 'attendance_date' => '2026-03-15', 'status' => 'حاضر', 'excused_reason' => null, 'recorded_by' => $teachers[9]],
            ['student_id' => $students[19], 'halakat_id' => $halakat[9], 'attendance_date' => '2026-04-01', 'status' => 'غائب', 'excused_reason' => 'ظروف عائلية', 'recorded_by' => $teachers[9]],
        ];

        DB::table('attendances')->insertOrIgnore($attendances);

        $today = now()->toDateString();
        $todayAttendances = [];
        $enrollments = DB::table('halakat_students')
            ->join('users', 'halakat_students.student_id', '=', 'users.id')
            ->where('halakat_students.is_active', true)
            ->whereNull('users.deleted_at')
            ->select('halakat_students.*')
            ->get();
        $excuses = ['مرض', 'ظروف عائلية', 'سفر', 'امتحان'];
        foreach ($enrollments as $i => $enr) {
            $tid = $teachers[$i % count($teachers)];
            $status = $i % 5 === 0 ? 'غائب' : 'حاضر';
            $reason = $status === 'غائب' ? $excuses[$i % count($excuses)] : null;
            $todayAttendances[] = [
                'student_id' => $enr->student_id,
                'halakat_id' => $enr->halakat_id,
                'attendance_date' => $today,
                'status' => $status,
                'excused_reason' => $reason,
                'recorded_by' => $tid,
            ];
        }

        DB::table('attendances')->insertOrIgnore($todayAttendances);
    }
}

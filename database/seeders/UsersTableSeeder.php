<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'name' => 'مدير النظام',
            'email' => 'admin@example.com',
            'phone' => '0500000000',
            'password' => Hash::make('password'),
            'birth_date' => '1980-01-01',
            'role' => 'admin',
        ]);

        $teachers = [
            ['name' => 'أحمد محمد', 'email' => 'ahmed@example.com', 'phone' => '0997176570', 'birth_date' => '1985-05-15'],
            ['name' => 'فاطمة علي', 'email' => 'fatima@example.com', 'phone' => '0933967587', 'birth_date' => '1990-08-20'],
            ['name' => 'خالد عبدالله', 'email' => 'khaled@example.com', 'phone' => '0550000003', 'birth_date' => '1988-12-10'],
            ['name' => 'عمر حسن', 'email' => 'omar@example.com', 'phone' => '0550000004', 'birth_date' => '1992-03-25'],
            ['name' => 'سارة أحمد', 'email' => 'sara@example.com', 'phone' => '0550000005', 'birth_date' => '1991-07-18'],
            ['name' => 'ياسر علي', 'email' => 'yasser@example.com', 'phone' => '0550000006', 'birth_date' => '1987-11-30'],
            ['name' => 'نورة سعد', 'email' => 'noura@example.com', 'phone' => '0550000007', 'birth_date' => '1993-02-14'],
            ['name' => 'ماجد فهد', 'email' => 'majed@example.com', 'phone' => '0550000008', 'birth_date' => '1986-06-22'],
            ['name' => 'ليلى عمر', 'email' => 'laila@example.com', 'phone' => '0550000009', 'birth_date' => '1994-09-05'],
            ['name' => 'عبدالعزيز سعود', 'email' => 'abdulaziz@example.com', 'phone' => '0550000010', 'birth_date' => '1989-04-17'],
            ['name' => 'محمود إبراهيم', 'email' => 'mahmoud@example.com', 'phone' => '0550000011', 'birth_date' => '1991-01-12'],
            ['name' => 'هدى عبدالرحمن', 'email' => 'huda.t@example.com', 'phone' => '0550000012', 'birth_date' => '1988-08-30'],
            ['name' => 'عبدالرحمن خالد', 'email' => 'abdulrahman.t@example.com', 'phone' => '0550000013', 'birth_date' => '1990-11-22'],
            ['name' => 'رانيا صالح', 'email' => 'rania@example.com', 'phone' => '0550000014', 'birth_date' => '1993-04-08'],
            ['name' => 'سلمان فهد', 'email' => 'salman@example.com', 'phone' => '0550000015', 'birth_date' => '1987-07-19'],
            ['name' => 'دانة عبدالله', 'email' => 'dana.t@example.com', 'phone' => '0550000016', 'birth_date' => '1992-12-03'],
            ['name' => 'محمد العتيبي', 'email' => 'mohammed@example.com', 'phone' => '0550000017', 'birth_date' => '1989-06-15'],
            ['name' => 'ريم سعد', 'email' => 'reem@example.com', 'phone' => '0550000018', 'birth_date' => '1991-03-28'],
            ['name' => 'تركي ماجد', 'email' => 'turki@example.com', 'phone' => '0550000019', 'birth_date' => '1986-10-11'],
            ['name' => 'سلمى حسن', 'email' => 'salma@example.com', 'phone' => '0550000020', 'birth_date' => '1994-02-25'],
        ];

        foreach ($teachers as $t) {
            User::create([
                'name' => $t['name'],
                'email' => $t['email'],
                'phone' => $t['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $t['birth_date'],
                'role' => 'teacher',
            ]);
        }

        $students = [
            ['name' => 'عبدالرحمن سعيد', 'email' => 'abdulrahman.s@example.com', 'phone' => '0560000001', 'birth_date' => '2010-03-25'],
            ['name' => 'مريم أحمد', 'email' => 'mariam@example.com', 'phone' => '0560000002', 'birth_date' => '2012-07-18'],
            ['name' => 'يوسف محمد', 'email' => 'yousef@example.com', 'phone' => '0560000003', 'birth_date' => '2011-11-30'],
            ['name' => 'هدى خالد', 'email' => 'huda.s@example.com', 'phone' => '0560000004', 'birth_date' => '2010-05-12'],
            ['name' => 'طارق فهد', 'email' => 'tareq@example.com', 'phone' => '0560000005', 'birth_date' => '2011-08-23'],
            ['name' => 'رنا سعد', 'email' => 'rana@example.com', 'phone' => '0560000006', 'birth_date' => '2012-01-15'],
            ['name' => 'سلطان عمر', 'email' => 'sultan@example.com', 'phone' => '0560000007', 'birth_date' => '2010-09-07'],
            ['name' => 'دانة ماجد', 'email' => 'dana.s@example.com', 'phone' => '0560000008', 'birth_date' => '2011-12-19'],
            ['name' => 'فيصل عبدالله', 'email' => 'faisal@example.com', 'phone' => '0560000009', 'birth_date' => '2012-04-28'],
            ['name' => 'جنى ياسر', 'email' => 'jana@example.com', 'phone' => '0560000010', 'birth_date' => '2010-06-11'],
            ['name' => 'عبدالله حسن', 'email' => 'abdullah@example.com', 'phone' => '0560000011', 'birth_date' => '2011-02-20'],
            ['name' => 'لينا محمد', 'email' => 'lina@example.com', 'phone' => '0560000012', 'birth_date' => '2012-08-14'],
            ['name' => 'حمزة علي', 'email' => 'hamza@example.com', 'phone' => '0560000013', 'birth_date' => '2010-11-03'],
            ['name' => 'نوف سالم', 'email' => 'nouf@example.com', 'phone' => '0560000014', 'birth_date' => '2011-04-17'],
            ['name' => 'ماجد الصغير', 'email' => 'majed.s@example.com', 'phone' => '0560000015', 'birth_date' => '2012-06-09'],
            ['name' => 'شهد إبراهيم', 'email' => 'shahd@example.com', 'phone' => '0560000016', 'birth_date' => '2010-01-28'],
            ['name' => 'عمران يوسف', 'email' => 'omran@example.com', 'phone' => '0560000017', 'birth_date' => '2011-09-12'],
            ['name' => 'غادة سعود', 'email' => 'ghada@example.com', 'phone' => '0560000018', 'birth_date' => '2012-03-05'],
            ['name' => 'باسل خالد', 'email' => 'basel@example.com', 'phone' => '0560000019', 'birth_date' => '2010-07-22'],
            ['name' => 'منال عبدالله', 'email' => 'manal@example.com', 'phone' => '0560000020', 'birth_date' => '2011-10-31'],
        ];

        for ($i = 0; $i < 20; $i++) {
            $s = $students[$i];
            User::create([
                'name' => $s['name'],
                'email' => $s['email'],
                'phone' => $s['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $s['birth_date'],
                'role' => 'student',
            ]);
        }

        $user16 = User::where('email', 'shahd@example.com')->first();
        if ($user16) {
            $user16->delete();
        }
    }
}

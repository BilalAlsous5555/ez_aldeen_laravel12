<?php

namespace App\Http\Controllers\Admin;

use App\Models\Studentachievement;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

class StudentAchievementCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;

    public function setup()
    {
        CRUD::setModel(Studentachievement::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/student-achievement');
        CRUD::setEntityNameStrings('انجاز', 'انجازات الطلاب');
    }

    protected function setupListOperation()
    {

        CRUD::column('student')->wrapper([
            'href' => fn ($crud, $column, $entry) => backpack_url('user/'.$entry->student_id.'/show'),
        ])->label('الطالب')->searchLogic(fn ($query, $column, $searchTerm) => $query->orWhereHas('student', fn ($q) => $q->where('name', 'like', '%'.$searchTerm.'%')));

        CRUD::column('type')->label('نوع الإنجاز')->type('closure')->function(function ($entry) {
            return $entry->type === 'surah_memorized' ? 'سورة' : 'جزء';
        });





        CRUD::column('surah')->wrapper([
            'href' => fn ($crud, $column, $entry) => $entry->surah_id ? backpack_url('surah/'.$entry->surah_id.'/show') : null,
        ])->label('السورة')->searchLogic(fn ($query, $column, $searchTerm) => $query->orWhereHas('surah', fn ($q) => $q->where('name', 'like', '%'.$searchTerm.'%')));

        CRUD::column('juz_number')->label('رقم الجزء')->type('number');

        CRUD::column('teacher')->wrapper([
            'href' => fn ($crud, $column, $entry) => backpack_url('user/'.$entry->teacher_id.'/show'),
        ])->label('المدرس')->searchLogic(fn ($query, $column, $searchTerm) => $query->orWhereHas('teacher', fn ($q) => $q->where('name', 'like', '%'.$searchTerm.'%')));

        CRUD::column('halqa')->wrapper([
            'href' => fn ($crud, $column, $entry) => backpack_url('halakat/'.$entry->halakat_id.'/show'),
        ])->label('الحلقة')->searchLogic(fn ($query, $column, $searchTerm) => $query->orWhereHas('halqa', fn ($q) => $q->where('name', 'like', '%'.$searchTerm.'%')));

        CRUD::column('achieved_at')->type('date')->label('تاريخ الإنجاز');

    }

    protected function setupShowOperation()
    {
        $this->setupListOperation();
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\AttendanceRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class AttendanceCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class AttendanceCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Attendance::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/attendance');
        CRUD::setEntityNameStrings('attendance', 'attendances');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     *
     * @return void
     */
    protected function setupListOperation()
    {
        $this->crud->addClause('whereHas', 'student', fn ($q) => $q->whereNull('deleted_at'));
        $this->crud->addClause('whereHas', 'halqa', fn ($q) => $q->whereNull('deleted_at'));
        $this->crud->addClause('whereHas', 'recorder', fn ($q) => $q->whereNull('deleted_at'));

        CRUD::column('student')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->student_id.'/show');
            },
        ])->label('اسم الطالب')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('student', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('status')->label('حالة الحضور')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('status', 'like', '%'.$searchTerm.'%');
        });
        CRUD::column('excused_reason')->label('عذر الغياب')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('excused_reason', 'like', '%'.$searchTerm.'%');
        });

        CRUD::column('halqa')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('halakat/'.$entry->halakat_id.'/show');
            },
        ])->label('اسم الحلقة')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('halqa', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('recorder')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->recorded_by.'/show');
            },
        ])->label('تسجيل المدرس')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('recorder', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('attendance_date')->label('تاريخ تسجيل الحضور')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('attendance_date', 'like', '%'.$searchTerm.'%');
        });
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     *
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(AttendanceRequest::class);

        $students = \App\Models\User::where('role', 'student')
            ->whereNull('deleted_at')
            ->orderBy('name')
            ->pluck('name', 'id');

        CRUD::field('student_id')
            ->type('select_from_array')
            ->label('الطالب')
            ->options($students)
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('halakat_id')
            ->type('hidden')
            ->default('');

        CRUD::field('attendance_date')
            ->type('date')
            ->label('تاريخ الحضور')
            ->value(now()->format('Y-m-d'))
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('status')
            ->type('select_from_array')
            ->label('حالة الحضور')
            ->options(['حاضر' => 'حاضر', 'غائب' => 'غائب'])
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('excused_reason')
            ->type('textarea')
            ->label('عذر الغياب');

        CRUD::field('attendance_auto_fill')
            ->type('view')
            ->view('vendor.backpack.crud.fields.attendance_auto_fill');
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     *
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}

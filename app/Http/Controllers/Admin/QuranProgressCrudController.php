<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\QuranProgressRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class QuranProgressCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class QuranProgressCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     * 
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\QuranProgress::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/quran-progress');
        CRUD::setEntityNameStrings('quran progress', 'quran progresses');
    }

    /**
     * Define what happens when the List operation is loaded.
     * 
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        // CRUD::setFromDb(); // set columns from db columns.
        CRUD::column('teacher')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->teacher_id.'/show');
            },
        ])->label('اسم المدرس');

        CRUD::column('halqa')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('halakat/'.$entry->halakat_id.'/show');
            },
        ])->label('اسم الحلقة');

        CRUD::column('student')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->student_id.'/show');
            },
        ])->label('اسم الطالب');

        CRUD::column('surah')->wrapper([
            'href'=>function($crud,$column,$entry)
            {
                return backpack_url('surah/'.$entry->surah_id.'/show');
            }
        ])->label('اسم السورة');

        CRUD::column('page')->wrapper([
            'text'=>function($crud,$column,$entry)
            {
                return backpack_url('page/'.$entry->quran_page_number.'/show');
            }
        ])->label('رقم الصفحة');

        CRUD::column('from_aya')->label('من الايه');
        CRUD::column('to_aya')->label('الى الايه');
        CRUD::column('evaluation')->label('تقييم الحفظ');
        CRUD::column('notes')->label('ملاحظات المدرسين');
        // CRUD::column();
        // CRUD::column();
    }

    /**
     * Define what happens when the Create operation is loaded.
     * 
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(QuranProgressRequest::class);
        CRUD::setFromDb(); // set fields from db columns.

        /**
         * Fields can be defined using the fluent syntax:
         * - CRUD::field('price')->type('number');
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     * 
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}

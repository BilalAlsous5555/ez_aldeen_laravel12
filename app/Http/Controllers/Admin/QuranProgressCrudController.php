<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\QuranProgressRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class QuranProgressCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class QuranProgressCrudController extends CrudController
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
        CRUD::setModel(\App\Models\QuranProgress::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/quran-progress');
        CRUD::setEntityNameStrings('quran progress', ' التقدم القرآني');
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

        CRUD::column('student')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->student_id.'/show');
            },
        ])->label('اسم الطالب')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('student', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('surah')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('surah/'.$entry->surah_id.'/show');
            },
        ])->label('اسم السورة')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('surah', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        })->format(function ($value, $entry) {
            return $entry->surah ? $entry->surah->name : '—';
        });

        CRUD::column('page')->wrapper([
            'text' => function ($crud, $column, $entry) {
                return backpack_url('page/'.$entry->quran_page_number.'/show');
            },
        ])->label('رقم الصفحة')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('quran_page_number', 'like', '%'.$searchTerm.'%');
        })->format(function ($value) {
            return $value ? $value : '—';
        });

        CRUD::column('from_aya')->label('من الايه')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('from_aya', 'like', '%'.$searchTerm.'%');
        })->format(function ($value) {
            return $value ? $value : '—';
        });
        CRUD::column('to_aya')->label('الى الايه')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('to_aya', 'like', '%'.$searchTerm.'%');
        })->format(function ($value) {
            return $value ? $value : '—';
        });
        CRUD::column('evaluation')->label('تقييم الحفظ او المراجعة')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('evaluation', 'like', '%'.$searchTerm.'%');
        });
        CRUD::column('memorize_type')->label('نوع الحفظ');
        CRUD::column('juz_number')->label('رقم الجزء')->type('view')->view('vendor.backpack.crud.columns.juz_number_formatted');
        CRUD::column('notes')->label('ملاحظات المدرسين')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('notes', 'like', '%'.$searchTerm.'%');
        })->format(function ($value) {
            return $value ? $value : '—';
        });
        CRUD::column('date')->type('date')->label('التاريخ');
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
        CRUD::setValidation(QuranProgressRequest::class);

        $students = \App\Models\User::where('role', 'student')
            ->whereNull('deleted_at')
            ->orderBy('name')
            ->pluck('name', 'id');

        $surahs = \App\Models\Surah::orderBy('number')->pluck('name', 'id');

        CRUD::field('student_id')
            ->type('select_from_array')
            ->label('الطالب')
            ->options($students)
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('surah_id')
            ->type('select_from_array')
            ->label('السورة')
            ->options(['' => '—'] + $surahs->toArray())
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('quran_page_number')
            ->type('number')
            ->label('رقم الصفحة')
            ->wrapper(['class' => 'form-group col-md-3']);

        CRUD::field('from_aya')
            ->type('number')
            ->label('من الآية')
            ->wrapper(['class' => 'form-group col-md-3']);

        CRUD::field('to_aya')
            ->type('number')
            ->label('إلى الآية')
            ->wrapper(['class' => 'form-group col-md-3']);

        CRUD::field('memorize_type')
            ->type('select_from_array')
            ->label('نوع الحفظ')
            ->options(['حفظ' => 'حفظ', 'مراجعة' => 'مراجعة'])
            ->wrapper(['class' => 'form-group col-md-3']);

        CRUD::field('juz_number')
            ->type('view')
            ->view('vendor.backpack.crud.fields.juz_number');

        CRUD::field('evaluation')
            ->type('select_from_array')
            ->label('تقييم الحفظ او المراجعة')
            ->options(['ممتاز' => 'ممتاز', 'جيد جدا' => 'جيد جدا', 'جيد' => 'جيد', 'اعادة' => 'اعادة'])
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('notes')
            ->type('textarea')
            ->label('ملاحظات')
            ->wrapper(['class' => 'form-group col-md-8']);

        CRUD::field('date')
            ->type('date')
            ->label('التاريخ')
            ->value(now()->format('Y-m-d'))
            ->wrapper(['class' => 'form-group col-md-4']);

        CRUD::field('auto_fill')
            ->type('view')
            ->view('vendor.backpack.crud.fields.quran_progress_auto_fill');
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

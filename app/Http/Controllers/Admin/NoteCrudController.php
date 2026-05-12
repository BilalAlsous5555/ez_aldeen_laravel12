<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\NoteRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class NoteCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class NoteCrudController extends CrudController
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
        CRUD::setModel(\App\Models\Note::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/note');
        CRUD::setEntityNameStrings('note', 'notes');
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
        CRUD::column('sender')->label('المرسل')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('sender', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('student')->label('الطالب')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('student', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('halqa')->label('الحلقة')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhereHas('halqa', function ($q) use ($searchTerm) {
                $q->where('name', 'like', '%'.$searchTerm.'%');
            });
        });

        CRUD::column('title')->label('العنوان')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('title', 'like', '%'.$searchTerm.'%');
        });

        CRUD::column('body')->label('المحتوى')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('body', 'like', '%'.$searchTerm.'%');
        });

        CRUD::column('created_at')->type('date')->label('تاريخ الإرسال');
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
        CRUD::setValidation(NoteRequest::class);
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
     *
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}

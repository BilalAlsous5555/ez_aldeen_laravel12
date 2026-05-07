<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\HalakatRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class HalakatCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class HalakatCrudController extends CrudController
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
        CRUD::setModel(\App\Models\Halakat::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/halakat');
        CRUD::setEntityNameStrings('halakat', 'halakats');
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
        // CRUD::setFromDb(); // set columns from db columns.
        CRUD::column('name')->label('اسم الحلقة');
        CRUD::column('teacher')->wrapper([
            'href' => function ($crud, $column, $entry) {
                return backpack_url('user/'.$entry->teacher_id.'/show');
            },
        ])->label('اسم المدرس');

        CRUD::column('activeStudentsCount')
            ->type('model_function')
            ->function_name('getActiveStudentsCount')
            ->label('عدد الطلاب');
        CRUD::column('notes')->label('ملاحظات عن الحلقة');

        /**
         * Columns can be defined using the fluent syntax:
         * - CRUD::column('price')->type('number');
         */
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
        CRUD::setValidation(HalakatRequest::class);
        // CRUD::setFromDb(); // set fields from db columns.
        CRUD::field('name')->label('اسم الحلقة');
        CRUD::field('notes')->label('ملاحظات عن الحلقة');

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

    public function store()
    {
        $this->crud->hasAccessOrFail('create');
        $this->crud->validateRequest();

        $data = $this->crud->getRequest()->only(['name', 'notes']);

        $item = \App\Models\Halakat::create($data);


        $saveAction = $this->crud->getSaveAction();
        if ($saveAction === 'save_and_new') {
            return redirect($this->crud->route.'/create');
        }
        if ($saveAction === 'save_and_edit') {
            return redirect($this->crud->route.'/'.$item->getKey().'/edit');
        }

        return redirect($this->crud->route);
    }

    public function update()
    {
        $this->crud->hasAccessOrFail('update');
        $this->crud->validateRequest();
        $item = $this->crud->getCurrentEntry();

        $data = $this->crud->getRequest()->only(['name', 'notes']);

        $item->fill($data)->save();


        $saveAction = $this->crud->getSaveAction();
        if ($saveAction === 'save_and_new') {
            return redirect($this->crud->route.'/create');
        }
        if ($saveAction === 'save_and_edit') {
            return redirect($this->crud->route.'/'.$item->getKey().'/edit');
        }

        return redirect($this->crud->route);
    }
}

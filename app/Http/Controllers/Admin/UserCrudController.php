<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\UserRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class UserCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class UserCrudController extends CrudController
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
        CRUD::setModel(\App\Models\User::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/user');
        CRUD::setEntityNameStrings('user', 'users');
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

        // Keep email but make it nullable
        
        // Add custom columns
        CRUD::column('arabic_role')->type('text')->label('الدور'); // arabic_role is accessor
        CRUD::column('name')->type('string')->label('الاسم');
        CRUD::column('name')->type('string')->label('الاسم');
        CRUD::column('phone')->type('text')->label('رقم الهاتف');
        CRUD::column('email')->type('email')->label('البريد الالكتروني');
        CRUD::column('password')->type('text')->label('كلمة المرور');
        CRUD::column('birth_date')->type('date')->label('تاريخ الولادة');
        CRUD::column('created_at')->type('date')->label('تاريخ الانضمام');;
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
        CRUD::setValidation(UserRequest::class);

        // Add fields for your User model
        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('phone')->type('text')->label('رقم الهاتف')->attributes(['required' => 'required', 'maxlength' => '10', 'minlength' => '10']);
        CRUD::field('email')->type('email')->label('البريد الإلكتروني')->attributes(['required' => 'required','unique' ]);
        CRUD::field('password')->type('text')->label('كلمة المرور');
        CRUD::field('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['admin' => 'مدير', 'teacher' => 'مدرس', 'student' => 'طالب']);
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
        CRUD::setValidation(UserRequest::class);

        // Add fields for your User model
        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('email')->type('email')->label('البريد الإلكتروني');
        CRUD::field('phone')->type('text')->label('رقم الهاتف')->attributes(['required' => 'required', 'maxlength' => '10', 'minlength' => '10']);
        CRUD::field('password')->type('password')->label('كلمة المرور')->hint('اتركه فارغاً إذا لم ترد تغييره');
        CRUD::field('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['admin' => 'مدير', 'teacher' => 'مدرس', 'student' => 'طالب']);
    }
}

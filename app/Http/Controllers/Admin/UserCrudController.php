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

    /**
     * 1- ADD columns
     * 2- Reorder
     * 3- Display image CRUD::column('image')->type('image');
     * 4- add links 
     * 5- wrappers
     * 6- Actions as dropdown button
     * 7- Custom column
     * 8- Filters
     * 9- Export buttons
     * 10- Details row
     * 
     */
        // Role column with search for Arabic and English
        CRUD::column('arabic_role')->type('text')->label('الدور')->searchLogic(function ($query, $column, $searchTerm) {
            $arabicToEnglish = [
                'مدير' => 'admin',
                'مدرس' => 'teacher',
                'طالب' => 'student',
            ];
            if (isset($arabicToEnglish[$searchTerm])) {
                $query->orWhere('role', $arabicToEnglish[$searchTerm]);
            } else {
                $query->orWhere('role', 'like', '%'.$searchTerm.'%');
            }
        });
        // Name column with search
        CRUD::column('name')->type('text')->label('الاسم')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('name', 'like', '%'.$searchTerm.'%');
        });


        // Other columns with search
        CRUD::column('phone')->type('text')->label('رقم الهاتف')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('phone', 'like', '%'.$searchTerm.'%');
        });

        CRUD::column('email')->type('email')->label('البريد الإلكتروني')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('email', 'like', '%'.$searchTerm.'%');
        });
        CRUD::column('password')->type('text')->label('كلمة المرور');

        CRUD::column('birth_date')->type('date')->label('تاريخ الولادة');
        CRUD::column('created_at')->type('date')->label('تاريخ الانضمام');

        CRUD::column('HalakatStudent');
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
        CRUD::field('email')->type('email')->label('البريد الإلكتروني')->attributes(['required' => 'required', 'unique']);
        CRUD::field('password')->type('password')->label('كلمة المرور');
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

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\AccountRequest;
use App\Models\User;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class AccountCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class AccountCrudController extends CrudController
{
    // use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;

    // use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;

    public function setup()
    {
        CRUD::setModel(User::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/accounts');
        CRUD::setEntityNameStrings('حساب', 'حسابات المستخدمين');
    }

    protected function setupListOperation()
    {
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
        CRUD::column('name')->type('text')->label('الاسم')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('name', 'like', '%'.$searchTerm.'%');
        });
        CRUD::column('phone')->type('text')->label('رقم الهاتف')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('phone', 'like', '%'.$searchTerm.'%');
        });
        CRUD::column('email')->type('email')->label('البريد الإلكتروني')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('email', 'like', '%'.$searchTerm.'%');
        });
        // CRUD::column('password')->type('text')->label('كلمة المرور')->searchLogic(false);
        CRUD::column('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::column('created_at')->type('date')->label('تاريخ الانضمام');
    }

    protected function setupShowOperation()
    {
        CRUD::column('name')->type('text')->label('الاسم');
        CRUD::column('email')->type('email')->label('البريد الإلكتروني');
        CRUD::column('password')->type('text')->label('كلمة المرور');
        CRUD::column('arabic_role')->type('text')->label('الدور');
        CRUD::column('phone')->type('text')->label('رقم الهاتف');
        CRUD::column('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::column('created_at')->type('date')->label('تاريخ الانضمام');
    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(AccountRequest::class);

        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('email')->type('email')->label('البريد الإلكتروني');
        CRUD::field('password')->type('password')->label('كلمة المرور');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['admin' => 'مدير', 'teacher' => 'مدرس', 'student' => 'طالب']);
        CRUD::field('phone')->type('text')->label('رقم الهاتف');
    }

    public function store()
    {
        $this->crud->hasAccessOrFail('create');
        $request = $this->crud->validateRequest();

        $item = $this->crud->create($this->crud->getRequest()->except(['id']));
        $this->data['entry'] = $this->crud->entry = $item;

        // \Alert::success(trans('backpack::crud.insert_success'))->flash();
        $this->crud->setSaveAction();

        return $this->crud->performSaveAction($item->getKey());
    }

    protected function setupUpdateOperation()
    {
        CRUD::setValidation(AccountRequest::class);

        $entry = $this->crud->getCurrentEntry();

        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('email')->type('email')->label('البريد الإلكتروني');
        CRUD::field('password')->type('password')->label('كلمة المرور')
            ->hint('اتركه فارغاً إذا لم ترد تغييره');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['admin' => 'مدير', 'teacher' => 'مدرس', 'student' => 'طالب'])
            ->value($entry?->role);
        CRUD::field('phone')->type('text')->label('رقم الهاتف');
    }

    public function update()
    {
        $this->crud->hasAccessOrFail('update');
        $request = $this->crud->validateRequest();
        $user = $this->crud->getCurrentEntry();

        $requestData = $request->except(['id', 'password']);

        if (! empty($request->input('password'))) {
            $requestData['password'] = $request->input('password');
        }

        $item = $this->crud->update($user->id, $requestData);
        $this->data['entry'] = $this->crud->entry = $item;

        // \Alert::success(trans('backpack::crud.update_success'))->flash();
        $this->crud->setSaveAction();

        return $this->crud->performSaveAction($item->getKey());
    }
}

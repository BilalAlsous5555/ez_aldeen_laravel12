<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Admin\Operations\RestoreOperation;
use App\Http\Requests\UserRequest;
use App\Models\Halakat;
use App\Models\HalakatStudent;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
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
    use RestoreOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\User::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/user');
        CRUD::setEntityNameStrings('user', 'الطلاب');
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
        $this->crud->addClause('withTrashed');
        $this->crud->addButton('top', 'filters', 'view', 'crud::buttons.filters', 'beginning');

        // ---- Filter logic based on GET parameter ----
        $filter = request('filter');
        if ($filter === 'active_students') {
            $this->crud->addClause('where', 'role', 'student');
            $this->crud->addClause('whereNull', 'deleted_at');
        } elseif ($filter === 'active_teachers') {
            $this->crud->addClause('where', 'role', 'teacher');
            $this->crud->addClause('whereNull', 'deleted_at');
        } elseif ($filter === 'deleted_students') {
            $this->crud->addClause('where', 'role', 'student');
            $this->crud->addClause('whereNotNull', 'deleted_at');
        } elseif ($filter === 'deleted_teachers') {
            $this->crud->addClause('where', 'role', 'teacher');
            $this->crud->addClause('whereNotNull', 'deleted_at');
        } elseif ($filter === 'without_halqa') {
            $this->crud->addClause('where', function ($q) {
                $q->whereNull('deleted_at');
                $q->where(function ($sub) {
                    $sub->where(function ($studentQuery) {
                        $studentQuery->where('role', 'student')
                            ->where(function ($sq) {
                                $sq->whereDoesntHave('activeEnrollment')
                                    ->orWhereHas('activeEnrollment.halqa', fn ($hq) => $hq->onlyTrashed());
                            });
                    })->orWhere(function ($teacherQuery) {
                        $teacherQuery->where('role', 'teacher')
                            ->whereDoesntHave('halqa');
                    });
                });
            });
        }

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
         */
        if (! in_array(request('filter'), ['active_students', 'active_teachers'])) {
            CRUD::column('deleted_at')
                ->type('boolean')
                ->label('الحالة')
                ->options([0 => 'نشط', 1 => 'محذوف'])
                ->wrapper([
                    'class' => function ($crud, $column, $entry) {
                        return $entry->trashed() ? 'text-danger' : 'text-success';
                    },
                ]);
        }

        // // Role column with search for Arabic and English
        // CRUD::column('arabic_role')->type('text')->label('الدور')->searchLogic(function ($query, $column, $searchTerm) {
        //     $arabicToEnglish = [
        //         'مدير' => 'admin',
        //         'مدرس' => 'teacher',
        //         'طالب' => 'student',
        //     ];
        //     if (isset($arabicToEnglish[$searchTerm])) {
        //         $query->orWhere('role', $arabicToEnglish[$searchTerm]);
        //     } else {
        //         $query->orWhere('role', 'like', '%'.$searchTerm.'%');
        //     }
        // });

        // Name column with search
        $nameCol = CRUD::column('name')->type('text')->label('الاسم')->searchLogic(function ($query, $column, $searchTerm) {
            $query->orWhere('name', 'like', '%'.$searchTerm.'%');
        });

        if (request('filter') === 'active_students') {
            $nameCol->wrapper([
                'href' => function ($crud, $column, $entry) {
                    return backpack_url('user/'.$entry->id.'/show');
                },
            ]);
        }

        $hideTeacher = in_array(request('filter'), ['active_teachers', 'deleted_teachers', 'deleted_students', 'without_halqa']);
        $hideHalqa = in_array(request('filter'), ['deleted_teachers', 'deleted_students', 'without_halqa']);

        if (! $hideHalqa) {
            CRUD::column('activeEnrollment')
                ->type('model_function')
                ->function_name('getActiveHalqaName')
                ->label('الحلقة الحالية')
                ->wrapper([
                    'text' => function ($crud, $column, $entry) {
                        if ($entry->isTeacher() && $entry->halqa) {
                            return backpack_url('halakat/'.$entry->halqa->id.'/show');
                        }

                        if ($entry->activeEnrollment) {
                            return backpack_url('halakat/'.$entry->activeEnrollment->halakat_id.'/show');
                        }

                        return null;
                    },
                ])
                ->searchLogic(function ($query, $column, $searchTerm) {
                    $query->orWhereHas('activeEnrollment.halqa', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', '%'.$searchTerm.'%');
                    });
                });
        }

        if (! $hideTeacher) {
            CRUD::column('activeHalqaTeacher')
                ->type('model_function')
                ->function_name('getActiveHalqaTeacherName')
                ->label('المدرس')
                ->wrapper([
                    'text' => function ($crud, $column, $entry) {
                        if ($entry->activeEnrollment?->halqa?->teacher_id) {
                            return backpack_url('user/'.$entry->activeEnrollment->halqa->teacher_id.'/show');
                        }

                        return null;
                    },
                ])
                ->searchLogic(function ($query, $column, $searchTerm) {
                    $query->orWhereHas('activeEnrollment.halqa.teacher', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', '%'.$searchTerm.'%');
                    });
                });
        }
        // // Other columns with search
        // CRUD::column('phone')->type('text')->label('رقم الهاتف')->searchLogic(function ($query, $column, $searchTerm) {
        //     $query->orWhere('phone', 'like', '%'.$searchTerm.'%');
        // });
        CRUD::column('birth_date')->type('date')->label('تاريخ الولادة');
        CRUD::column('created_at')->type('date')->label('تاريخ الانضمام');

        if (in_array(request('filter'), ['deleted_students', 'deleted_teachers'])) {
            CRUD::column('deleted_at')->type('datetime')->label('تاريخ الحذف');
        }

    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     *
     * @return void
     */
    protected function setupShowOperation()
    {
        $this->crud->set('show.setFromDb', false);
        $this->crud->set('show.timestamps', false);
        $this->crud->set('show.softDeletes', true);
        $this->crud->set('show.view', 'vendor.backpack.crud.show_user');

        CRUD::column('name')->type('text')->label('الاسم');
        CRUD::column('email')->type('email')->label('البريد الإلكتروني');
        CRUD::column('phone')->type('text')->label('رقم الهاتف');
        CRUD::column('arabic_role')->type('text')->label('الدور');
        CRUD::column('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::column('created_at')->type('datetime')->label('تاريخ الانضمام');
    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(UserRequest::class);

        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('phone')->type('text')->label('رقم الهاتف')->attributes(['required' => 'required', 'maxlength' => '10', 'minlength' => '10']);
        CRUD::field('email')->type('email')->label('البريد الإلكتروني')->attributes(['required' => 'required', 'unique']);
        CRUD::field('password')->type('password')->label('كلمة المرور');
        CRUD::field('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['teacher' => 'مدرس', 'student' => 'طالب']);

        CRUD::field('selected_halaka')
            ->type('select_from_array')
            ->label('الحلقة')
            ->options([])
            ->attributes(['data-current-halaka' => ''])
            ->fake(true)
            ->hint('اختر الحلقة')
            ->wrapper(['id' => 'assign_halakat_wrapper']);

        CRUD::field('halakat_filter_script')
            ->type('view')
            ->view('vendor.backpack.ui.fields.role-halakat-script')
            ->fake(true);
    }

    public function store()
    {
        $this->crud->hasAccessOrFail('create');
        $request = $this->crud->validateRequest();
        $halakatId = $request->input('selected_halaka');
        $role = $request->input('role');

        $data = $request->only(['name', 'phone', 'email', 'password', 'birth_date', 'role']);

        $item = \App\Models\User::create($data);

        if ($halakatId && $role === 'student') {
            HalakatStudent::create([
                'student_id' => $item->id,
                'halakat_id' => $halakatId,
                'joined_at' => now(),
                'is_active' => true,
            ]);
        } elseif ($halakatId && $role === 'teacher') {
            Halakat::where('id', $halakatId)->update(['teacher_id' => $item->id]);
        }

        return $this->performSaveActionRedirect($item);
    }

    private function performSaveActionRedirect($item)
    {
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
        $request = $this->crud->validateRequest();
        $user = $this->crud->getCurrentEntry();

        $halakatId = $request->input('selected_halaka');
        $role = $request->input('role') ?? $user->role;

        $data = $request->only(['name', 'phone', 'email', 'birth_date', 'role']);

        if (! empty($request->input('password'))) {
            $data['password'] = $request->input('password');
        }

        $user->fill($data)->save();

        if ($role === 'student' && $halakatId) {
            $currentHalakatId = $user->fresh()->activeEnrollment?->halakat_id;

            if ($halakatId != $currentHalakatId) {
                HalakatStudent::transfer($user->id, $halakatId, now()->toDateString());
            }
        } elseif ($role === 'teacher' && $halakatId) {
            $currentHalakatId = $user->fresh()->halqa?->id;

            if ($halakatId != $currentHalakatId) {
                if ($user->halqa) {
                    $user->halqa->update(['teacher_id' => null]);
                }
                Halakat::where('id', $halakatId)->update(['teacher_id' => $user->id]);
            }
        }

        \Prologue\Alerts\Facades\Alert::success('تم تحديث البيانات بنجاح')->flash();

        return redirect(backpack_url('user/'.$user->id.'/show'));
    }

    public function destroy($id)
    {
        $this->crud->hasAccessOrFail('delete');
        $id = $this->crud->getCurrentEntryId() ?? $id;

        $entry = $this->crud->getModel()->findOrFail($id);

        $lastProgressId = \App\Models\QuranProgress::where('student_id', $entry->id)
            ->where('memorize_type', 'حفظ')
            ->whereNotNull('surah_id')
            ->orderByDesc('id')
            ->value('id');

        \App\Models\QuranProgress::where('student_id', $entry->id)
            ->where('id', '!=', $lastProgressId)
            ->delete();

        \App\Models\Attendance::where('student_id', $entry->id)->delete();

        $entry->delete();

        \Prologue\Alerts\Facades\Alert::success('تم حذف المستخدم بنجاح')->flash();

        return redirect(backpack_url('dashboard'));
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

        CRUD::field('name')->type('text')->label('الاسم');
        CRUD::field('email')->type('email')->label('البريد الإلكتروني');
        CRUD::field('phone')->type('text')->label('رقم الهاتف')->attributes(['required' => 'required', 'maxlength' => '10', 'minlength' => '10']);
        CRUD::field('password')->type('password')->label('كلمة المرور')->hint('اتركه فارغاً إذا لم ترد تغييره');
        CRUD::field('birth_date')->type('date')->label('تاريخ الميلاد');
        CRUD::field('role')->type('select_from_array')->label('الدور')
            ->options(['teacher' => 'مدرس', 'student' => 'طالب']);

        // Show halakat field for students and teachers only
        $entry = $this->crud->getCurrentEntry();
        if ($entry && ($entry->isStudent() || $entry->isTeacher())) {
            $currentHalakatId = null;
            if ($entry->isStudent()) {
                $currentHalakatId = $entry->activeEnrollment?->halakat_id;
            } else {
                $currentHalakatId = $entry->halqa?->id;
            }

            CRUD::field('selected_halaka')
                ->type('select_from_array')
                ->label('الحلقة')
                ->options([])
                ->attributes(['data-current-halaka' => $currentHalakatId ?? ''])
                ->value($currentHalakatId)
                ->fake(true)
                ->hint($entry->isTeacher() ? 'اختر حلقة جديدة لنقل المدرس إليها' : 'اختر حلقة جديدة لنقل الطالب إليها')
                ->wrapper(['id' => 'assign_halakat_wrapper']);

            CRUD::field('halakat_filter_script')
                ->type('view')
                ->view('vendor.backpack.ui.fields.role-halakat-script')
                ->fake(true);
        }
    }
}

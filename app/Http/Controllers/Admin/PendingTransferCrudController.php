<?php

namespace App\Http\Controllers\Admin;

use App\Models\Halakat;
use App\Models\HalakatStudent;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

class PendingTransferCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;

    public function setup()
    {
        CRUD::setModel(\App\Models\HalakatStudent::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/pending-transfer');
        CRUD::setEntityNameStrings('طالب بانتظار النقل', 'الطلاب بانتظار النقل');
    }

    protected function setupListOperation()
    {
        CRUD::addClause('where', 'is_active', true);
        CRUD::addClause('whereHas', 'halqa', function ($q) {
            $q->onlyTrashed();
        });

        CRUD::column('student')
            ->label('اسم الطالب')
            ->wrapper([
                'href' => function ($crud, $column, $entry) {
                    return backpack_url('user/'.$entry->student_id.'/show');
                },
            ])
            ->searchLogic(function ($query, $column, $searchTerm) {
                $query->orWhereHas('student', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%'.$searchTerm.'%');
                });
            });

        CRUD::column('halqa')
            ->label('الحلقة السابقة (محذوفة)')
            ->wrapper([
                'href' => function ($crud, $column, $entry) {
                    return backpack_url('halakat/'.$entry->halakat_id.'/show');
                },
            ])
            ->searchLogic(function ($query, $column, $searchTerm) {
                $query->orWhereHas('halqa', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%'.$searchTerm.'%');
                });
            });

        CRUD::column('joined_at')->label('تاريخ الانضمام');
    }

    protected function setupUpdateOperation()
    {
        $entry = $this->crud->getCurrentEntry();

        CRUD::field('student_id')
            ->type('hidden')
            ->value($entry?->student_id);

        CRUD::field('student_name')
            ->type('text')
            ->label('الطالب')
            ->value($entry?->student?->name)
            ->attributes(['disabled' => 'disabled']);

        CRUD::field('current_halqa')
            ->type('text')
            ->label('الحلقة الحالية (محذوفة)')
            ->value($entry?->halqa?->name)
            ->attributes(['disabled' => 'disabled']);

        CRUD::field('new_halakat_id')
            ->type('select_from_array')
            ->label('الحلقة الجديدة')
            ->options(Halakat::whereNull('deleted_at')->get()->pluck('name', 'id')->toArray())
            ->attributes(['required' => 'required']);
    }

    public function update()
    {
        $this->crud->hasAccessOrFail('update');

        $id = $this->crud->getCurrentEntryId();
        $entry = HalakatStudent::findOrFail($id);

        $request = $this->crud->validateRequest();
        $newHalakatId = $request->input('new_halakat_id');

        if (! $newHalakatId) {
            return redirect()->back()->withErrors(['new_halakat_id' => 'يرجى اختيار حلقة جديدة']);
        }

        HalakatStudent::transfer($entry->student_id, $newHalakatId, now()->toDateString());

        \Alert::success('تم نقل الطالب بنجاح')->flash();

        return redirect($this->crud->route);
    }

    public function setupShowOperation()
    {
        $this->setupListOperation();
    }
}

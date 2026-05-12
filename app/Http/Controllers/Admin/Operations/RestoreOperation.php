<?php

namespace App\Http\Controllers\Admin\Operations;

use Illuminate\Support\Facades\Route;

trait RestoreOperation
{
    protected function setupRestoreRoutes($segment, $routeName, $controller)
    {
        Route::post($segment.'/{id}/restore', [
            'as' => $routeName.'.restore',
            'uses' => $controller.'@restore',
            'operation' => 'restore',
        ]);
    }

    protected function setupRestoreDefaults()
    {
        $this->crud->allowAccess('restore');

        $this->crud->operation('list', function () {
            $this->crud->addButton('line', 'restore', 'view', 'crud::buttons.restore', 'end');
        });
    }

    public function restore($id)
    {
        $this->crud->hasAccessOrFail('restore');

        $id = $this->crud->getCurrentEntryId() ?? $id;
        $entry = $this->crud->query->withTrashed()->findOrFail($id);

        if (! $entry->trashed()) {
            return response()->json(['error' => 'هذا المستخدم غير محذوف'], 400);
        }

        $entry->restore();

        return '1';
    }
}

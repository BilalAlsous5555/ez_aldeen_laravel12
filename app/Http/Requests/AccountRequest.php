<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AccountRequest extends FormRequest
{
    public function authorize()
    {
        return backpack_auth()->check();
    }

    public function rules()
    {
        $id = $this->get('id') ?? request()->route('id');

        $rules = [
            'name' => 'required|string|max:45',
            'email' => 'required|string|email|max:45|unique:users,email,'.$id,
            'phone' => 'required|string|min:10|max:10|unique:users,phone,'.$id,
            'role' => 'required|in:admin,teacher,student',
        ];

        if ($this->isMethod('post')) {
            $rules['password'] = 'required|string|min:6';
        } else {
            $rules['password'] = 'nullable|string|min:6';
        }

        return $rules;
    }
}

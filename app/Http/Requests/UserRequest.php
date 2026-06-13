<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // only allow updates if the user is logged in
        return backpack_auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $id = $this->get('id') ?? request()->route('id');

        $rules = [
            'name' => 'required|string|max:45',
            'email' => 'required|string|email|max:45|unique:users,email,'.$id,
            'phone' => 'required|string|min:10|max:10|unique:users,phone,'.$id,
            'birth_date' => 'nullable|date',
            'role' => 'required|in:admin,teacher,student',
            'gender' => 'required|in:ذكر,انثى',
            'assign_halakat' => 'nullable|exists:halakat,id',
        ];

        if ($this->isMethod('post')) {
            $rules['password'] = 'required|string|min:6';
        } else {
            $rules['password'] = 'nullable|string|min:6';
        }

        return $rules;
    }

    /**
     * Get the validation attributes that apply to the request.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            //
        ];
    }

    /**
     * Get the validation messages that apply to the request.
     *
     * @return array
     */
    public function messages()
    {
        return [
            //
        ];
    }
}

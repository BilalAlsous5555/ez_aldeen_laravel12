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

        return [
            'name' => 'required|string|max:45',
            'email' => 'required|string|email|max:45|unique:users,email,'.$id,
            'phone' => 'required|string|min:10|max:10|unique:users,phone,'.$id,
            'password' => 'required|string|min:6',
            'birth_date' => 'nullable|date',
            'role' => 'required|in:admin,teacher,student',
        ];
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

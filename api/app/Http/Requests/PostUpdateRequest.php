<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required',
            // 'image' => 'required|mimes:jpeg,png,jpg',
        ];
    }
    public function messages()
    {
        return [
            'title.required' => 'Title is required!',
            'image.required' => 'The image field is required'
        ];
    }
}

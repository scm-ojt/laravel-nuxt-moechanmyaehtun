<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;

class LoginController extends Controller
{
    public function __invoke(LoginRequest $request)
    {
        if(!auth()->attempt($request->only('email','password'))){
            throw new AuthenticationException();
        }
    }
}

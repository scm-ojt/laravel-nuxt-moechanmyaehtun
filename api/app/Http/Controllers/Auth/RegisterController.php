<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;

class RegisterController extends Controller
{

   public function Store(RegisterRequest $request){
    $user = new User();
        $user->name = $request['name'];
        $user->email = $request['email'];
        $password = $request['password'];
        $user->password = bcrypt($password);
        $user->save();

    return $user;
   }
}

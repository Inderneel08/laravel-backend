<?php

namespace App\Http\Middleware;

use App\Models\CustomToken;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\Response;

class CustomTokenAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $routeName = Route::currentRouteName();

        $token = $request->cookie('token');

        if(!($token)){
            if(in_array($routeName,['createOrders'])){
                return $next($request);
            }
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        else{
            $checkToken = CustomToken::where('token_value',hash('sha256',$token))->first();
        }

        if(isset($checkToken)){
            $userObject = $checkToken->user()->first();
        }

        $request->attributes->set('user', [
            'id' => $userObject->id,
            'email' => $userObject->email,
            'name' => $userObject->name,
            'address' => $userObject->address,
            'state' => $userObject->state,
            'zip' => $userObject->zip,
            'phone' => $userObject->phone,
            'password' => $userObject->password,
        ]);

        return $next($request);
    }
}

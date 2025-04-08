<?php

namespace App\Http\Middleware;

use App\Models\CustomToken;
use Closure;
use Illuminate\Http\Request;
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
        $token = $request->cookie('token');

        $checkToken = CustomToken::where('token_value',hash('sha256',$token))->first();

        if(!($token) || !($checkToken)){
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request['user'] = $checkToken->user()->first();

        return $next($request);
    }
}

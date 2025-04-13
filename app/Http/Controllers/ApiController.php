<?php

namespace App\Http\Controllers;

use App\Models\CustomToken;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ApiController extends Controller
{

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email',$request->input('email'))->first();

        if(!$user){
            response()->json(['message' => 'User does not exists']);
        }

        if($request->input('password') != $user->password){
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $generatedtoken = Str::random(60);

        $token=hash('sha256',$generatedtoken);

        while(CustomToken::where('token_value',hash('sha256',$token))->first()){
            $token = hash('sha256',$generatedtoken);
        }

        CustomToken::create([
            'user_id' => $user->id,
            'token_value' => $token,
        ]);

        User::where('id',$user->id)->update(['jwt_token' => $generatedtoken,'last_login'=>Carbon::now()]);

        return response()->json(['message' => 'Login successful'])
        ->cookie('token', $generatedtoken, 60 * 24 * 7);
    }

    public function getProfileInfo(Request $request)
    {
        return(response()->json(['profileInfo' => $request->get('user')]));
    }


    public function register(Request $request)
    {
        $name = $request->input('name');

        $email = $request->input('email');

        $password = $request->input('password');

        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email',$email)->first();

        if($user){
            return(response()->json(['message' => 'User already exists']));
        }

        User::create([
            'name' => $name,
            'email' => $email,
            'password' => $password
        ]);

        return(response()->json(['message' => 'User registered successfully!']));
    }

    public function updateProfile(Request $request)
    {
        // print_r($request->id==$request->get('user')['id']);

        // print_r($request->email == $request->get('user')['email']);

        // print_r($request->name == $request->get('user')['name']);

        if($request->profileData['id']!=$request->get('user')['id'] || $request->profileData['email'] != $request->get('user')['email'] || $request->profileData['name'] != $request->get('user')['name']){
            return(response()->json(['message' => 'Some error in data']));
        }

        User::where('id',$request->profileData['id'])->update([
            'phone' => $request->profileData['phone'],
            'address' => $request->profileData['address'],
            'state' => $request->profileData['state'],
            'zip' => $request->profileData['zip']
        ]);

        return(response()->json(['message' => 'Profile updated successfully!']));
    }

    public function updatePassword(Request $request)
    {
        if($request->get('user')['password'] == $request->current_password){

            if($request->new_password==$request->confirm_password){
                User::where('id',$request->get('user')['id'])->update([
                    'password' => $request->confirm_password,
                ]);

                return(response()->json(['message' => "Password updated successfully!"]));
            }

            return(response()->json(['message' => "New Password and Confirm Password don't match"]));
        }

        return(response()->json(['message'=>"Incorrect Current Password"]));
    }


    public function logout(Request $request)
    {
        $plainToken = $request->cookie('token');

        $token = CustomToken::where('token_value',hash('sha256',$plainToken))->first();

        if(!$token){
            return(response()->json(['message' => 'User already logged out!']));
        }

        $token->delete();

        $cookie = cookie()->forget('token');

        return(response()->json(['message' => 'User logged out successfully!'])->withCookie($cookie));
    }

}

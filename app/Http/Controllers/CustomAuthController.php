<?php


 namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Session;

use Illuminate\Http\Request;



use App\User;




class CustomAuthController extends Controller

{


    public function index()

    {

        return view('auth.login');

    }  

      

    public function customLogin(Request $request)

    {

        $request->validate([

            'username' => 'required',

            'password' => 'required',

        ]);

    $userInfo = User::where('username','=',$request->username)->first();

    if (!$userInfo) {
        return back()->with('fail','we do not recognize you');
    }else {
        if (Hash::check($request->password,$userInfo->password)) {
            $request->session()->put('LoggedUser',$userInfo->id);
           return redirect('front.summary');       
    }else {
        return back()->with('fail','Incorrect Password');
    }
 

       /* $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {

            return redirect()->intended('front.summary')

                        ->withSuccess('Signed in');

        }

  

        return redirect("login")->withSuccess('Login details are not valid');

    }*/


    
    }
}
  
    

    public function dashboard()

    {

        if(Auth::check()){

            return view('front.summary');

        }

  

        return redirect("login")->withSuccess('You are not allowed to access');

    }

    

    public function signOut() {

        Session::flush();

        Auth::logout();

  

        return Redirect('login');

    }

}
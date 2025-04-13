<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        $cartData = Cart::where('product_id',$request->id)->where('user_id',$request->get('user')['id'])->first();

        if($cartData){
            Cart::where('product_id',$request->id)->where('user_id',$request->get('user')['id'])->update([
                'count'=>$cartData->count+1,
            ]);

            return(response()->json(['message'=>'Cart profile updated']));
        }

        Cart::create([
            'product_id' => $request->id,
            'count' => 1,
            'user_id' =>$request->get('user')['id'],
        ]);

        return(response()->json(['message' => 'Product added in cart']));
    }

    public function getCartInfo(Request $request)
    {
        $cartCount = Cart::where('user_id',$request->get('user')['id'])->get();

        if(!$cartCount){
            return(response()->json(['cartCount' => 0]));
        }

        return(response()->json(['cartCount' => $cartCount->count()]));
    }

    public function getCartItems(Request $request)
    {
        $cartItems = DB::table('cart')->where('user_id',$request->get('user')['id'])->join('products', 'cart.product_id','=','products.id')->select('products.id','products.title','products.image','products.price','cart.count')->get();

        $totalCost = 0;

        foreach($cartItems as $cartItem){
            $totalCost+=doubleval(($cartItem->price)*($cartItem->count));
        }

        return(response()->json(['cartItems' => $cartItems,'totalCost' => $totalCost]));
    }

    public function removeFromCart(Request $request)
    {
        $cartItem = Cart::where('user_id',$request->get('user')['id'])->where('product_id',$request->id)->first();

        if($cartItem){
            if($cartItem->count>1){
                Cart::where('user_id',$request->get('user')['id'])->where('product_id',$request->id)->update([
                    'count'=>$cartItem->count-1,
                ]);
            }
            else{
                $cartItem->delete();
            }

            return(response()->json(['message' => "Product deleted from the cart"]));
        }

        return(response()->json(['message' => "Product does not exists in the cart"]));
    }

}

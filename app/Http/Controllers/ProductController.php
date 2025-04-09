<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{

    public function getproducts()
    {
        $products = Products::all();

        foreach ($products as $product) {
            $product->image = asset('public/'. $product->image);
        }

        return(response()->json(['products'=>$products]));
    }

    public function getProductInfo($id)
    {
        $productInfo = DB::table('products')->join('rating','products.rate_id','=','rating.id')->join('category','products.category','=','category.id')->where('products.id',$id)->select('products.id','products.title','products.price','products.description','products.image','rating.rate','category.id','category.category_name',)->first();

        $productInfo->image = asset('public/'. $productInfo->image);

        return(response()->json(['productInfo'=>$productInfo]));
    }
}

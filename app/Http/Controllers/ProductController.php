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
            // 'public/'.
            $product->image = asset($product->image);
        }

        return(response()->json(['products'=>$products]));
    }

    public function getProductInfo($id)
    {
        $productInfo = DB::table('products')->join('rating','products.rate_id','=','rating.id')->join('category','products.category','=','category.id')->where('products.id',$id)->select('products.id as product_id','products.title','products.price','products.description','products.image','rating.rate','category.id as category_id','category.category_name')->first();
        // 'public/'.
        $productInfo->image = asset($productInfo->image);

        return(response()->json(['productInfo'=>$productInfo]));
    }


    public function getProductsCategory($id)
    {
        $productInfoCategory = Products::where('category',$id)->get();

        foreach($productInfoCategory as $product){
            // 'public/'.
            $product->image = asset($product->image);
        }

        return(response()->json(['productInfoCategory'=>$productInfoCategory]));
    }

}

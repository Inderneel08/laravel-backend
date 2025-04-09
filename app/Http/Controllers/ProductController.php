<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

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
        // $productInfo = DB::table('')
    }
}

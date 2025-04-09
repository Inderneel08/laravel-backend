<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    //

    public function getAllCategories()
    {
        $categories = DB::table('category')->select('category.id','category.category_name','category.title_name')->get();

        return(response()->json(['categories'=>$categories]));
    }

}

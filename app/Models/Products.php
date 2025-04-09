<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $fillable = ['title', 'price','description','category','image','rate_id'];

    protected $table='products';

    public $timestamps = false;

    public function ratings()
    {
        return($this->hasMany(Rating::class,'rate_id'));
    }

    public function categories()
    {
        return($this->hasMany(Category::class,'category'));
    }
}

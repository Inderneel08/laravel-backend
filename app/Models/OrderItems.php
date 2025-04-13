<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItems extends Model
{
    protected $fillable = ['product_id','count','order_id','cart_id'];

    protected $table='order_items';

    public $timestamps = false;
}

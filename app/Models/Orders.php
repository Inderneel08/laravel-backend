<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    protected $fillable = ['order_id','cf_order_id','order_amount','payment_session_id','created_at','table_name','table_id','current_status'];

    protected $table='orders';

    public $timestamps = false;
}

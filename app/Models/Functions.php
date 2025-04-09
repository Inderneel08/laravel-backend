<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Functions extends Model
{
    protected $table='functions';

    public $timestamps = false;

    protected $fillable = ['function_name'];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Anonymus extends Model
{
    protected $fillable = ['first_name','last_name','email','address','address2','state','zip','phone'];

    protected $table='anonymus';

    public $timestamps = false;
}

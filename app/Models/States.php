<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class States extends Model
{
    protected $fillable = ['state_name'];

    protected $table='states';

    public $timestamps = false;
}

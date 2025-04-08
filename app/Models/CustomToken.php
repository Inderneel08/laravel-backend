<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomToken extends Model
{
    //

    protected $fillable = ['user_id', 'token_value'];

    protected $table='token_table';

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}

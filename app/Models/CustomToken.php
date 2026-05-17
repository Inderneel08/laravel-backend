<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomToken extends Model
{
    use SoftDeletes;

    protected $fillable = ['user_id', 'token_value'];

    protected $table='token_table';

    public $timestamps = false;

    protected $dates = [
        'created_at',
        'deleted_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}

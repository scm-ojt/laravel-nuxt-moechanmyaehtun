<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\SoftDeletes;


class Post extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $fillable = [
          'title',
          'image'

    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Site extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'category_id',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    // return site from user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // create site with use id and name
    public static function createSite($userId, $name)
    {


        $site = Site::where('user_id', auth()->user()->id)->first();
        $site_id = $site ? $site->id : null;

        if ($site_id) {
            var_dump('site_id exists');
        }
        $site = new Site();
        $site->user_id = $userId;
        $site->name = $name;
        $site->save();
        return $site;
    }
   

}

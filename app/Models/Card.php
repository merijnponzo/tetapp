<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// debug
use Illuminate\Support\Facades\Log;

class Card extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'category_id'
    ];


    // validate on name


    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    // return site from user
    public function user()
    {
        return $this->belongsTo(User::class);
    }



    // get all categories by site and users
    public static function getCardsByCategory($category_id)
    {
        $cards =  Card::where(['category_id' => $category_id])->get();
        return $cards;
    }


    public static function createCard($category_id, $card_id, $request)
    {

     
        // create card or update card if $card_id === 'create'
        if ($card_id === 'create') {
            $card = new Card();
            $card->category_id = $category_id;
            $card->name = $request['name'];
            $card->save();
        } else {
            $card = Card::find($card_id);
            $card->name = $request['name'];
            $card->save();
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Card;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Log;

class BrowseController extends Controller
{


    protected $site_id = null;
    protected $user_id = null;

    public function __construct()
    {
    }

    private function getSiteId()
    {
        if (auth()->check()) {
            if (auth()->user()->site == null) {
                return null;
            } else {
                return auth()->user()->site->id;
            }
        }
    }

    private function getUserId()
    {
        if (auth()->check()) {
            return auth()->user()->id;
        }
    }

    public function landing()
    {

        if (self::getSiteId() && self::getUserId()) {
            return redirect()->route('browse.index');
        } else if (self::getSiteId() && !self::getUserId()) {
            return redirect()->route('site.index');
        } else {
            return Inertia::render(
                'Landing',
                []
            );
        }
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {


        return Inertia::render(
            'Browse/Index',
            [
                'primary' => false,
                'secondary' => false,
                'categories' => Category::getPrimaryCategories(self::getSiteId()),
                'cards' => []
            ]
        );
    }


    /**
     * Display a listing of the resource.
     */
    public function category($category_id)
    {

        $categories = Category::getCategoriesByParent($category_id, self::getSiteId());

        return Inertia::render('Browse/Index', [
            'primary' => Category::getSingleCategory($category_id, self::getSiteId()),
            'secondary' => false,
            'categories' => $categories,
            'cards' => [],
            'current_browse' => 'category',
            'next_browse' => 'card'
        ]);
    }

    /**
     * Display a listing of the resource.
     */
    public function category_cards($category_id)
    {

        $secondary = Category::getSingleCategory($category_id, self::getSiteId());
        $primary = Category::getSingleCategory($secondary->parent_id, self::getSiteId());



        return Inertia::render('Browse/Index', [
            'primary' => $primary,
            'secondary' => $secondary,
            'categories' => [],
            'cards' => Card::getCardsByCategory($category_id)
        ]);
    }



    // card form landing
    public function form($category_id, $card_id = 'create')
    {
        // get card
        if ($card_id !== 'create') {
            $card = Card::find($card_id);
        } else {
            $card = null;
        }

        $category = Category::getSingleCategory($category_id, self::getSiteId());


        return Inertia::render('Browse/Form', [
            'category_id' => $category_id,
            'card_id' => $card_id,
            'card' => $card,
            'category' => $category,
        ]);
    }


    // create card
    public function create_card(Request $request, $category_id, $card_id)
    {

        $validatedData = $request->validate([
            'name' => 'required|max:128|min:2',
        ]);

        $card = Card::createCard($category_id, $card_id, $validatedData);
     

        return redirect()->route('browse.cards', ['category_id' => $category_id]);
    }


    public function delete_Card(Request $request, $category_id, $card_id)
    {
        $card = Card::find($card_id);
        $card->delete();
        return redirect()->route('browse.cards', ['category_id' => $category_id]);
    }
}

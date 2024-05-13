<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// debug
use Illuminate\Support\Facades\Log;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'category_id',
        'name',
        'type'
    ];

    static $categories = [
        'relaties' => [],
        'spullen' => [],
        'handelingen' => [],
        'locaties' => []
    ];


    // create construct with categories
    public function __construct(array $attributes = [])
    {

        $relaties = [
            'Familie',
            'Vrienden',
            'Collega\'s',
            'Buren',
            'Huisdieren'
        ];
        $spullen = [
            'Telefoon',
            'Kleding',
            'Bank',
            'Stoel',
            'Gereedschap'
        ];
        $handelingen = [
            'Eten',
            'Drinken',
            'Slapen',
            'Werken',
            'Aankleden',
        ];
        $locaties = [
            'Thuis',
            'Werk',
            'Vakantie',
            'Onderweg'
        ];

        self::$categories = [
            'relaties' => $relaties,
            'spullen' => $spullen,
            'handelingen' => $handelingen,
            'locaties' => $locaties
        ];
    }



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
    public static function createDefaultCategories()
    {
        // get current user site


        $site = Site::where('user_id', auth()->user()->id)->first();
        $site_id = $site ? $site->id : null;
        $site_created = $site ? $site->created : null;


        $categories = [
            ['name' => 'Relaties', 'type' => 'relaties', 'lock' => 1, 'handle' => 'primary'],
            ['name' => 'Spullen', 'type' => 'spullen', 'lock' => 1, 'handle' => 'primary'],
            ['name' => 'Handelingen', 'type' => 'handelingen', 'lock' => 1, 'handle' => 'primary'],
            ['name' => 'Locaties', 'type' => 'locaties', 'lock' => 1, 'handle' => 'primary'],
        ];

        if ($site_id && !$site_created) {
            foreach ($categories as $categoryData) {
                $category = new Category();
                $category->name = $categoryData['name'];
                $category->type = $categoryData['type'];
                $category->lock = $categoryData['lock'];
                $category->handle = $categoryData['handle'];
                $category->site_id = $site_id;
                $category->save();
            }

            $categories = Category::where(
                [
                    'site_id' => $site_id,
                    'handle' => 'primary'
                ]
            )->get();

            foreach ($categories as $category) {
                self::createDefaultItems($category->id, self::$categories[$category->type], $site_id);
            }
            // update site->created
            $site->created = 1;
            $site->save();
        }
    }

    private static function createDefaultItems($parent_id, $children, $site_id)
    {

        foreach ($children as $child) {
            $item = new Category();
            $item->name = $child;
            $item->parent_id = $parent_id;
            $item->site_id = $site_id;
            $item->type = strtolower($child);
            $item->handle = 'secondary';
            $item->save();
        }
    }


    // get all categories by site and users
    public static function getPrimaryCategories($site_id)
    {
        $categories =  Category::where(['site_id' => $site_id, 'handle' => 'primary'])->get();
        return $categories;
    }

    public static function getCategoriesByParent($category_id, $site_id)
    {
        $categories =  Category::where(['site_id' => $site_id, 'parent_id' => $category_id])->get();
        return $categories;
    }

    public static function getSingleCategory($category_id, $site_id)
    {
        $category =  Category::where(['site_id' => $site_id, 'id' => $category_id])->first();
        return $category;
    }

    public static function updateCategory($category_id, $site_id, $request)
    {
        $card = Category::find($category_id);
        $card->name = $request['name'];
        $card->save();
    }

    public static function createCategory($category_id, $site_id, $request)
    {
        $category = new Category();
        $category->name = $request['name'];

        $category->site_id = $site_id;
        $category->type = strtolower($request['name']);
        $category->visibility = 1;

        if ($category_id === 'false') {
            $category->handle = 'primary';
            $category->parent_id = null;
        } else {
            $category->handle = 'secondary';
            $category->parent_id = $category_id;
        }
        $category->save();

        $lastInsertedId = $category->id;

        return $lastInsertedId;
    }
}

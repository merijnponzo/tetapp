<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class DashboardController extends Controller
{

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



    public function index()
    {

        if (self::getSiteId() && self::getUserId()) {
            return redirect()->route('browse.index');
        } else if (self::getUserId() && !self::getSiteId()) {
            return redirect()->route('site.index');
        } else {
            return Inertia::render(
                'Landing',
                []
            );
        }
    
    }



    // create site
    public function create(Request $request)
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

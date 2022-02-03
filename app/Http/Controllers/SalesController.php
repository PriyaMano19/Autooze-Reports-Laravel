<?php

namespace App\Http\Controllers;
use Carbon\Carbon;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;


use App\SalesSummary;



class SalesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showsales()
    {
        $salessummary = SalesSummary::whereDate('Created_At', Carbon::today())->get();
        $t_orders = SalesSummary::whereDate('Created_At', Carbon::today())->count();
        $t_sales=SalesSummary::whereDate('Created_At', Carbon::today())->sum('Total_Purchase_Price');
        return view('front.salesummary',compact('salessummary','t_orders','t_sales'));
    }

    public function mobilesales()
    {
        $salessummary = SalesSummary::whereDate('Created_At', Carbon::today())->get();
        $t_orders = SalesSummary::whereDate('Created_At', Carbon::today())->count();
        $t_sales=SalesSummary::whereDate('Created_At', Carbon::today())->sum('Total_Purchase_Price');
        return view('front.sales_Mobile',compact('salessummary','t_orders','t_sales'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
  

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

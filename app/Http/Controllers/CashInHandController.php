<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;

use App\SalesSummary;
use App\ExpenseSummary;
use App\PurchaseSummary;
use App\CashInHand;

class CashInHandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()

    {

        
        $cashin=SalesSummary::whereDate('Created_At', Carbon::today())->sum('Amount');
        return view('front.CashInHand',compact('cashin'));

        
        //$t_cashin = CashInHand::whereDate('created', Carbon::today())->where('method', 'cash')->sum('amount');
        //$t_Pamount=PurchaseSummary::whereDate('created_at', Carbon::today())->sum('purchase_price');
        //$t_amount=ExpenseSummary::whereDate('created', Carbon::today())->sum('amount');
        //return view('front.CashInHand',compact($t_Pamount,$t_amount));
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
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

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

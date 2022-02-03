@extends('layouts.master')
@section('content')

<div class="card-deck">

  <div class="card">
  <a style="text-decoration:none" href="sale">
    <img src="{{asset('images/sales.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">Sales Total</h2>
      <h3 class="card-text">RS {{$t_sales}}.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
    </a>
  </div>

  <div class="card">
  <img src="{{asset('images/cogs.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">COGS</h2>
      <h3 class="card-text">RS {{$cogs}}.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
  <img src="{{asset('images/return-total.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">Return Total</h2>
      <h3 class="card-text">RS 10000.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>


<br><br>
<div class="card-deck">
  <div class="card">
  <a style="text-decoration:none" href="expense">
  <img src="{{asset('images/expense-total.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">Expense Total</h2>
      <h3 class="card-text">RS {{$t_expense}}.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
   </a>
  </div>
  <div class="card">
  <img src="{{asset('images/net-total.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">Net Total</h2>
      <h3 class="card-text">RS {{$net_total}}.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
  <img src="{{asset('images/gross-profit.png')}}" class="card-img-top" alt="image">
    <div class="card-body">
    <h2 class="card-title">Gross Profit</h2>
      <h3 class="card-text">RS 10000.00</h3>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>



@endsection
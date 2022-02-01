@extends('layouts.master')
@section('content')
<div class="cash-card">
<div class="card ">
  <div class="card-header">
    <h3>CASH IN</h3>
  </div>
  <div class="card-body">
    <h5 class="card-title text-center">Rs. 0.00</h5>
    <h7 class="card-title  text-left">Cash Sales Total</h7><h7 class="card-title  text-right">Cash Sales Total</h7><br>
    <h7 class="card-title">Received total</h7> <br>
  
  </div>
  <div class="card-footer text-muted text-center">
    2 days ago
  </div>
</div>
<br>

<div class="card">
  <div class="card-header">
    <h3>CASH OUT</h3>
  </div>
  <div class="card-body">
  <h5 class="card-title text-center">Rs. 0.00</h5>
  <h7 class="card-title">Sales Returns Total</h7><br>
    <h7 class="card-title">expense Total</h7><br>
    <h7 class="card-title">Payment Total</h7><br>
    <h7 class="card-title">Card Collection Total</h7><br>
  </div>
  <div class="card-footer text-muted  text-center">
    2 days ago
  </div>
</div>
<br>
<div class="card">
  <div class="card-header">
  <h3>CASH DRAWER BALANCE</h3>
  </div>
  <div class="card-body">
  <h5 class="card-title text-center">Rs. 0.00</h5>
  <h7 class="card-title">Cash In Total</h7><br>
    <h7 class="card-title">Cash Out Total</h7><br>
   
  </div>
  <div class="card-footer text-muted text-center">
    2 days ago
  </div>
</div>
</div>


@endsection
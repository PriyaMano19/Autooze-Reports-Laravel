@extends('layouts.master')
@section('content')

<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
      <img src="{{asset('images/icon1.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Daily Expenses</h5>
        <h3 class="card-text">RS {{$t_amount}}.00</h3>
       
      </div>
    </div>
  </div>
 
  <div class="col-sm-6">
    <div class="card"  >
      <div class="card-body">
      <img src="{{asset('images/icon_order.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Total expenses</h5>
        <h3 class="card-text">{{$t_expenses}}</h3>
        <!--<a href="#" class="btn btn-primary">Go somewhere</a>-->
      </div>
    </div>
  </div>
</div>


<br>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
               
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span> </label> </th>
                                <th scope="col">ID</th>
                                <th scope="col">Payee_Name</th>
                                <th scope="col">Amount</th>
                                <th scope="col">Created_At</th>
                                
                            </tr>
                        </thead>
                        <tbody class="customtable">
                          @foreach($expensesummary as $data)
                            <tr>
                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
                                <td>{{$data->id}}</td>
                                <td>{{$data->payee_name}}</td>
                                <td>{{$data->amount}}</td>
                                <td>{{$data->created}}</td>
                                
                            </tr>
                           @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
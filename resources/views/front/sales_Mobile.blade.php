@extends('layouts.master')
@section('content')

<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
      <img src="{{asset('images/icon_sale.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Total Sales</h5>
        <h3 class="card-text">RS.{{$t_sales}}.00</h3>
       
      </div>
    </div>
  </div>
 
  <div class="col-sm-6">
    <div class="card"  >
      <div class="card-body">
      <img src="{{asset('images/icon_sale.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Total Orders</h5>
        <h3 class="card-text">{{$t_orders}}</h3>
        
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
                                <th scope="col">OrderId</th>
                            
                                <th scope="col">Amount</th>
                                
                                
                            </tr>
                        </thead>
                        <tbody class="customtable">
                          @foreach($salessummary as $value)
                            <tr>
                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
                                <td>{{$value->order_id}}</td>
                               
                                <td>{{$value->Amount}}</td>
                               
                               
                               
                                
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
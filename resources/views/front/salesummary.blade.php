@extends('layouts.master')
@section('content')

<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
      <img src="{{asset('images/icon_sale.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Daily Sales</h5>
        <h3 class="card-text">RS {{$t_sales}}.00</h3>
       
      </div>
    </div>
  </div>
 
  <div class="col-sm-6">
    <div class="card"  >
      <div class="card-body">
      <img src="{{asset('images/icon_order.svg')}}" class="icon_sale" alt="image">
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
                                <th scope="col">bill_no</th>
                                <th scope="col">Amount</th>
                                <th scope="col">Item_Id</th>
                                <th scope="col">Item_name/Service</th>
                                <th scope="col">Total_Purchase_Price</th>
                                <th scope="col">Created_At</th>
                                
                            </tr>
                        </thead>
                        <tbody class="customtable">
                          @foreach($salessummary as $value)
                            <tr>
                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
                                <td>{{$value->order_id}}</td>
                                <td>{{$value->bill_no}}</td>
                                <td>{{$value->Amount}}</td>
                                <td>{{$value->item_id}}</td>
                                <td>{{$value->Item_nameOrService}}</td>
                                <td>{{$value->Total_Purchase_Price}}</td>
                                <td>{{$value->Created_At}}</td>
                               
                               
                                
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
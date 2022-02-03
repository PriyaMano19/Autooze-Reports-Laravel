@extends('layouts.master')
@section('content')

<div class="row">
  <div class="col-sm-6">
    <div class="card" >
      <div class="card-body">
         <img src="{{asset('images/icon_sale.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Daily Purchases</h5><br>
        <h3 class="card-text">RS {{$t_Pamount}}.00</h3>
      
      </div>
    </div>
  </div>
 
  <div class="col-sm-6">
    <div class="card"  >
      <div class="card-body">
          
         <img src="{{asset('images/icon_order.svg')}}" class="icon_sale" alt="image">
        <h5 class="card-title">Total Purchases</h5><br>
        <h3 class="card-text">{{$t_purchase}}</h3>
    
      </div>
    </div>
  </div>
</div>


<br>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card-table">
            <div class="card">
               
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span> </label> </th>
                                <th scope="col">ID</th>
                                <th scope="col">Purchase_Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Created_At</th>
                                
                            </tr>
                        </thead>
                        <tbody class="customtable">
                          @foreach($purchasesummary as $datas)
                            <tr>
                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
                                <td>{{$datas->id}}</td>
                                <td>{{$datas->purchase_price}}</td>
                                <td>{{$datas->quantity}}</td>
                                <td>{{$datas->created_at}}</td>
                                
                            </tr>
                           @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection
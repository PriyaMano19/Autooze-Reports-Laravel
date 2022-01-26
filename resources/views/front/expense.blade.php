@extends('layouts.master')
@section('content')

<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
   
        <h5 class="card-title">Total Expenses</h5>
        <h3 class="card-text">RS 1000.00</h3>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
 
  <div class="col-sm-6">
    <div class="card"  >
      <div class="card-body">
        <h5 class="card-title">Total Orders</h5>
        <h3 class="card-text">5231</h3>
        <a href="#" class="btn btn-primary">Go somewhere</a>
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
                                <th scope="col">Country</th>
                                <th scope="col">Browser</th>
                                
                            </tr>
                        </thead>
                        <tbody class="customtable">
                            <tr>
                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
                                <td>India</td>
                                <td>Chrome OS</td>
                                
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
<!DOCTYPE html>
<html>
  <head>
    <title>Autooze-Reports</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <link href="{{ asset('css/form.css') }}" rel="stylesheet">
    <link href="{{ asset('css/table.css') }}" rel="stylesheet">
    <link href="{{ asset('css/sidebar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <script type="text/javascript" src="{{ asset('js/sidebar.js') }}"></script>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="js/addons/datatables.min.js"></script>
    <style>
      * {
      box-sizing: border-box;
      }
      #myInput {
      background-image: url('/css/searchicon.png');
      background-position: 10px 10px;
      background-repeat: no-repeat;
      width: 100%;
      font-size: 16px;
      padding: 12px 20px 12px 40px;
      border: 1px solid #ddd;
      margin-bottom: 12px;
      }
      #myTable {
      border-collapse: collapse;
      width: 100%;
      border: 1px solid #ddd;
      font-size: 18px;
      }
      #myTable th, #myTable td {
      text-align: left;
      padding: 12px;
      }
      table.dataTable thead .sorting:after,
      table.dataTable thead .sorting:before,
      table.dataTable thead .sorting_asc:after,
      table.dataTable thead .sorting_asc:before,
      table.dataTable thead .sorting_asc_disabled:after,
      table.dataTable thead .sorting_asc_disabled:before,
      table.dataTable thead .sorting_desc:after,
      table.dataTable thead .sorting_desc:before,
      table.dataTable thead .sorting_desc_disabled:after,
      table.dataTable thead .sorting_desc_disabled:before {
      bottom: .5em;
      }
      #myTable tr {
      border-bottom: 1px solid #ddd;
      }
      #myTable tr.header, #myTable tr:hover {
      background-color: #f1f1f1;
      }
    </style>
  </head>
  <body >
    <div class='dashboard'>
      <div class="dashboard-nav">
        <header><a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a><a href="#"
          class="brand-logo"><i
          class="fas fa-anchor"></i> <span>Autooze</span></a></header>
        <nav class="dashboard-nav-list">
          <a href="#" class="dashboard-nav-item"><i class="fas fa-home"></i> Home </a>
          <a href="summary" class="dashboard-nav-item active"><i class="fas fa-tachometer-alt"></i> Daily Insights</a>
          <a href="cash" class="dashboard-nav-item"><i class="fas fa-money-bill-alt"></i></i> Cash In Hand </a>
          <div class='dashboard-nav-dropdown'>
            <a href="#!" class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i class="fas fa-chart-line"></i> Daily Summary </a>
            <div class='dashboard-nav-dropdown-menu'>
              <a href="sale" class="dashboard-nav-dropdown-item">Daily Sales</a>
              <a href="expense" class="dashboard-nav-dropdown-item">Daily Expenses</a>
              <a href="purchase" class="dashboard-nav-dropdown-item">Daily purchases</a>
            </div>
          </div>
          <div class='dashboard-nav-dropdown'>
            <a href="#!" class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i
              class="fas fa-users"></i> Users </a>
            <div class='dashboard-nav-dropdown-menu'><a href="#"
              class="dashboard-nav-dropdown-item">All</a><a
              href="#" class="dashboard-nav-dropdown-item">Subscribed</a><a
              href="#"
              class="dashboard-nav-dropdown-item">Non-subscribed</a><a
              href="#" class="dashboard-nav-dropdown-item">Banned</a><a
              href="#" class="dashboard-nav-dropdown-item">New</a></div>
          </div>
          <div class='dashboard-nav-dropdown'>
            <a href="#!" class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i
              class="fas fa-money-check-alt"></i> Payments </a>
            <div class='dashboard-nav-dropdown-menu'><a href="#"
              class="dashboard-nav-dropdown-item">All</a><a
              href="#" class="dashboard-nav-dropdown-item">Recent</a><a
              href="#" class="dashboard-nav-dropdown-item"> Projections</a>
            </div>
          </div>
          <a href="#" class="dashboard-nav-item"><i class="fas fa-cogs"></i> Settings </a><a
            href="#" class="dashboard-nav-item"><i class="fas fa-user"></i> Profile </a>
          <div class="nav-item-divider"></div>
          <a
            href="{{ route('signout') }}" class="dashboard-nav-item"><i class="fas fa-sign-out-alt"></i> Logout </a>
        </nav>
      </div>
      <div class='dashboard-app'>
        <header class='dashboard-toolbar'><a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a></header>
        <div class='dashboard-content'>
          <div class='container'>
            @yield('content')
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

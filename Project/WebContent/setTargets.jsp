<%@page import="model.userDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Daily Expense Tracker</title>
	<img src="confs/dist/img/dailyExpenseTracker.jpg"/>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="confs/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="confs/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="confs/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="Home" class="nav-link">Home</a>
      </li>
      <!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button"><i
            class="fas fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="Home" class="brand-link">
      <img src="confs/dist/img/dailyExpenseTracker.png" alt="Expense Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Daily Expense Tracker</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <!-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
                <a href="./profile.html" class="nav-link">
                  <i class="far fa-user nav-icon"></i>
                  <p>Profile</p>
                </a>
        </div>
      </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2">
	  <ul class="nav nav-pills nav-sidebar flex-column">
          <li class="nav-item">
              <a href="Profile" class="nav-link">
                  <i class="far fa-user nav-icon"></i>
                  <p>Profile</p>
            </a>
          </li>
		  
		  <li class="nav-item">
                <a href="Report" class="nav-link">
                  <i class="fas fa-chart-line nav-icon"></i>
                  <p>Reports</p>
                </a>
         </li>
		 
		 <li class="nav-item">
                <a href="setTargets" class="nav-link">
                  <i class="fas fa-bullseye nav-icon"></i>
                  <p>Set Targets</p>
                </a>
         </li>
		 
		 <li class="nav-item">
                <a href="Logout" class="nav-link">
                  <i class="fas fa-sign-out-alt nav-icon"></i>
                  <p>Logout</p>
                </a>
         </li>
	  </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Daily Expense Tracker</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Home">Home</a></li>
			  <li class="breadcrumb-item active">Set Targets</li>
              <!-- <li class="breadcrumb-item active">Dashboard v2</li> -->
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <% 
    userDetails us = new userDetails();
    us.select((String)session.getAttribute("username"), us);
    %>
<div class="login-logo">
    <b>Set Targets</b>
  </div>
    <!-- Main content -->
    <section class="content">
	<div class="row">
	<div class="col-18 col-sm-10 col-md-6">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-rupee-sign"></i></span>

              <div class="info-box-content">
                <span class="info-box-text"><strong>Current Target</strong></span>
                <span class="info-box-number">
                  <i class="fas fa-rupee-sign"></i> <%=us.getTarget() %>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
		  <div class="col-18 col-sm-10 col-md-6">
            <div class="info-box">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-rupee-sign"></i></span>

              <div class="info-box-content">
                <span class="info-box-text"><strong>Current Income</strong></span>
                <span class="info-box-number">
                  <i class="fas fa-rupee-sign"></i> <%=us.getSalery() %>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
		 </div>
      <div class="container-fluid col-md-4 col-md-offset-4">
        <!-- Info boxes -->
		<div class="row">
		 <div class="text-box">
		 
		 </div>
		</div>
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body" >
      <form action="setTargets" method="post">
        <div class="input-group mb-3">
          <input type="number" name="salery" class="form-control" placeholder="Total income per month" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-rupee-sign"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="number" name="target" class="form-control" placeholder="Amount to save money" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-rupee-sign"></span>
            </div>
          </div>
        </div>
		
		<!-- <div class="input-group mb-3">
		<input type="number" class="form-control" placeholder="Remaining Amount with you" required>
			<div class="input-group-append">
				<div class="input-group-text">
					<span class="fas fa-rupee-sign"></span>
				</div>
			</div>
		</div> -->
		<div class="row">
           <div class="col-12">
		  <button type="submit" class="btn btn-info btn-block">Set New Target</button>
          </div>
		  </div>
          <!-- /.col -->
          <!-- /.col -->
        </div>
      </form>
     <!--  <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">New Registration</a>
      </p> -->
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
                <!-- /.row -->
              </div>
            </div>
            <!-- /.card -->
          </div>


        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <div class="col-md-8">
            <!-- MAP & BOX PANE -->
         
            <!-- /.card -->
            <div class="row">
              <div class="col-md-6">
                <!-- DIRECT CHAT -->
              
                <!--/.direct-chat -->
              </div>
              <!-- /.col -->
              <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- TABLE: LATEST ORDERS -->
           
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; <script>document.write(new Date().getFullYear());</script> </strong>
    <div class="float-right d-none d-sm-inline-block">
	   <strong>All rights reserved.</strong>
    </div>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="confs/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="confs/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="confs/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="confs/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="confs/dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="confs/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="confs/plugins/raphael/raphael.min.js"></script>
<script src="confs/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="confs/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="confs/plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="confs/dist/js/pages/dashboard2.js"></script>
</body>
</html>

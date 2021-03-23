<%@page import="model.savings"%>
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
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Reports</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

					<%
                    savings sv2 = new savings();
                    sv2.setUsername((String)session.getAttribute("username"));
                 	sv2.select(sv2);
 					
                 	int total = 0;
                 	int t_target = 0;
                 	
                 	while(sv2.rs.next()){
                 		total = total + sv2.rs.getInt(3);
                 		t_target = t_target + sv2.rs.getInt(4);
                 	}
                 	
                 	int pa = (total * 100)/t_target;
                 	
                 	String s3;
                 	String s31;
                 	
                 	if(pa > 0){
                    	s3 = "up";
                    	s31 = "success";
                    }else{
                    	s3 = "down";
                    	s31 = "danger";
                    }
                    %>

    <!-- Main content-->
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
		<div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Report</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
			  <div class="card-footer">
                <div class="row">
                  <div class="col-sm-3 col-6">
                    <div class="description-block border-right">
                      <span class="description-percentage text-<%=s31 %>"><i class="fas fa-caret-<%=s3 %>"></i><%=pa%>%</span>
                      <h5 class="description-header"><i class="fas fa-rupee-sign"></i> <%=total %></h5>
                      <span class="description-text">Total Saving's</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                    <!-- /.description-block -->
                  </div>
                </div>
                <!-- /.row -->
              </div>
            </div>
			
	
        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <div class="col-md-12">
            
              <!-- /.col -->

<!-- Today's Transaction -->
              <div class="col-md-12">             
              <div class="card col-md-12">
              <div class="card-header border-transparent">
                <h3 class="card-title">This Month</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="table-responsive ">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>Date</th>
                      <th>Saved</th>
                      <th>Achieve</th>
                      <th>Target</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                    sv2.rs.beforeFirst();
                    %>
                    
                    <% while(sv2.rs.next()){ 
                    String s;
                    String s1;
                    int p = 0;
                    
                    if(sv2.rs.getInt(3) > 0){
                    	s = "up";
                    	s1 = "success";
                    }else{
                    	s = "down";
                    	s1 = "danger";
                    }
                    p = (sv2.rs.getInt(3) *100 ) / sv2.rs.getInt(4);
                    %>
                    <tr>
                      <td><a href="pages/examples/invoice.html"><%=sv2.rs.getString(2) %></a></td>
                      <td>&#x20B9 <%=sv2.rs.getString(3) %></td>
                      <td><span class="description-percentage text-<%=s1%>"><i class="fas fa-caret-<%=s%>"></i><%=p%>%</span></td>
                      <td>
                        <div class="sparkbar" data-color="#00a65a" data-height="20">&#x20B9 <%=sv2.rs.getString(4) %></div>
                      </td>
                    </tr>
                    <%} %>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <!-- <div class="card-footer clearfix">
                <a href="javascript:void(0)" class="btn btn-sm btn-info float-left">Place New Order</a>
                <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All Orders</a>
              </div> -->
              <!-- /.card-footer -->
            </div>
			
                
                <!--/.card -->
              </div>
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


<script>
  $(function () {

	 <%
	 savings sv = new savings();
	 sv.setUsername((String)session.getAttribute("username"));
	 
	 sv.select(sv);
	 %>
	 
    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#barChart').get(0).getContext('2d')

    var areaChartData = {
      labels  : [
    	  <% while(sv.rs.next()){ %>
    	  "<%=sv.rs.getString(2)%>",
    	  <%}%>],
      datasets: [
        {
          label               : 'Saved Amount',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [<% sv.rs.beforeFirst();
                                 while(sv.rs.next()){ %>
    	  "<%=sv.rs.getString(3)%>",
    	  <%}%>]
        }
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
          }
        }]
      }
    }

   

    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = jQuery.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    //var temp1 = areaChartData.datasets[1]
    //barChartData.datasets[0] = temp1
    barChartData.datasets[0] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChart = new Chart(barChartCanvas, {
      type: 'bar', 
      data: barChartData,
      options: barChartOptions
    })
  })
</script>
</body>
</html>

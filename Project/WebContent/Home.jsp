<%@page import="model.savings"%>
<%@page import="model.userDetails"%>
<%@page import="sun.security.util.Length"%>
<%@page import="model.transaction"%>
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
              <!-- <li class="breadcrumb-item active">Dashboard v2</li> -->
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
		<div class="row">
		 <div class="text-box">
		 
		 </div>
		</div>
		<form action="addEntry" method="post" class="info-box">
        <div class="row">
          <div class="col-12 col-sm-10 col-md-4">
            <div class="info-box">
              <span class="info-box-icon bg-gray elevation-1"><i class="fas fa-rupee-sign"></i></span>

              <div class="info-box-content">
                <span class="info-box-text"><strong>Amount</strong></span>
                <span class="info-box-number">
                  <input type="number" class="form-control" placeholder="Enter Amount" name="amount" required>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-10 col-md-4">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-list-alt"></i></span>

              <div class="info-box-content">
                <span class="info-box-text"><strong>Category</strong></span>
                <span class="info-box-number">
					<select name="category" class="form-control" id="exampleFormControlSelect1" required>
					  <option>- - select - -</option>
					  <option>Food</option>
					  <option>Home Expense</option>
					  <option>Shopping</option>
					  <option>Entertainment</option>
					  <option>Others</option>
					</select>
				</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-10 col-md-4">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="far fa-comment-alt"></i></i></span>

              <div class="info-box-content">
			  <textarea name="comment" class="form-control" rows="2" id="comment" placeholder="Comment" style="height: 60px;"></textarea>
                <!-- <span class="info-box-text">Comments</span>
                <span class="info-box-number"> -->
				
					<!-- <input type="" class="form-control"> -->
				</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
		<div class="col-12 col-sm-8 col-md-3">
            <div class="info-box mb-3">
             <i class=" info-box-icon bg-info fa fa-plus"></i>
              <div class="info-box-content">
			  <button class="btn bg-info btn-block" type="submit" value="submit"><strong>Add</strong></button>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
		</form>
        <!-- /.row -->

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title">Daily Analysis</h5>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
<!--                   <div class="btn-group">
                    <button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown">
                      <i class="fas fa-wrench"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu">
                      <a href="#" class="dropdown-item">Action</a>
                      <a href="#" class="dropdown-item">Another action</a>
                      <a href="#" class="dropdown-item">Something else here</a>
                      <a class="dropdown-divider"></a>
                      <a href="#" class="dropdown-item">Separated link</a>
                    </div>
                  </div> -->
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8">
                    <p class="text-center">
                      <strong>Today's Analysis</strong>
                    </p>

                    <div class="chart">
                      <!-- Sales Chart Canvas -->
                      <canvas id="salesChart" height="180" style="height: 400px;"></canvas>
                    </div>
                    <!-- /.chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-4">
                    <p class="text-center">
                      <strong>Expenses</strong>
                    </p>
						  <!-- Info Boxes Style 2 -->
<%
String username = (String)session.getAttribute("username");

transaction obj = new transaction();
obj.setUsername(username);
obj.select(obj);

int T_Today = 0;
int T_Food = 0;
int T_Shopping = 0;
int T_Entertainment = 0;
int T_Home = 0;
int T_Others = 0;
String a; 

while(obj.rs.next()){
	
	a = obj.rs.getString(5);
	T_Today = T_Today + obj.rs.getInt(3);
	
	if(a.equals("Food")){
		T_Food = T_Food + obj.rs.getInt(3); 
	}else if(a.equals("Shopping")){
		T_Shopping = T_Shopping + obj.rs.getInt(3); 
	}else if(a.equals("Entertainment")){
		 T_Entertainment = T_Entertainment +  obj.rs.getInt(3);
	}else if(a.equals("Home Expense")){
		 T_Home = T_Home +  obj.rs.getInt(3);
	}else{
		 T_Others = T_Others +  obj.rs.getInt(3);
	}	
}
%>
						  
            <div class="info-box mb-3 bg-info">
              <span class="info-box-icon"><i class="fas fa-pizza-slice"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Food</span>
                <span class="info-box-number"><%=T_Food %> &#x20B9</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-warning">
              <span class="info-box-icon"><i class="fa fa-home"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Home Expense</span>
                <span class="info-box-number"><%=T_Home %> &#x20B9</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-success">
              <span class="info-box-icon"><i class="fa fa-shopping-bag"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Shopping</span>
                <span class="info-box-number"><%=T_Shopping %> &#x20B9</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-secondary">
              <span class="info-box-icon"><i class="fa fa-glasses"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Entertainment</span>
                <span class="info-box-number"><%=T_Entertainment %> &#x20B9</span>
              </div>
              <!-- /.info-box-content -->
            </div>
			
			<div class="info-box mb-3 bg-danger">
              <span class="info-box-icon"><i class="fa fa-hashtag" aria-hidden="true"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Others</span>
                <span class="info-box-number"><%=T_Others %> &#x20B9</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
                   
                    <!-- /.progress-group -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- ./card-body -->
              <div class="card-footer">
                <div class="row">
                  <div class="col-sm-3 col-6">
                    <div class="description-block border-right">
                    <%
                    userDetails u = new userDetails();
                    u.select(username, u);
                    
                    int salery_perDay = u.getSalery() / 30;
                    int target_perDay = u.getTarget() / 30;
                    
                    int saved = (salery_perDay - T_Today);
                    
                    String s;
                    String s1;
                    String s21;
                    String s22;
                    
                    
                    if(T_Today < salery_perDay){
                    	s = "up";
                    	s1 = "success";
                    }else{
                    	s = "down";
                    	s1 = "danger";
                    }
                    
                    	int p = (saved * 100)/salery_perDay;
                    	int p2 = (saved * 100 )/(u.getTarget()/30);
                    	
                    	java.util.Date date=new java.util.Date();                		
                		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                    	
                    	savings sv = new savings();
                    	sv.setUsername(username);
                    	sv.setDate(sqlDate);
                    	sv.setTarget(target_perDay);
                    	sv.setSaved(saved);
                    
                    	if(saved > 0){
                        	s21 = "up";
                        	s22 = "success";		
                        }
                    	else{
                    		s21 = "down";
                        	s22 = "danger";
                    	}
                    	
                    	sv.insert(sv);
                    %>
                      <span class="description-percentage text-<%=s1%>"><i class="fas fa-caret-<%=s%>"></i><%=p%>%</span>
                      <h5 class="description-header"><i class="fas fa-rupee-sign"></i><%=T_Today %></h5>
                      <span class="description-text">Today's Total Amount</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                  	<div class="description-block border-right">
                  	  <br>
                      <h5 class="description-header"><i class="fas fa-rupee-sign"></i><%=u.getTarget()/30%></h5>
                      <span class="description-text">Today's Saving Target</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                  	<div class="description-block border-right">
                      <br>
                      <h5 class="description-header"><i class="fas fa-rupee-sign"></i><%=(u.getSalery()/30)-(u.getTarget()/30)%></h5>
                      <span class="description-text">Maximum Expense To Achieve Target</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-3 col-6">
                    <!-- /.description-block -->
                    <div class="description-block border-right">
                      <span class="description-percentage text-<%=s22%>"><i class="fas fa-caret-<%=s21%>"></i><%=p2%>%</span>
                      <h5 class="description-header"><i class="fas fa-rupee-sign"></i><%=(u.getSalery()/30)- T_Today%></h5>
                      <span class="description-text">Money Saved</span>
                    </div>
                  </div>
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

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

<!-- Today's Transaction -->
<%
transaction tran = new transaction();

tran.setUsername(username);
tran.select(tran);

%>

              <div class="col-md-12">             
              <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Today's Transaction</h3>

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
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>Time</th>
                      <th>Amount</th>
                      <th>Category</th>
                      <th>Comments</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%while(tran.rs.next()){ %>
                    <tr>
                      <td><a href="pages/examples/invoice.html"><%=tran.rs.getString(7)%></a></td>
                      <td><%=tran.rs.getInt(3)%> &#x20B9</td>
                      <%
                      String c = tran.rs.getString(5);
                      String s2 = "success";
                      if(c.equals("Food")){
                    	 s2 = "info";
                      }else if(c.equals("Shopping")){
                    	  s2 = "success";
                      }else if(c.equals("Entertainment")){
                    	  s2 = "secondary";
                      }else if(c.equals("Home Expense")){
                    	 s2 = "warning";
                      }else{
                    	  s2="danger";
                      }
                      %>
                      <td><span class="badge badge-<%=s2%>"><%=tran.rs.getString(5)%></span></td>
                      <td>
                        <div class="sparkbar" data-color="#00a65a" data-height="20"><%=tran.rs.getString(6)%></div>
                      </td>
                    </tr>
                    <% } %>
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

          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Today's Expense Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8">
                    <div class="chart-responsive">
                      <canvas id="pieChart" height="150"></canvas>
                    </div>
                    <!-- ./chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-5">
                    <ul class="chart-legend clearfix">
                      <li><i class="far fa-circle text-info"></i> Food</li>
                      <li><i class="far fa-circle text-warning"></i> Home Expense</li>
                      <li><i class="far fa-circle text-success"></i> Shopping</li>
                      <li><i class="far fa-circle text-secondary"></i> Entertainment</li>
                      <li><i class="far fa-circle text-danger"></i> Other</li>
                      
                    </ul>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer bg-white p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item">
                  </li>
                </ul>
              </div>
              <!-- /.footer -->
            </div>
            <!-- /.card -->

            <!-- /.card -->
          </div>
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

<!-- PAGE confs/plugins -->
<!-- jQuery Mapael -->
<script src="confs/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="confs/plugins/raphael/raphael.min.js"></script>
<script src="confs/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="confs/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="confs/plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="confs/dist/js/pages/temp.jsp"></script>
</body>
</html>
    
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>

<!DOCTYPE html>
<html lang="en"> 
<head>
    <title>Portal - Bootstrap 5 Admin Dashboard Template For Developers</title>
    
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico"> 
    
    <!-- FontAwesome JS-->
    <script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
    
    <!-- App CSS -->  
    <link id="theme-style" rel="stylesheet" href="/HR/portal.css">

</head> 

<body class="app"> 
<%
    RequestDispatcher dispatcher =  null;
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String phoneNo = request.getParameter("phoneNo");
    String address = request.getParameter("address");
    Connection co=null;
    Statement st=null;
    ResultSet r=null;
    try{
    //load the jdbc 
        Class.forName("com.mysql.jdbc.Driver"); 
    try{
        co = DriverManager.getConnection("jdbc:mysql://localhost:5500/hr","root","root");
        //create statement
        st=co.createStatement();
       if(firstName == null || lastName == null || phoneNo == null || address == null){
            getServletContext().getRequestDispatcher("/form.jsp").forward(request, response);
        }
        else{
            st.executeUpdate("insert into staff set firstName='"+firstName+"',lastName='"+lastName+"',phoneNo='"+phoneNo+"',address='"+address+"' ");
        }
    }catch(SQLException e){
        //out.println("Error "+e.getMessage()+ "Error");
    }
    }catch(ClassNotFoundException ex){
        System.out.println("Error: "+ ex.getMessage());
    }
     
%>
    <header class="app-header fixed-top">	   	            
        <div class="app-header-inner">  
	        <div class="container-fluid py-2">
		        <div class="app-header-content"> 
		            <div class="row justify-content-between align-items-center">
			        
				    <div class="col-auto">
					    <a id="sidepanel-toggler" class="sidepanel-toggler d-inline-block d-xl-none" href="#">
						    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" role="img"><title>Menu</title><path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M4 7h22M4 15h22M4 23h22"></path></svg>
					    </a>
				    </div><!--//col-->
		            	            		            
		            
		        </div><!--//row-->
	            </div><!--//app-header-content-->
	        </div><!--//container-fluid-->
        </div><!--//app-header-inner-->
        <div id="app-sidepanel" class="app-sidepanel"> 
	        <div id="sidepanel-drop" class="sidepanel-drop"></div>
	        <div class="sidepanel-inner d-flex flex-column">
		        <a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
		        <div class="app-branding">
		            <a class="app-logo" href="index.html"><img class="logo-icon me-2" src="assets/images/app-logo.svg" alt="logo"><span class="logo-text">PORTAL</span></a>
	
		        </div><!--//app-branding-->  
		        
			    <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
				    <ul class="app-menu list-unstyled accordion" id="menu-accordion">
					    <li class="nav-item">
					        <!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
					        <a class="nav-link active" href="index.html">
						        <span class="nav-icon">
						        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
  <circle cx="3.5" cy="5.5" r=".5"/>
  <circle cx="3.5" cy="8" r=".5"/>
  <circle cx="3.5" cy="10.5" r=".5"/>
</svg>
						         </span>
		                         <span class="nav-link-text">Overview</span>
					        </a><!--//nav-link-->
					    </li><!--//nav-item-->
					    		        
		                         
	        </div><!--//sidepanel-inner-->
	    </div><!--//app-sidepanel-->
    </header><!--//app-header-->
    
    <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Staff Management</h1>
			        
			    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
	    
<!--the table for staff details.-->
                                <div class="app-card alert alert-dismissible shadow-sm mb-4 border-left-decoration" role="alert">
                                            <div class="inner">
                                                    <div class="app-card-body p-3 p-lg-4">
                 								    
                                <a href="hr.jsp">    <button type="submit" class="btn app-btn-primary" >Back</button> </a>
                            
                                                            <h3 class="mb-3">Employee Details</h3>

                                                                <div class="app-card-body">
							    <form class="settings-form" method="post" action="form.jsp">
								    <div class="mb-3">
									    <label for="setting-input-1" class="form-label">First Name<span class="ms-2" data-container="body" data-bs-toggle="popover" data-trigger="hover" data-placement="top" data-content="This is a Bootstrap popover example. You can use popover to provide extra info."><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
  <circle cx="8" cy="4.5" r="1"/>
</svg></span></label>
									    <input type="text" class="form-control" id="setting-input-1" name="firstName" required>
									</div>
									<div class="mb-3">
									    <label for="setting-input-2" class="form-label">Last Name</label>
									    <input type="text" class="form-control" id="setting-input-2" name="lastName" required>
									</div>
                                                                        <div class="mb-3">
									    <label for="setting-input-3" class="form-label">Phone NO</label>
									    <input type="text" class="form-control" id="setting-input-3" name="phoneNo">
									</div>
                                                                        <div class="mb-3">
									    <label for="setting-input-3" class="form-label">Address</label>
									    <input type="text" class="form-control" id="setting-input-3" name="address">
									</div>
									<button type="submit" class="btn app-btn-primary" >Add Employee</button>
							    </form>

                            
						    </div><!--//app-card-body-->
                                                    </div><!--//app-card-body-->

                                            </div><!--//inner-->
                                </div><!--//app-card-->
	    
    </div><!--//app-wrapper-->    					

 
    <!-- Javascript -->          
    <script src="assets/plugins/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>  

    <!-- Charts JS -->
    <script src="assets/plugins/chart.js/chart.min.js"></script> 
    <script src="assets/js/index-charts.js"></script> 
    
    <!-- Page Specific JS -->
    <script src="assets/js/app.js"></script> 
</body>
</html> 


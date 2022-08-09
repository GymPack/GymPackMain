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
<%!int salesLine1;%>
<%!int salesLine2;%>
<%!int salesLine3;%>
<%!int salesLine4;%>
 <%
           //the required employee Variables that are required for long-term catergory requirements
        int numberOfStaff;
        double longTermStaff = 0;
        double midTermStaff = 0;
        double shortTermStaff = 0;   
        
        //Variables required for the 4 catergory lines
        int totalSales = 0;
        double clothing = 0;
        double health  = 0;
        double equipment  = 0;
        double electronic  = 0;
    
        try{
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con= null;
        Statement s=null;
        ResultSet r =null;
        try{
        con = DriverManager.getConnection("jdbc:mysql://localhost:5500/hr", "root", "root");
         
        s= con.createStatement();

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
			    
			    
				    
			    <div class="row g-4 mb-4">
<%
               
               //to count the number of workers for the first time basing on the given info
               
            String strQuery = "SELECT COUNT(*) FROM staff";

            ResultSet rs = s.executeQuery(strQuery);

            String workers="";
            while(rs.next()){
            workers = rs.getString(1);
            //out.println("Total Row :" + workers);
             }

            numberOfStaff = Integer.valueOf(workers);
           //calculate the required number of workers
            longTermStaff = Math.round((4/7.0)*(numberOfStaff));  //to convert the string to int
            //out.println("Workers Required for Long-Term Products :" + longTermStaff);

            midTermStaff = Math.round((2/7.0)*(numberOfStaff));
            //out.println("Workers Required for Mid-Term Products :" + midTermStaff);

            shortTermStaff = Math.round((1/7.0)*(numberOfStaff));
            //out.println("Workers Required for Short-Term Products :" + shortTermStaff);
                
                
        %> 

				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Total Staff</h4>
							    <div class="stats-figure"><% out.println( numberOfStaff);%></div>
							    
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Long-Term Product Staff</h4>
							    <div class="stats-figure"><%out.println(longTermStaff);%></div>
							    
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Mid-Term Product Staff</h4>
							    <div class="stats-figure"><%out.println( midTermStaff);%></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Short-Term Product Staff</h4>
							    <div class="stats-figure"><%out.println(shortTermStaff);%></div>
							    
						    </div><!--//app-card-body-->						    
					    </div><!--//app-card-->
				    </div><!--//col-->
<!--For the staff required based on the productline sales-->
<%
                           
           //Getting Employees based on the catergory of the products
           //product line 1(long-term)
           String line1 = "SELECT COUNT(prodName) FROM orders WHERE catergory = 'Clothing'";
           PreparedStatement st=con.prepareStatement(line1);


           ResultSet l1 =st.executeQuery();
           //ResultSet l1 = s.executeQuery(line1);


           while(l1.next()){
           salesLine1 = l1.getInt(1);
           //out.println("Total Sales for Clothing Product-Line :" + salesLine1);
            }
           //salesLine1 = Integer.valueOf(sales1);

           //product line 2
           String line2 = "SELECT COUNT(prodName) FROM orders WHERE catergory = 'Health'";
           PreparedStatement st2=con.prepareStatement(line2);

           ResultSet l2 = st2.executeQuery();


           while(l2.next()){
           salesLine2 = l2.getInt(1);
           //out.println("Total Sales for Health Product-Line :" + salesLine2);
            }
           //salesLine2 = Integer.valueOf(sales2);

            //product line 3
           String line3 = "SELECT COUNT(prodName) FROM orders WHERE catergory = 'Equipment'";
           PreparedStatement st3 = con.prepareStatement(line3);
           ResultSet l3 = st3.executeQuery();


           while(l3.next()){
           salesLine3 = l3.getInt(1);
           //out.println("Total Sales for the Equipment Product-Line :" + salesLine3);
            }

            //product line 4
           String line4 = "SELECT COUNT(prodName) FROM orders WHERE catergory = 'Electronic'";
           PreparedStatement st4 = con.prepareStatement(line4);
           ResultSet l4 = st4.executeQuery();


           while(l4.next()){
           salesLine4 = l4.getInt(1);
           //out.println("Total Sales for the Electronics Product-Line :" + salesLine4);
            }

            totalSales = salesLine1 + salesLine2 + salesLine3 + salesLine4;
             //out.println("The total sales are" + totalSales);


           clothing = Math.round((salesLine1*numberOfStaff)/(totalSales));
           health = Math.round((salesLine2*numberOfStaff)/(totalSales));
           equipment = Math.round((salesLine3*numberOfStaff)/(totalSales));  
           electronic = Math.round((salesLine4*numberOfStaff)/(totalSales));  

%>
                                    <h6 class="stats-type mb-1">Product-Line Staff Allocation</h6>
                                    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Clothing</h4>
							    <div class="stats-figure"><% out.println(clothing);%></div>
							    
						    </div><!--//app-card-body-->
						    
					    </div><!--//app-card-->
				    </div><!--//col-->
                                    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Health</h4>
							    <div class="stats-figure"><% out.println( health);%></div>
							    
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
                                    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Gym Equipments</h4>
							    <div class="stats-figure"><% out.println(equipment);%></div>
							    
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
                                    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Electronics</h4>
							    <div class="stats-figure"><% out.println(electronic);%></div>
							    
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
			    
                            
								    
                            <a href="hr.jsp">  <button type="submit" class="btn app-btn-primary" >Re-Allocate</button> </a>
                            

			    
			    
			    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
	    
<!--the table for staff details.-->
                                <div class="app-card alert alert-dismissible shadow-sm mb-4 border-left-decoration" role="alert">
                                            <div class="inner">
                                                    <div class="app-card-body p-3 p-lg-4">
                            
                                                            <h3 class="mb-3">Staff Details</h3>
                            <form class="settings-form" action="/HR/form.jsp">
								    
                                <button type="submit" class="btn app-btn-primary" >Add Employee</button>
                            </form>                           
                                                                <table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">First Name</th>
												<th class="cell">Last Name</th>
												<th class="cell">Phone Number</th>
												<th class="cell">Address</th>												
											</tr>
										</thead>
<%
            //s.executeUpdate("delete from staff where firstname is null");
           r = s.executeQuery("select firstName, lastName, phoneNo, address from staff where firstName is not null");
           int i = 0;
           while(r.next()){
           
            %>
										<tbody>
											<tr>
												<td class="cell"><%=r.getString("firstName") %></td>
												<td class="cell"><%=r.getString("lastName") %></td>
												<td class="cell"><%=r.getString("phoneNo") %></td>
												<td class="cell"><%=r.getString("address") %></td>												
											</tr>
											
										</tbody>
<%                       
           
           } 
           %>
									</table>
                                                            
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

        

        <%
         
          }catch(SQLException e){
            out.println("Error "+e.getMessage()); 
          
          } 
           
           }catch(ClassNotFoundException ex){
           
             out.println("Error:" + ex.getMessage());
           }
           
         
        %>

</body>
</html> 


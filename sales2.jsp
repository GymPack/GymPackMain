<%-- 
    Document   : sales2
    Created on : Aug 9, 2022, 6:14:58 PM
    Author     : Trev
--%>
<%@page import="com.gym.Getconnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("name")==null){
        response.sendRedirect("gymlogin.jsp"); 
    }
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales tracking</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <link href="dashboard.css" rel="stylesheet">
        <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">   
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%  
            Getconnection connect=new Getconnection();
            connect.getconnections();
            
            String query="select prodName,prodPrice,sum(prodAmt),sum(totalAmount) from orders group by prodName";
            //tracking liking
            String query2="select count(*) from customers where preferances='Workout equipment'";
            PreparedStatement statement2=connect.co.prepareStatement(query2);
            ResultSet vary2  =statement2.executeQuery();
            int p1=0;
            while(vary2.next()){
            p1 = vary2.getInt(1);
            }//end here
            
             String query3="select count(*) from customers where preferances='Electronics'";
            PreparedStatement statement3=connect.co.prepareStatement(query3);
            ResultSet vary3  =statement3.executeQuery();
            int p2=0;
            while(vary3.next()){
            p2 = vary3.getInt(1);
            }
            
             String query4="select count(*) from customers where preferances='Sports wear'";
            PreparedStatement statement4=connect.co.prepareStatement(query4);
            ResultSet vary4 =statement4.executeQuery();
            int p3=0;
            while(vary4.next()){
            p3 = vary4.getInt(1);
            }

             String query5="select count(*) from customers where preferances='Nutrition'";
            PreparedStatement statement5=connect.co.prepareStatement(query5);
            ResultSet vary5=statement5.executeQuery();
            int p4=0;
            while(vary5.next()){
            p4 = vary5.getInt(1);
            }
            
            PreparedStatement statement=connect.co.prepareStatement(query);
            ResultSet vary  =statement.executeQuery();
        %>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Sales</h1>              
            </div>
            <div class="row g-4 mb-4">
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">Workout Equipment</h4>                        
                            <div class="stats-figure"><%=p1%> likes</div>                      
                        </div><!--//app-card-body-->                           
                    </div><!--//app-card-->
                </div><!--//col-->
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">Electronics</h4>                        
                            <div class="stats-figure"><%=p2%> likes</div>                      
                        </div><!--//app-card-body-->                           
                    </div><!--//app-card-->
                </div><!--//col-->
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">Sports wear</h4>                        
                            <div class="stats-figure"><%=p3%> likes</div>                      
                        </div><!--//app-card-body-->                           
                    </div><!--//app-card-->
                </div><!--//col-->
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">Nutrition</h4>                        
                            <div class="stats-figure"><%=p4%> likes</div>                      
                        </div><!--//app-card-body-->                           
                    </div><!--//app-card-->
                </div><!--//col-->
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Amount</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%while(vary.next()){%>
                        <tr>
                            <td><%=vary.getString(1)%></td> 
                            <td><%=vary.getInt(2)%></td> 
                            <td><%=vary.getInt(3)%></td> 
                            <td><%=vary.getString(4)%></td> 
                        </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </main>
        <footer class="app-footer">
            <div class="container text-center py-3">
                <small class="copyright"></small>               
            </div>
        </footer>            
    </body>
</html>

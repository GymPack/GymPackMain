<%-- 
    Document   : display
    Created on : Aug 5, 2022, 1:09:47 PM
    Author     : 840
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.gym.Getconnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("name")==null){
        response.sendRedirect("gymlogin.jsp"); 
    }
%>  

<!DOCTYPE html>
<html lang="en">
    <head>      
        <title>Product tracking</title>       
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
        String query="select*from products";
        PreparedStatement statement=connect.co.prepareStatement(query);
        ResultSet vary  =statement.executeQuery();
        String image;
    %>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">View Products</h1>              
            </div> 
            <div class="tab-content" id="orders-table-tab-content">                            
                <div class="app-card-body">
                    <div class="table-responsive-sm">
                        <table class="table app-table-hover mb-0">
                            <thead>
                                <tr>
                                    <th class="cell">Category</th>
                                    <th class="cell">Amount</th>
                                    <th class="cell">Price</th>
                                    <th class="cell">Name</th>
                                    <th class="cell">Image</th>
                                    <th class="cell">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%while(vary.next()){%>
                                <tr>
                                    <td class="cell"><%=vary.getString("category")%></td> 
                                    <td class="cell"><%=vary.getInt("ammount")%></td> 
                                    <td class="cell"><%=vary.getInt("unitPrice")%></td> 
                                    <td class="cell"><%=vary.getString("prodName")%></td> 
                                    <%image=vary.getString("image");%>                                  
                                    <td class="cell"> <image class ='imgs' src="images/<%=image%>"></td>
                                    <td class="cell"> 
                                        <form action="updateProducts.jsp">
                                            <input type="hidden" name="id" value="<%=vary.getInt("id")%>" >
                                            <input type="submit" class="btn app-btn-secondary" value="Edit" >
                                        </form>
                                    </td>
                                </tr>                   
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>  
        <footer class="app-footer">
            <div class="container text-center py-3">
                <small class="copyright"></small>               
            </div>
        </footer>
    </body>
</html>

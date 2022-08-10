<%-- 
    Document   : updateproducts
    Created on : Aug 1, 2022, 12:41:32 PM
    Author     : 840
--%>
<%@page import="java.sql.*"%>
<%@page import="com.gym.Getconnection"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("name")==null){
        response.sendRedirect("gymlogin.jsp"); 
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <link href="dashboard.css" rel="stylesheet">
        <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">     
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Products</h1>              
            </div>
            <input type="hidden" id ="status" value="<%=session.getAttribute("status")%>"> 
            <div class="row g-4 settings-section">
            <div class="col-12 col-md-8">
                <div class="app-card app-card-settings shadow-sm p-4">
                    <div class="app-card-body">
                        <h3 class="section-title">Add Products</h3>
                        <form class="settings-form" action="NewServlet" method='post'>
                            <div class="mb-3">
                                <label for="setting-input-2" class="form-label">Product Name</label>
                                <input class="form-control" type='text' name='prodName' required>
                            </div>
                            <div class="mb-3">
                                <label for="setting-input-2" class="form-label">Category</label>
                                <input class="form-control" type='text' name='category' required>
                            </div>
                            <div class="mb-3">
                                <label for="setting-input-2" class="form-label">Amount</label>
                                <input class="form-control" type='text' name='amount' required>
                            </div>
                            <div class="mb-3">
                                <label for="setting-input-2" class="form-label">Unit Price</label>
                                <input class="form-control" type='text' name='price' required>
                            </div>
                            <div class="mb-3">
                                <label for="setting-input-2" class="form-label">Image</label>
                                <select class="form-select-sm" name='image'>
                                    <option value='bag1.jpg'>Bags</option>
                                    <option value='shoe1.jpg'>Foot wear</option>
                                    <option value='food1.jpg'>Protein Shake</option>
                                    <option value='eqip1.jpg'>Weight</option>
                                </select>
                            </div>                            
                            <input type='submit' class="btn app-btn-primary" name='Add'><br><br>
                        </form>
                    </div><!-- app-card-body -->
                </div>
            </div>
            </div>                 
        </main>
        <footer class="app-footer">
            <div class="container text-center py-3">
                <small class="copyright"></small>               
            </div>
        </footer>
        <script src="package/dist/sweetalert2.all.min.js"></script>
        <script src="assets/plugins/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="package/dist/sweetalert2.css">
         <script type="text/javascript">
            var status = document.getElementById("status").value;         
            if(status === "added"){
                Swal.fire("", "Item has been added successfully", "success");
            }           
        </script>
    </body>
</html>

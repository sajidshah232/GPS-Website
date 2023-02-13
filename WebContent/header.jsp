<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userid") == null) {
        response.sendRedirect("MainPage.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/logo.png"/>
        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/datatables.js" type="text/javascript"></script>        
        <script src="js/canvasjs.min.js"></script>
        <style>
            .list-group-item{
                padding:8px;
            }
            .active{
                background-color: black !important;
            }
            .bg-red{
                background-color: red;
                color:white;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid ">
            <div class="row">
                <div class="col-2 fixed-top h-100 px-0 py-0 bg-dark"> 
                    <div class="card">
                        <img src="images/gps01.jpg" class="card-img-top" style="height:150px;">
                        <div class="card-header text-center bg-dark">
                            Administrator
                        </div>
                        <div class="card-footer text-dark text-center font-weight-bold">
                            <%= session.getAttribute("uname")%>
                        </div>
                        <ul class="list-group list-group-flush">
                            <a href="AdminHome.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 6 ? "active" : ""%>">Home</a>
                            <a href="Categories.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 7 ? "active" : ""%>">Categories</a>                            
                            <a href="AllProducts.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 2 ? "active" : ""%>">All Product</a>
                            <a href="OrdersList.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 3 ? "active" : ""%>">Order List</a>
                            <a href="UserList.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 4 ? "active" : ""%>">Customers List</a>
                            <a href="AdminChangePwd.jsp" class="list-group-item list-group-item-action <%= (int) session.getAttribute("page") == 5 ? "active" : ""%>">Change Password</a>
                            <a href="Logout" class="list-group-item list-group-item-action">Logout</a>
                        </ul>
                    </div>
                </div>
                <div class="col offset-2 p-0">
                    <div class="jumbotron text-center text-white p-3 px-0 mb-0 rounded-0 bg-dark">
                        <h4 style='text-shadow:0 0 4px'>Welcome to Admin Page</h4>
                    </div>
                    <div class="main p-3">


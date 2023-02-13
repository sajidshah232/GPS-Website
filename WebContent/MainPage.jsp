<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="jumbotron">
            <h2>Welcome to My Shopping Cart</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h2 class="bg-warning text-center p-2">Login Screen</h2>
                    <form method="post" action="Validate">
                        <div class="form-group">
                            <label>User ID</label>
                            <input type="text" name="userid" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="pwd" class="form-control">
                        </div>
                        <input type="submit" value="Login" class="btn btn-outline-primary px-5 mx-auto d-block">                            
                    </form>
                    <%
                    if(session.getAttribute("emsg")!=null){
                        %>
                    <div class="alert alert-success mt-2">
                        <strong><%= session.getAttribute("emsg") %></strong>
                    </div>
                        <%
                        session.removeAttribute("emsg");
                    }    
                    %>
                </div>
                <div class="col-sm-6">
                    <h2 class="bg-success text-center p-2 text-white">Register Screen</h2>
                    <form method="post" action="Register">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" name="fname" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" name="lname" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>User ID</label>
                            <input type="text" name="userid" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="pwd" class="form-control">
                        </div>
                        <input type="submit" value="Register" class="btn btn-outline-primary mx-auto d-block px-4">                            
                    </form>
                    <%
                    if(session.getAttribute("msg")!=null){
                        %>
                    <div class="alert alert-success mt-2">
                        <strong><%= session.getAttribute("msg") %></strong>
                    </div>
                        <%
                        session.removeAttribute("msg");
                    }    
                    %>
                </div>
            </div>
            
        </div>
    </body>
</html>

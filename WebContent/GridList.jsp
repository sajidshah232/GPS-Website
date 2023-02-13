<%@page import="com.sample.Product"%>
<%@page import="com.sample.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>   
        <link rel="icon" href="images/bp.png">
    </head>
    <body>        
        <p class="float-right text-white m-3">Welcome <%= session.getAttribute("uname") %></p>
        <div class="jumbotron bg-success mb-0 rounded-0">             
            <h2 class="text-center text-white">List of All Products</h2>
        </div>
        <jsp:include flush="true" page="Navbar.jsp"/>
        <div class="container"> 
            <%
            if(session.getAttribute("msg")!=null){
                %>
                <div class="alert alert-success">
                    <strong><%= session.getAttribute("msg") %></strong>
                </div>
                <%
                    session.removeAttribute("msg");
            }    
            %>
            <div class="row">
                <%
                    for(Product p : ProductDAO.getProducts(false, false))
                    {
                %>

                <div class="col-sm-3 mb-2 p-2">
                    <div class="card">
                        <div class="card-header text-center font-weight-bold">
                            <%= p.getPname() %>    
                        </div>                        
                        
                        <img class="card-img-top" height='230' src='images/<%= p.getPhoto() %>'>     
                        <div class="card-body text-center">
                            <strong class="text-danger">RM:<%= p.getDisc_price() %></strong>
                            <del class="ml-2">RM:<%= p.getPrice() %></del>
                        </div>
                        <div class="card-footer text-center">
                            <a href='AddtoCart.jsp?prodid=<%= p.getProdid() %>' class="btn btn-sm btn-primary">Add to Cart</a>                                                        
                        </div>
                    </div>
                </div>
                <% }%> 

            </div>
        </div>
    </body>
</html>

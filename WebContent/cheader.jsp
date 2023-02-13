<%@page import="com.sample.ProductDAO"%>
<%@page import="com.sample.CartDAO"%>
<%@page import="com.sample.DBUtils"%>
<%@page import="java.sql.*" contentType="text/html" errorPage="ErrorPage.jsp" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Online Shopping</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">        
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/menu.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/script.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>        
        <link rel="icon" href="images/gps01.jpg"/>
    </head>

    <body>
        <%
            String count = "(empty)";
            String user = "Guest";
            Connection con = DBUtils.Connect();
            if (session.getAttribute("userid") != null) {
                user = session.getAttribute("uname").toString();
                count = String.valueOf(CartDAO.getCount(session.getAttribute("userid").toString()));
            }
        %>
        <div class="wrap">
            <div class="header">
                <div class="header_top position-relative">
                    <%
                        if (session.getAttribute("userid") != null) {
                    %>
                    <h5 class="position-absolute w-100 text-center">Welcome ! <%= user%></h5>    
                    <%
                        }
                    %>
                    <div class="logo">
                        <a href="index.jsp"><img src="images/gps01.jpg" alt="" /></a>
                    </div>
                    <div class="header_top_right">                        
                        <div class="search_box">
                            <form action="SearchResult.jsp">
                                <input type="text" list="products" value="${param.spname}" name="spname" placeholder="Product to Search">
                                <input type="submit" value="SEARCH" style="height:100%">
                                <datalist id="products">
                                    <%
                                        for (String product : ProductDAO.getProductNames()) {
                                    %>
                                    <option> <%= product%> </option>
                                    <%
                                        }
                                    %>
                                </datalist>
                            </form>
                        </div>
                        <div class="shopping_cart">
                            <div class="cart">  
                                <a href="ViewCart.jsp" title="View my shopping cart" rel="nofollow">                                    
                                    <span class="cart_title">Cart</span>
                                    <span class="no_product"><%= count%></span>
                                </a>
                            </div>
                        </div>                                                                               
                        <%
                            if (session.getAttribute("userid") != null) {
                        %>
                        <span><a href="Logout"><img src="images/logout.png" style="width:40px;"></a>                                
                        </span>
                        <a href="CChangePwd.jsp" class="btn btn-dark">Change Password</a>

                        <%
                            }%>
                    </div>  

                    <div class="clear"></div>
                </div>

                <div class="clear"></div>



            </div>
            <div class="h_menu sticky-top">
                <a id="touch-menu" class="mobile-menu" href="#">Menu</a>
                <nav>
                    <ul class="menu list-unstyled">
                        <li><a href="index.jsp">HOME</a></li>
                        <li><a href="Products.jsp">Products</a></li>
                        <li class="activate"><a href="javascript:void(0)">Categories</a>
                            <ul class="sub-menu list-unstyled sub-menu2">
                                <% for (String cat : DBUtils.getCategory()) {%>
                                <li><a href="Catindex.jsp?cat=<%= cat%>"><%= cat%></a></li>
                                    <% } %>
                            </ul>
                        </li>                        		
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">CONTACT</a></li>
                            <%
                                if (session.getAttribute("userid") != null) { %>
                        <li><a href="OrderHistory.jsp">History</a></li>
                        <li><a href="Logout">Logout</a></li>
                            <% } else { %>
                        <li><a href="Login.jsp">Login or Register</a></li>
                            <% }%>


                        <div class="clear"> </div>
                    </ul>
                </nav> 
                <script src="js/menu.js" type="text/javascript"></script>
            </div>
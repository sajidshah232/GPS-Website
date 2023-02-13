<%@page import="java.sql.*,com.sample.DBUtils" %>
<link href="css/Pro.css" rel="stylesheet" type="text/css"/>
<%
    if (session.getAttribute("userid") == null) {
        response.sendRedirect("MainPage.jsp");
    }
%>
<%
    Connection con = DBUtils.Connect();
    PreparedStatement ps = con.prepareStatement("select count(*) from cart where userid=?");
    ps.setString(1, "anandsingh");
    ResultSet rs = ps.executeQuery();
    rs.next();
    int count=rs.getInt(1);
%>
<nav>
    <a href="GridList.jsp">Home</a>
    <a href="ShowAll.jsp">Order Histroy</a>
    <a href="ViewCart.jsp">View Cart
        <%   
            if (count>0) {                
                %>
                <span class="badge badge-primary p-2 ml-2"><%= count%></span>
                <%
            }
        %>
        
    </a>
    <a href="MainPage.jsp">Login</a>
    <a href="Logout">Logout</a>
</nav>
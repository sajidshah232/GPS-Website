<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sample.DBUtils,java.sql.*"%>
<jsp:include flush="true" page="cheader.jsp"/>
<%
    if (session.getAttribute("msg") != null) {
%>
<div class="row">
    <div class="col-sm-5 mx-auto">
        <div class="alert alert-success text-center p-1 my-1">
            <strong><%= session.getAttribute("msg")%></strong>
        </div>
    </div>
</div>
<%
        session.removeAttribute("msg");        
    }
%>
<h4 class="p-2 text-center border border-dark mt-2">Customer Order History</h4>
<table class="table table-bordered table-striped table-sm">
    <thead class="table-dark">
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>        
        <th>Status</th>
        <th>Show Details</th>
    </tr>
    </thead>
    <tbody>
    <%
        Connection con = DBUtils.Connect();
        ResultSet rs = con.createStatement().executeQuery("select * from orders where userid='"+session.getAttribute("userid")+"' order by orderdate desc");
        while (rs.next()) {
            String orderdate=DBUtils.formatDate(rs.getString("orderdate"));
    %>
    <tr>
        <td><%= rs.getString("order_id")%></td>
        <td><%= orderdate %></td>  
        <td><%= rs.getString("order_status") %></td>  
        <td><a href="COrderDetails.jsp?oid=<%= rs.getString("order_id")%>" class="btn btn-sm btn-primary">Show Details</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<jsp:include flush="true" page="cfooter.jsp"/>
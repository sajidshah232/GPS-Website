<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sample.DBUtils,java.sql.*"%>
<%
    session.setAttribute("page", 3);
%>
<jsp:include flush="false" page="header.jsp"/>
<script>
    $(function () {
        $("#orders").DataTable({
            'ordering': false
        });
    });
</script>
<h2 class="text-center">List of Orders</h2>
<table id="orders" class="table table-striped table-sm">
    <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>User ID</th> 
            <th>Order Status</th>
            <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DBUtils.Connect();
            ResultSet rs = con.createStatement().executeQuery("select * from orders order by order_id desc");
            while (rs.next()) {
                String orderdate = DBUtils.formatDate(rs.getString("orderdate"));
                String status = rs.getString("order_status");
        %>
        <tr>
            <td><%= rs.getString("order_id")%></td>
            <td><%= orderdate%></td>
            <td><%= rs.getString("userid")%></td>
            <%
                String stclass = "";
                if (status.equals("Pending")) {
                    stclass = "bg-danger";
                } else if (status.equals("Confirmed")) {
                    stclass = "bg-success";
                } else {
                    stclass = "bg-primary";
                }
            %>
            <td class="font-weight-bold text-white <%= stclass%>"><%= status%></td>
            <td><a href="OrderDetails.jsp?oid=<%= rs.getString("order_id")%>" class="btn btn-sm btn-primary">Show Details</a></td>
        </tr>
        <%
            }
            con.close();
        %>
    </tbody>
</table>

<jsp:include flush="true" page="footer.jsp"/>

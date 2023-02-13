<%@page import="com.sample.CustomerDAO"%>
<%@page import="com.sample.Customer"%>
<%
    session.setAttribute("page", 4);
%>
<jsp:include flush="false" page="header.jsp"/>
<script>
    $(function(){
        $("#users").DataTable({
            'ordering':false
        });
    });
    </script>
<h4 class="text-center border-bottom pb-2">List of All Customers</h4>
<table id="users" class="table table-sm table-striped">
    <thead class="table-dark">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>User ID</th>
        <th>Password</th>       
    </tr>
    </thead>
    <tbody>
    <%
        for(Customer c : CustomerDAO.getCustomers()){        
    %>
    <tr>                    
        <td><%= c.getFname() %></td>                    
        <td><%= c.getLname() %></td>
        <td><%= c.getUserid() %></td>
        <td><%= c.getPwd() %></td>                           
    </tr>
    <% }%> 
    </tbody>
</table>
<jsp:include flush="true" page="footer.jsp"/>

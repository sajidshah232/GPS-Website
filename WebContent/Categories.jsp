<%@page import="java.util.Map"%>
<%@page import="com.sample.CategoryDAO"%>
<%
    session.setAttribute("page", 7);
%>
<%@page import="java.sql.*,com.sample.DBUtils" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center bg-dark text-white p-2">Categories Management</h4>
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
<div class="row">
    <div class="col-5">
        <form method="post" action="AddCat">
            <div class="form-group">
                <label>Category Name</label>
                <input type="text" name="cname" placeholder="Category Name" class="form-control"/>
            </div>
            <input type="submit" value="Add Category" class="btn btn-primary">
        </form>
    </div>
    <div class="col-7">
        <table class="table table-bordered table-striped mt-2 table-sm">
            <thead class="table-dark">
            <tr>
                <th style="width:120px">Category ID</th>
                <th>Category Name</th>
                <th>Operation</th>
            </tr>
            </thead>
            <tbody>
            <%
        for(int catid : CategoryDAO.getCategories().keySet()){
    %>
    <tr>                    
        <td><%= catid %></td>                    
        <td><%= CategoryDAO.getCategories().get(catid) %></td>        
        <td><a onclick="return confirm('Are you sure to delete this category ?')" 
               href="DeleteCat?cat=<%= CategoryDAO.getCategories().get(catid) %>" 
               class="btn btn-sm btn-danger">Delete</a></td>                    
    </tr>
    <% }%> 
            </tbody>
        </table>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp"/>
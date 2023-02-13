<%@page import="com.sample.Product"%>
<%@page import="com.sample.ProductDAO"%>
<%@page import="com.sample.DBUtils"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("page", 2);
%>
<jsp:include flush="true" page="header.jsp"/>
<script>
    $(function(){
        $("#products").DataTable();
    });
    </script>
    
<button data-target="#addpro" data-toggle="modal" class="btn btn-primary btn-sm float-right">Add New</button>
<h4 class="text-center mb-2 border-bottom pb-2">All Products List</h4>

<table id="products" class="table table-striped table-fixed table-sm">
    <thead class="table-dark">
        <tr style="position:sticky;top:0;">
            <th style="width:90px">Product ID</th>        
            <th>Product </th>
            <th>Category</th>
            <th>Actual Price</th>
            <th>Is Featured</th>
            <th>In Stock ?</th>
            <th>Edit Details</th>        
        </tr>
    </thead>
    <tbody style="overflow: scroll">
        <%
            for (Product p : ProductDAO.getProducts(false,false)) {
        %>

        <tr>                    
            <td><%= p.getProdid()%></td>
            <td><img width='40' height='40' src='images/<%= p.getPhoto()%>'>                   
                <%= p.getPname()%></td>
            <td><%= p.getPcat()%></td>
            <td style="text-align: right">RM: <%= p.getPrice()%></td>
            <td style="text-align: right;">
                <span 
                    class="text-white p-1 d-inline-block text-center 
                    <%= p.getFeatured().equals("Yes")?"bg-red":"bg-secondary" %>" 
                    style="width:100%;">
                <%= p.getFeatured() %>
                </span>
            </td>
            <td>
                <span 
                    class="text-white p-1 d-inline-block text-center 
                    <%= p.getInstock().equals("In Stock")?"bg-success":"bg-red" %>" 
                    style="width:100%;">
                <%= p.getInstock() %>
                </span>
            </td>
            <td><a href="EditPro.jsp?prodid=<%= p.getProdid()%>" class="btn btn-sm btn-primary">Edit Product</button>
                </td>                    
        </tr>
        <% }%> 
    </tbody>
</table>
    
    <jsp:include flush="true" page="footer.jsp"/>

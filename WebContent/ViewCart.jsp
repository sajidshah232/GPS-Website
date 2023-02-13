<%@page import="java.util.List"%>
<%@page import="com.sample.CartDAO"%>
<%@page import="com.sample.Cart"%>
<%@page import="com.sample.Product"%>
<%@page import="com.sample.ProductDAO" contentType="text/html" pageEncoding="UTF-8"%>
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
<%
    List<Cart> list = CartDAO.getList(session.getAttribute("userid").toString());
    if (list.size() == 0) {
        out.println("<h4 class='text-center'>No Item in the Cart</h4>");
    } else {
%>
<div class="container">
    <div class="row">
        <table class="table table-bordered table-striped mt-1">
            <thead class="table-dark">
            <th>Sr. No.</th>
            <th>Product</th>            
            <th>Price</th>
            <th>Quantity</th>
            <th>Amount</th>
            <th>Delete</th>
            </thead>
            <tbody>
                <%
                    int counter = 1, total = 0;
                    for (Cart c : list) {
                        Product p = ProductDAO.findByID(c.getProdid());
                %>
                <tr>
                    <td style="width: 80px"><%= counter%></td>  
                    <td><img class="mr-2" src='images/<%= p.getPhoto()%>' width="50" height="50">
                        <%= p.getPname()%></td>                      
                    <td>RM <%= p.getDisc_price()%></td> 
                    <td><a href="ChangeQty?prodid=<%= p.getProdid()%>&op=min" class="btn btn-primary">-</a> 
                        <%= c.getQty()%> 
                        <a href="ChangeQty?prodid=<%= p.getProdid()%>&op=add" class="btn btn-primary">+</a></td>  
                    <td>RM <%= c.getQty() * p.getDisc_price()%></td>  
                    <td style="width:70px">
                        <a onclick="return confirm('Are you sure to delete this product ?')" 
                           href="DeletePro?prodid=<%= c.getProdid()%>" 
                           class="btn btn-danger rounded-circle">&times;</a>
                    </td>
                </tr>
                <%
                        counter++;
                        total += c.getQty() * p.getDisc_price();
                    }
                %>
            </tbody>
            <tfoot class="table-dark">
                <tr>
                    <th colspan="4" class="text-right">Total </th>
                    <th>RM: <%= total%></th>
                </tr>
            </tfoot>
        </table>
    </div>
    <a href="DeliveryOrder.jsp" class="btn btn-primary float-right">Place Order</a>
</div>
<br><br>
<% }%>

<jsp:include flush="true" page="cfooter.jsp"/>

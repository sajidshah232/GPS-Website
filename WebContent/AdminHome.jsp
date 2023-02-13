<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.OrderModel"%>
<%@page import="com.sample.OrderDAO"%>
<%@page import="com.sample.CategoryDAO"%>
<%@page import="com.sample.ProductDAO"%>
<%@page import="com.sample.CustomerDAO"%>
<%@page import="com.sample.DBUtils,java.sql.*"%>
<%
    session.setAttribute("page", 6);
%>
<jsp:include flush="true" page="header.jsp"/>

<style>
    .col-sm-3{
        padding-right: 0px !important; 
        padding-left: 15px;
    }
    .col-sm-3:last-child{
        padding-right: 15px !important;
    }
</style>
<script type="text/javascript">
window.onload = function() { 
 



}
</script>
<div class="row">
    <div class="col-sm-3">
        <a href="UserList.jsp" class="btn w-100 text-left bg-warning p-2 text-white">
            <h3><%= CustomerDAO.totalCustomers() %></h3>
            <h5>Customers</h5>
        </a>
    </div>
    <div class="col-sm-3">
        <a href="AllProducts.jsp" class="btn w-100 text-left bg-primary p-2 text-white">
            <h3><%= ProductDAO.totalProducts() %></h3>
            <h5>Products</h5>
        </a>
    </div>
    <div class="col-sm-3">
        <a href="Categories.jsp" class="btn w-100 text-left bg-danger p-2 text-white">
            <h3><%= CategoryDAO.totalCategories() %></h3>
            <h5>Categories</h5>                        
        </a>
    </div>
    <div class="col-sm-3">
        <a href="OrdersList.jsp" class="btn w-100 text-left bg-success p-2 text-white">
            <h3><%= DBUtils.getCount("orders")%></h3>
            <h5>Orders</h5>                        
        </a>
    </div>
</div>
            <h5>Sales</h5>
<div class="row">
    
    <div class="col-sm-3">
        <a href="UserList.jsp" class="btn w-100 text-right bg-info p-2 text-white">
            <h3>RM: <%= OrderDAO.getTodaySales() %></h3>
            <h5>Today</h5>
        </a>
    </div>
    <div class="col-sm-3">
        <a href="AllProducts.jsp" class="btn w-100 text-right bg-danger p-2 text-white">
            <h3>RM: <%= OrderDAO.getCurrentWeekSales() %></h3>
            <h5>This Week</h5>
        </a>
    </div>
    <div class="col-sm-3">
        <a href="Categories.jsp" class="btn w-100 text-right bg-secondary p-2 text-white">
            <h3>RM: <%= OrderDAO.getCurrentMonthSales() %></h3>
            <h5>This Month</h5>                        
        </a>
    </div>
    <div class="col-sm-3">
        <a href="OrdersList.jsp" class="btn w-100 text-right bg-dark p-2 text-white">
            <h3>RM: <%= OrderDAO.getTotalSales() %></h3>
            <h5>This Year</h5>                        
        </a>
    </div>
</div>
<div class="row">
    <div class="col-sm-5">
        <h5 class="p-2 text-center bg-success mt-2 text-white">Monthly Sales</h5>
        <div id="chartContainer1" style="height: 300px; width: 100%;"></div>        
        
        <h5 class="p-2 text-center bg-success mt-2 text-white">This Week Sales</h5>
        <div id="chartContainer2" style="height: 300px; width: 100%;"></div>        
    </div>
    <div class="col-sm-7">
        <h4 class="text-center p-2 bg-success mt-2 text-white">List of Top 10 Products</h4>
        <table class="table table-bordered table-striped table-sm">
            <thead class="table-dark">
                <tr>
                    <th>Sr. No.</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity Sold</th>
                    <th>Revenue</th>
                </tr>
            </thead>
            <tbody class="table-primary font-weight-bold">
                <%
                    Connection con=DBUtils.Connect();
                    ResultSet rs=con.createStatement().executeQuery("select photo,pname,disc_price,sum(qty) as cnt from order_details inner join products on order_details.prodid=products.prodid group by products.prodid order by cnt desc limit 10");
                    int counter=1;
                    while(rs.next()){
                        %>
                        <tr>
                            <td><%= counter++ %></td>
                            <td style="width:400px;"><img class="mr-2" style="width:50px;height:50px;" src="images/<%= rs.getString(1) %>"><%= rs.getString(2) %></td>                         
                            <td class="text-right">RM:<%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td class="text-right">RM:<%= rs.getInt(3)*rs.getInt(4) %></td>
                        </tr>
                        <%
                    }                    
                    %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include flush="true" page="footer.jsp"/>
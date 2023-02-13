<%@page import="java.util.stream.Collectors"%>
<%@page import="com.sample.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.ProductDAO"%>
<%@page import="com.sample.DBUtils"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="cheader.jsp"/>
<script>
    function paginate(n) {
        location.href = "Products.jsp?pageno=" + n;
        document.body.scrollTop =<%= request.getAttribute("top")%>;
    }
</script>

<%
    int order = 0, pageno = 1;
    List<Product> list = ProductDAO.getProducts(false, false);
    
    int total = list.size();
    int totalpage = total / 12;
    if (request.getParameter("pageno") != null) {
        pageno = Integer.parseInt(request.getParameter("pageno"));
    }
%>
<div class="main">
    <div class="content">
        <div class="content_top">
            <div class="heading">
                <h3>Feature Products</h3>
            </div>            
            <div class="page-no">
                <p>Result Pages:<ul>
                    <%
                        for (int i = 1; i <= totalpage; i++) {%>                    
                    <li class="<%= i==pageno ? "active":"" %>" onclick="paginate(<%= i%>)"><%= i%></li>                    
                        <% } %>
                </ul></p>
            </div>
            <div class="clear"></div>
        </div>                
        <div class="section group">
            <%
                list = ProductDAO.getPagedProducts(12, pageno);//.stream().limit(8).collect(Collectors.toList());
                for (Product p : list) {
            %>
            <div class="grid_1_of_4 images_1_of_4 overflow-hidden">
                <a href="AddtoCart.jsp?prodid=<%= p.getProdid()%>&qty=1">
                    <img height="200" width="200" src="images/<%= p.getPhoto()%>" alt="" /></a>
                    
                <h2 class="p-2 border mt-1"><%= p.getPname()%></h2>       

                <p class="p-0"><%= p.getPcat()%></p>
                
                    </span><span class="price">RM;<%= p.getDisc_price()%></span></p>
                <% if (!p.getInstock().equals("In Stock")) {%>
                <div class="pos-absolute" 
                     style="transform: rotate(-45deg);top:125px;left:-90px;width:420px">
                    <div class="alert alert-danger font-weight-bold p-2 ">
                        <%= p.getInstock()%>
                    </div>
                </div>                
                <div class="button mr-0">
                    <a href="javascript:void(0)">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="javascript:void(0)" class="details">Details</a></span></div>                
                <% } else { %>
                <div class="button mr-0">
                    <a href="Operation?prodid=<%= p.getProdid()%>&qty=1">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="AddtoCart.jsp?prodid=<%= p.getProdid()%>" class="details">Details</a></span></div>                
                <% } %>
            </div>
            <% }%>
        </div>

    </div>
</div>
<jsp:include flush="true" page="cfooter.jsp"/>


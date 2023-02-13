<%@page import="java.util.stream.Collectors"%>
<%@page import="com.sample.ProductDAO"%>
<%@page import="com.sample.Product"%>
<%@page import="java.util.List"%>
<script>
    function sortme(ss) {
        if (ss == 1) {
            location.href = "index.jsp?order=1";
        } else if (ss == 2) {
            location.href = "index.jsp?order=2";
        } else {
            location.href = "index.jsp";
        }
    }
</script>
<jsp:include page="cheader.jsp"/>
<%
	List<Product> list = ProductDAO.getProducts(true,true); 
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

<div class="header_bottom">
    <div class="header_bottom_left">
        <div class="section group">

            <%             
            if(list.size()>0){
            	final int count=list.size()>4 ? 4 : list.size();
                for (int i=0;i<count;i++) {
            %>
            <div class="listview_1_of_2 images_1_of_2">
                <div class="listimg listimg_2_of_1">
                    <a href="AddtoCart.jsp?prodid=<%= list.get(i).getProdid()%>">
                        <img height="140" width="140" src="images/<%= list.get(i).getPhoto()%>" alt="" /></a>
                </div>
                <div class="text list_2_of_1">
                    <%= list.get(i).getPname()%>
                    <p><%= list.get(i).getDisc_price()%></p>
                    <div class="button"><span><a href="AddtoCart.jsp?prodid=<%= list.get(i).getProdid()%>">Add to Cart</a></span></div>
                </div>
            </div>
            <% }
            }%>

        </div>
        <div class="clear"></div>
    </div>
    <div class="header_bottom_right_images">
   
    </div>
    <div class="clear"></div>
</div>	

<div class="main">
    <div class="content">
        <div class="content_top">
            <div class="heading">
                <h3>Feature Products</h3>
            </div>            
            <div class="clear"></div>
        </div>
        <div class="section group">
            <%
                for (Product p : list) {
            %>
            <div class="grid_1_of_4 images_1_of_4 overflow-hidden">
                <a href="AddtoCart.jsp?prodid=<%= p.getProdid()%>&qty=1">
                    <img height="200" width="200" src="images/<%= p.getPhoto()%>" alt="" /></a>
                    
                <h2 class="p-2 border mt-1"><%= p.getPname()%></h2>       

                <p class="p-0"><%= p.getPcat()%></p>
            
                    </span><span class="price">&#8377;<%= p.getDisc_price()%></span></p>
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

        <div class="content_bottom">
            <div class="heading">
                <h3>New Products</h3>
                <div class="clearfix"/>
            </div>            
        </div>
        <div class="section group">

            <%
                if(list.size()>0){
              final  int count=list.size() > 4 ? 4 : list.size();
                for (int i=0;i<count;i++) {
            %>
            <div class="grid_1_of_4 images_1_of_4">
                <a href="AddtoCart?prodid=<%= list.get(i).getProdid()%>&qty=1">
                    <img height="200" width="200" src="images/<%= list.get(i).getPhoto()%>" alt="" /></a>
                <h2 class="p-2 border mt-1"><%= list.get(i).getPname()%></h2>
                <p class="p-0"><%= list.get(i).getPcat()%></p>
                
                    </span><span class="price">&#8377;<%= list.get(i).getDisc_price()%></span></p>
                <div class="button mr-0">
                    <a href="Operation?prodid=<%= list.get(i).getProdid()%>&qty=1">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="AddtoCart.jsp?prodid=<%= list.get(i).getProdid()%>" class="details">Details</a></span></div>
            </div>
            <% }
            }%>

        </div>
    </div>
</div>
<script>

</script>
<jsp:include flush="true" page="cfooter.jsp"/>


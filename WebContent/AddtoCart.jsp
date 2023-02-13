<%@page import="java.util.List"%>
<%@page import="com.sample.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="cheader.jsp"/>
<script src="js/jquery.zoom.min.js" type="text/javascript"></script>

<%
    Product p = ProductDAO.findByID(request.getParameter("prodid"));
%>
<div class="container my-2">
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
        <div class="col-sm-1">
            <img onclick="changeme(1)" src="images/<%= p.getPhoto()%>" 
                 title="First Photo" class="m-1">
            <% if (p.getPhoto2() != null) {%>
            <img onclick="changeme(2)" src="images/<%= p.getPhoto2()%>" 
                 title="Second Photo" class="m-1">   
            <% }
                if (p.getPhoto3() != null) {%>
            <img onclick="changeme(3)" src="images/<%= p.getPhoto3()%>" 
                 title="Third photo" class="m-1">
            <% }%>
        </div>
        <div class="col-sm-4">
            <div class="card">                          
                <img id="pic1" src="images/<%= p.getPhoto()%>" 
                     title="First Photo" class="card-img-top m-1 image-zoom">
                <% if (p.getPhoto2() != null) {%>
                <img id="pic2" src="images/<%= p.getPhoto2()%>" title="Second Photo" 
                     class="card-img-top m-1 d-none image-zoom">   
                <% }
                    if (p.getPhoto3() != null) {%>
                <img id="pic3" src="images/<%= p.getPhoto3()%>" title="Third photo" 
                     class="card-img-top m-1 d-none image-zoom">
                <% }%>
            </div>            
        </div>
        <div class="col-sm-7">
            <p class="bg-dark text-white text-center p-2" style="font-size: 1.4em;">Product Description</p>
            <h3 class="text-danger"><%= p.getPname()%></h3>
            <h5 class="bg-dark text-white p-2">Product Features</h5>
            <!--<p class="pr-4 text-justify"><%= p.getDescr().replaceAll("\n", "<br>")%></p>-->
            <ul class="list-group">
                <%
                    for (String feature : p.getDescr().split("\n")) {
                %>
                <li class="list-group-item"><%= feature%></li>
                    <%
                        }
                    %>
            </ul>
            <h4>Price : <strong class="text-danger">RM: <%= p.getDisc_price()%></strong>
                
            </h4>
            <%                
                if (session.getAttribute("userid") != null) {
                    String userid = session.getAttribute("userid").toString();
                    if (!CartDAO.checkItem(String.valueOf(p.getProdid()), userid)) {%>
            <form action="Operation">
                <input type="hidden" name="prodid" value="<%= request.getParameter("prodid")%>" >
                Quantity : <input name="qty" type="number" value="1" min="1" max="10">       
                <br>
                <div class="btn-group mt-3">
                    <button class="btn btn-danger mr-2" name="add">Add to Cart</button>
                    <button class="btn btn-success" name="buy">Buy Now</button>                        
                </div>
            </form>
            <% } else { %>
            <div class="alert alert-success font-weight-bold text-center">
                Item already added to Cart.
            </div>
            <% }
            } else {
            %>
            <div class="alert alert-danger text-center font-weight-bold">
            Please login to buy products..!!
            </div>
            <%
                    }                
            %>
        </div>
    </div>
</div>     
<script>
    function changeme(n) {
        let id = "pic" + n;
        $(".card-img-top").addClass("d-none");
        $("#" + id).removeClass("d-none");
    }
    $(document).ready(function () {
        $('.image-zoom')
                .wrap('<span style="display:inline-block"></span>')
                .css('display', 'block')
                .parent()
                .zoom({
                    url: $(this).find('img').attr('data-zoom')
                });
    });
</script>
<jsp:include flush="true" page="cfooter.jsp"/>

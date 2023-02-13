<%@page import="com.sample.DBUtils"%>
<%@page import="com.sample.Product"%>
<%@page import="com.sample.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("page", 2);
    String prodid = request.getParameter("prodid");
    Product p = ProductDAO.findByID(prodid);
%>
<jsp:include flush="true" page="header.jsp"/>

<div class="row">
    <div class="col-sm-12">
        <h4 class="text-center mb-2 border-bottom pb-2">Edit Product with id : <%= prodid%></h4>
        <form method="post" enctype="multipart/form-data" action="UpdatePro">
            <input type="hidden" name="prodid" value="<%= prodid%>">
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Name</label>   
                        <input type="text" name="pname" class="form-control" value="<%= p.getPname()%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Category</label>   
                        <select name="pcat" class="form-control">
                            <%
                                for (String cat : DBUtils.getCategory()) {
                            %>
                            <option <%= cat.equals(p.getPcat()) ? "selected" : ""%>><%= cat%></option>
                            <%
                                }
                            %>
                        </select> 
                    </div>
                </div>
            </div>
            <div class="form-row"> 
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Description</label>
                        <textarea rows="4" class="form-control" style="resize: none" name="descr"><%= p.getDescr()%></textarea>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <img src="images/<%= p.getPhoto()%>" width="100" height="100" class="float-right">
                        <label>Product Photo</label>   
                        <input type="file" name="pic" accept=".jpg,.png" class="custom-control">                        
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Product Price</label>   
                        <input type="text" name="price" class="form-control" value="<%= p.getPrice()%>">
                    </div>
                </div>                    
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Discount Price</label>   
                        <input type="text" name="dprice" class="form-control" value="<%= p.getDisc_price()%>">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Discount Remarks</label>   
                        <input type="text" name="remarks" class="form-control" value="<%= p.getRemarks()%>">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Featured Product</label>   
                        <select name="featured" class="form-control">
                            <option <%= p.getFeatured().equals("Yes") ? "selected" :""%> >Yes</option>
                            <option <%= p.getFeatured().equals("No") ? "selected" :""%>>No</option>
                        </select>
                    </div>
                </div>                    
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Stock</label>   
                        <select name="instock" class="form-control">
                            <option <%= p.getInstock().equals("In Stock") ? "selected" :""%> >In Stock</option>
                            <option <%= p.getInstock().equals("Out of Stock") ? "selected" :""%>>Out of Stock</option>
                        </select>
                    </div>
                </div>  
                    <div class="col-sm-4">
                        <input type="submit" value="Save Product" class="btn btn-primary float-right mt-4">
                    </div>
            </div>

            
        </form>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp"/>


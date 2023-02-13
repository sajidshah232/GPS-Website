<%@page import="com.sample.DBUtils"%>
<%@page import="com.sample.Product"%>
<%@page import="com.sample.ProductDAO"%>
<div class="modal fade" id="addpro">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Product</h4>
                <button class="close" data-dismiss="modal">&times;</button>
                <form method="post" enctype="multipart/form-data" action="Upload">
            </div>
            <div class="modal-body">
                <div class="form-row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Product Name</label>   
                            <input type="text" name="pname" class="form-control" placeholder="Product Name">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Product Category</label>   
                            <select name="pcat" class="form-control">
                                <%
                                    for (String cat : DBUtils.getCategory()) {
                                %>
                                <option><%= cat%></option>
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
                            <label>Product Price</label>   
                            <input type="text" name="price" class="form-control" placeholder="Product Price">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Product Photo</label>   
                            <input type="file" name="pic" accept=".jpg,.png" class="custom-control">
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Product Photo 2</label>   
                            <input type="file" name="pic2" accept=".jpg,.png" class="custom-control">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Product Photo 3</label>   
                            <input type="file" name="pic3" accept=".jpg,.png" class="custom-control">
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Discount Price</label>   
                            <input type="text" name="dprice" class="form-control" placeholder="Discount Price">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Discount Remarks</label>   
                            <input type="text" name="remarks" class="form-control" placeholder="Discount Remarks">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Description</label>
                    <textarea rows="4" class="form-control" style="resize: none" name="descr"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" value="Save Product" class="btn btn-primary float-right">
                </form>
            </div>
        </div>
    </div>
</div>



<!-- edit product modal dialog -->                            
<%--
<div class="modal fade" id="editpro">    
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Product</h4>
                <%
                    session.setAttribute("page", 2);
                    String prodid = request.getParameter("prodid");
                    Product p = ProductDAO.findByID(prodid);
                %>
                <button class="close" data-dismiss="modal">&times;</button>
                <form method="post" enctype="multipart/form-data" action="Upload">
            </div>
            <div class="modal-body">
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
                                        <label>Product Price</label>   
                                        <input type="text" name="price" class="form-control" value="<%= p.getPrice()%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <img src="images/<%= p.getPhoto()%>" width="80" height="80" class="float-right">
                                        <label>Product Photo</label>   
                                        <input type="file" name="pic" accept=".jpg,.png" class="custom-control">                        
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Discount Price</label>   
                                        <input type="text" name="dprice" class="form-control" value="<%= p.getDisc_price()%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Discount Remarks</label>   
                                        <input type="text" name="remarks" class="form-control" value="<%= p.getRemarks()%>">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea rows="4" class="form-control" style="resize: none" name="descr"><%= p.getDescr()%></textarea>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="Save Product" class="btn btn-primary float-right">
                        </form>
                    </div>
                </div>
            </div>
        </div>
--%>
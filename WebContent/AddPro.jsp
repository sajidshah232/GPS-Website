<%@page import="com.sample.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("page", 2);
%>
<jsp:include flush="true" page="header.jsp"/>

<div class="row">
    <div class="col-sm-12">
        <h4 class="text-center mb-2 border-bottom pb-2">Add New Product</h4>
        <form method="post" enctype="multipart/form-data" action="Upload">
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

            <input type="submit" value="Save Product" class="btn btn-primary float-right">
        </form>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp"/>


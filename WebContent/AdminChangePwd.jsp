<jsp:include flush="true" page="header.jsp" />
<%
    session.setAttribute("page", 5);
%>
<h4 class="text-center bg-dark text-white border-bottom p-2">Change Administrator Password</h4>
<div class="row">
    <div class="col-sm-4 mx-auto">
        <%
            if (session.getAttribute("msg") != null) {
                String mtype=session.getAttribute("type").toString();
        %>
        <div class="alert alert-<%= mtype %> text-center">
            <strong><%= session.getAttribute("msg")%></strong>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>
        <form action="ChangePwd" method="post" autocomplete="off">    
            <div class="form-group">
                <label>Current Password</label> 
                <input type="password" name="oldpwd" class="form-control">
            </div>
            <div class="form-group">
                <label>New Password</label> 
                <input type="password" name="npwd" class="form-control">
            </div>
            <div class="form-group">
                <label>Confirm Password</label> 
                <input type="password" name="cpwd" class="form-control">
            </div>
            <input type="submit" value="Change Password" class="btn btn-primary">
        </form>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp" />
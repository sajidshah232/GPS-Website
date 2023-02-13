<jsp:include flush="true" page="cheader.jsp" />

<h2 class="text-center border-bottom pb-2">Change Password</h2>
<div class="row mb-3">
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
            <input type="submit" value="Change Password" class="btn btn-danger float-right">
        </form>
    </div>
</div>
<div class="clearfix"/>
<jsp:include flush="true" page="cfooter.jsp" />

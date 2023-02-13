<jsp:include flush="true" page="cheader.jsp"/>
<%
    if (session.getAttribute("msg") != null) {
%>
<div class="row">
    <div class="col-sm-5 mx-auto">
        <div class="alert alert-danger text-center p-1 mt-1">
            <strong><%= session.getAttribute("msg")%></strong>
        </div>
    </div>
</div>
<%
        session.removeAttribute("msg");
    }
%>
<div class="main">
    <div class="content">
        <div class="login_panel" style="width: 400px;">
            <h3>Existing Customers</h3>
            <p>Sign in with the form below.</p>
            <form action="Validate" method="post" autocomplete="off">
                <input name="userid" type="text" placeholder="User ID">
                <input name="pwd" type="password" placeholder="Password">

                <%
                    if (session.getAttribute("emsg") != null) {
                %>
                <p class="note text-danger"><%= session.getAttribute("emsg")%></p>
                <%
                        session.removeAttribute("emsg");
                    }
                %>
                <div class="buttons"><div><button class="grey">Sign In</button></div></div>
            </form>
        </div>
        <div class="register_account" style="width:650px;">
            <img src="images/download.png" class="img-thumbnail float-right">
            <h3>Register New Account</h3>
            <form autocomplete="off" action="Register" method="post">
                <table>
                    <tbody>
                <tr>
                    <td>
                        <div><input name="fname" required type="text" 
                                            placeholder="First Name "></div>
                                <div><input type="text" required name="lname" 
                                            placeholder="Last Name "></div>
                                <div><input type="text" required maxlength="10" id="mobile"
                                            pattern="[7-9][0-9]{9,9]"
                                            name="userid" placeholder="Mobile Number">
                                   </div>                                        
                                <div><input type="password" required name="pwd" 
                                            placeholder="Password"></div>
                    </td>                            
                </tr> 
                    </tbody></table> 
                <div class="search"><div><button class="grey">Create Account</button></div></div>
                <p class="terms">By clicking 'Create Account' you agree to the <a href="#">Terms &amp; Conditions</a>.</p>
                <div class="clear"></div>
            </form>
        </div>  	
        <div class="clear"></div>
    </div>
</div>
<jsp:include flush="true" page="cfooter.jsp"/>

package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePwd")
public class ChangePwdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userid=session.getAttribute("userid").toString();
        String pwd=req.getParameter("oldpwd");
        String newpwd=req.getParameter("npwd");
        
        try {
            Connection con=DBUtils.Connect();
            PreparedStatement ps=null;
            ps=con.prepareStatement("SELECT * FROM users where userid=? and pwd=?");
            ps.setString(1,userid);
            ps.setString(2, pwd);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                ps=con.prepareStatement("Update users set pwd=? where userid=?");
                ps.setString(1,newpwd);
                ps.setString(2,userid);
                ps.executeUpdate();
                session.setAttribute("msg", "Password changed successfully..");
                session.setAttribute("type", "success");
                if(rs.getString("role").equals("Administrator")){
                    resp.sendRedirect("AdminChangePwd.jsp");    
                }else{
                    resp.sendRedirect("CChangePwd.jsp");
                }
            }else{
                session.setAttribute("msg", "Current password is invalid");
                session.setAttribute("type", "danger");
                if(session.getAttribute("userid").equals("admin")){
                    resp.sendRedirect("AdminChangePwd.jsp");    
                }else{
                    resp.sendRedirect("CChangePwd.jsp");
                }                
            }
        } catch (Exception e) {
            resp.getWriter().println("Error "+e.getMessage());
        }
        
    }
    
    
    
}

package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/Validate")
public class ValidateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        try {
            Connection con=DBUtils.Connect();

            PreparedStatement ps = con.prepareStatement("SELECT * from users WHERE userid=? and pwd=?");
            ps.setString(1, userid);
            ps.setString(2, pwd);

            ResultSet rs = ps.executeQuery();
            HttpSession session=request.getSession();
            if (rs.next()) {
                session.setAttribute("uname", rs.getString("fname")+" "+rs.getString("lname"));
                session.setAttribute("userid", rs.getString("userid"));

                if(rs.getString("role").equals("Customer")){
                    response.sendRedirect("index.jsp");
                }else{                 
                    session.setAttribute("role", "Administrator");
                    response.sendRedirect("AdminHome.jsp");
                }
            } else {
                session.setAttribute("emsg", "Invalid username or password..!!");
                response.sendRedirect("Login.jsp");
            }
        } catch (Exception ex) {
            response.getWriter().println("Error "+ex.getMessage());
        }
    }

}

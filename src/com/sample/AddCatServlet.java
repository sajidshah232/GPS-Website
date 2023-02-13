package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/AddCat")
public class AddCatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String cname = request.getParameter("cname");
        
        try{
        Connection con=DBUtils.Connect();

        PreparedStatement ps = con.prepareStatement("INSERT into category(category) values(?)");
        
        ps.setString(1, cname);
        
        ps.executeUpdate();

        response.sendRedirect("Categories.jsp");
        }catch(Exception ex){
            response.getWriter().println("Error "+ex.getMessage());
        }
    }

}

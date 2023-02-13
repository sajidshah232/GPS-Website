package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Customer c=new Customer();
            c.setFname(request.getParameter("fname"));
            c.setLname(request.getParameter("lname"));
            c.setUserid(request.getParameter("userid"));
            c.setPwd(request.getParameter("pwd"));
               
            CustomerDAO.addCustomer(c);
            
            HttpSession session=request.getSession();
            session.setAttribute("msg", "User Registered Successfully");
            session.setAttribute("userid",request.getParameter("userid"));
            session.setAttribute("uname",request.getParameter("fname")+" "+request.getParameter("lname"));

            response.sendRedirect("index.jsp");
        } catch (Exception ex) {
            response.getWriter().println("Error "+ex.getMessage());
        }
    }

}

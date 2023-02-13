package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteCat")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String cat = request.getParameter("cat");            
            HttpSession session = request.getSession();
            if (CategoryDAO.productInCategory(cat) > 0) {
                session.setAttribute("msg", "Cannot delete category. First delete products");
                response.sendRedirect("Categories.jsp");
            } else {
                CategoryDAO.deleteCategory(cat);
                session.setAttribute("msg", "Category removed");
                response.sendRedirect("Categories.jsp");
            }
        } catch (Exception ex) {
            System.out.println("Error "+ex.getMessage());
        }
    }

}

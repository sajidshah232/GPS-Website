package com.sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pname = req.getParameter("pname");
        String pcat = req.getParameter("pcat");
        float price = Float.parseFloat(req.getParameter("price"));
        float dprice =Float.parseFloat(req.getParameter("dprice"));
        String remarks = req.getParameter("remarks");
        String descr = req.getParameter("descr");
        Part photo = req.getPart("pic");
        Part photo2 = req.getPart("pic2");
        Part photo3 = req.getPart("pic3");


        try {
            Product p=new Product(pname, pcat, price, dprice, remarks, descr);
            ProductDAO.addProduct(p, photo,photo2,photo3, getServletContext());
            resp.sendRedirect("AllProducts.jsp");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }

    }

}

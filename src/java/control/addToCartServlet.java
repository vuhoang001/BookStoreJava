/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.ShoppingCartDAO;
import entity.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

/**
 *
 * @author baokhanh
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addToCartServlet"})
public class addToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookId = request.getParameter("bookId"); // Lấy bookId từ request
        // Thực hiện các bước để thêm vào giỏ hàng
        ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
        ShoppingCart shoppingCart = new ShoppingCart(UUID.randomUUID().toString(), "userId", bookId, "paymentId", 1, false); // Tạo đối tượng ShoppingCart
        boolean success = shoppingCartDAO.createShoppingCart(shoppingCart); // Thêm vào giỏ hàng

        // Điều hướng về trang thành công hoặc lỗi
        if (success) {
            response.sendRedirect(request.getContextPath() + "/success.jsp"); // Chuyển hướng về trang thành công
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp"); // Chuyển hướng về trang lỗi
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

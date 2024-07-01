/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.CustomersDAO;
import DAO.Dao;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

  
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        String role = request.getParameter("role");

        Dao dao = new Dao();
        List<Customers> customers = dao.Login(username, password);
        if (customers == null || customers.isEmpty()) {
            request.setAttribute("mess", "Invalid username or password");
            request.getRequestDispatcher("/client/DangNhap.jsp").forward(request, response);
//            request.setAttribute("mess", "Nhập sai Username hoặc Mật Khẩu!");
//            request.getRequestDispatcher("/bansach/client/DangNhap.jsp").forward(request, response);
        } else {
            Customers customer = customers.get(0) ;
//            String cus = customer.getCustomer_role();
            HttpSession session = request.getSession();
            session.setAttribute("acc",customer);
//            session.setAttribute("ac",cus);
            session.setMaxInactiveInterval(60*60*24*365);
//            request.setAttribute("customers", customers);
//            request.getRequestDispatcher("/bansach/client/index.jsp").forward(request, response);
            response.sendRedirect("/bansach/client/index.jsp");
        }
//        CustomersDAO dao = new CustomersDAO();
//        Customers customer = dao.getCustomerByUsernameAndPassword(username, password);
//
//        if (customer != null) {
//            if ("admin".equals(customer.getCustomer_role()) && "123".equals(password)) {
//                response.sendRedirect("/client/layout/adminPage.jsp");
//            } else {
//                response.sendRedirect("/client/layout/HomeLayout.jsp");
//            }
//        } 
//         else {
//            request.setAttribute("mess", "Invalid username or password");
//            request.getRequestDispatcher("/client/DangNhap.jsp").forward(request, response);
//        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

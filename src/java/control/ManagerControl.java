/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.BooksDAO;
import DAO.CategoriesDAO;
import entity.Books;
import entity.Categories;
import entity.Customers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet (name ="ManagerControl", urlPatterns ="/ManagerControl")
public class ManagerControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("acc");
//        String customer_id = customer.getCustomer_id();
        
        BooksDAO books = new BooksDAO();
        CategoriesDAO dao = new CategoriesDAO();
        List<Books> list = books.getAllBooksWithDetails();
        List<Categories> listC = dao.getAllCategories();
        
        request.setAttribute("listB", list);
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("/banhang/content/ManagerBook.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

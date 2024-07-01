package control;

import DAO.ShoppingCartInfoDAO;
        
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action != null && action.equals("delete")) {
            String bookId = request.getParameter("bookId");
            String customerId = "CU001"; 
            
           
            ShoppingCartInfoDAO shoppingCartInfoDAO = new ShoppingCartInfoDAO();
            boolean deleted = shoppingCartInfoDAO.deleteCartItem(customerId, bookId);
            
          
            response.sendRedirect("/client/layout/CartLayout.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

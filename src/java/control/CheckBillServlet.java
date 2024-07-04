package control;

import DAO.ShoppingCartInfoDAO;
        import DAO.ShoppingCartDAO;
import entity.ShoppingCart;
import entity.ShoppingCartInfo;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "CheckBillServlet", urlPatterns = {"/CheckBillServlet"})
public class CheckBillServlet extends HttpServlet {

 

  @Override
// Trong phương thức doPost của servlet
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        
        throws ServletException, IOException {
    // Xử lý cập nhật bảng ở đây, ví dụ:
      
    String customerId = "CU001"; // Replace with actual customer ID retrieval logic
        
        if (customerId != null) {
            ShoppingCartInfoDAO dao = new ShoppingCartInfoDAO();
            
            // Update shopping cart statusDelete to 0 for the customer
            boolean success = dao.updateCartStatus(customerId, 0);

            if (success) {
                // Redirect to another page after successful update
                response.sendRedirect(request.getContextPath() + "/client/layout/CheckBillLayout.jsp");
            } else {
                // Handle update failure
                response.sendRedirect(request.getContextPath() + "/client/layout/ShopLayout.jsp");
            }
        } 
    }
}



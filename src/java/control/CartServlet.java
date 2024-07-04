package control;

import DAO.ShoppingCartInfoDAO;
import entity.Customers;
        
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("acc");
        
        if (customer == null) {
            response.sendRedirect("login.jsp"); // Nếu khách hàng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return;
        }
        
        String customerId = customer.getCustomer_id();
        String action = request.getParameter("action");

        ShoppingCartInfoDAO shoppingCartInfoDAO = new ShoppingCartInfoDAO();

        if ("delete".equals(action)) {
            String bookId = request.getParameter("bookId");
            boolean deleted = shoppingCartInfoDAO.deleteCartItem(customerId, bookId);
            response.sendRedirect("client/layout/CartLayout.jsp");
        } else if ("update".equals(action)) {
            // Xử lý cập nhật số lượng
            Map<String, String[]> parameterMap = request.getParameterMap();
            for (String param : parameterMap.keySet()) {
                if (param.startsWith("quantity_")) {
                    String bookId = param.substring(9);  // Lấy bookId từ tên tham số
                    int quantity = Integer.parseInt(parameterMap.get(param)[0]);
                    shoppingCartInfoDAO.updateCartQuantity(customerId, bookId, quantity);
                }
            }
            response.sendRedirect("client/layout/CartLayout.jsp");
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

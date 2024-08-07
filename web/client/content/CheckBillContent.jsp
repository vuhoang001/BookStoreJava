<%-- 
    Document   : ViewProductContent
    Created on : Jun 28, 2024, 5:23:45 PM
    Author     : baokhanh
--%>
<%@ page import="java.util.List" %>
<%@ page import="entity.ShoppingCartInfo" %>
<%@ page import="DAO.ShoppingCartInfoDAO" %>
<%@ page import="entity.Books" %>
<%@ page import="entity.Customers" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<html lang="en">

    


    <body>


        <div class="container-fluid py-5">
            <div class="container py-5">
                <a style="font-size:40px; font-weight: bold; " >Your Bill</a>

                    <div class="table-responsive">
      
     <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                   <tbody>
                        <%
                            Customers customer = (Customers) session.getAttribute("acc");
                            if (customer != null) {
                                String customerId = customer.getCustomer_id();
                                ShoppingCartInfoDAO dao = new ShoppingCartInfoDAO();
                                List<ShoppingCartInfo> cartInfoList = dao.getShoppingCartInfoById(customerId);

                                float subtotal = 0;

                                for (ShoppingCartInfo cartInfo : cartInfoList) {
                                    Books book = cartInfo.getBooks();
                                    int quantity = cartInfo.getTotal_quantity();
                                    float total = book.getBook_price() * quantity;
                                    subtotal += total;
                        %>
                        <tr>
                            <td><img src="<%= book.getBook_image() %>" alt="Book Image" style="width: 100px;"></td>
                            <td><%= book.getBook_name() %></td>
                            <td>$<%= book.getBook_price() %></td>
                            <td><%= quantity %></td>
                            <td>$<%= total %></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                    </div>
             
                <div class="row g-4 justify-content-end">
                  
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                     <form method="post" action="<%= request.getContextPath() %>/CheckBillServlet">
    <input type="hidden" name="action" value="buyNow">
    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="submit">Buy now!</button>
</form>
 
                    </div>
                </div>
            </div>
        </div>
   
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
 
</html>
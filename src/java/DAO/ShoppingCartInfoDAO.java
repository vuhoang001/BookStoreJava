/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import entity.ShoppingCartInfo;
import entity.Customers;
import entity.Books;
import entity.Payments;
import entity.ShoppingCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vuhoa
 */
public class ShoppingCartInfoDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private int quantity;
    private String bookId;
    private String paymentId;

    public List<ShoppingCartInfo> getShoppingCartInfoById(String id) {
        List<ShoppingCartInfo> data = new ArrayList<>();
        String query = "select books.book_id, \n"
                + "       books.book_name, \n"
                + "       books.book_price, \n"
                + "       books.book_image, \n"
                + "       books.book_description,\n"
                + "       customers.customer_id,\n"
                + "       customers.customer_name, \n"
                + "       customers.customer_address, \n"
                + "       customers.customer_phone,\n"
                + "       sum(shopping_cart.shopping_cart_quantity) as total_quantity\n"
                + "from shopping_cart \n"
                + "left join customers \n"
                + "on shopping_cart.customer_id = customers.customer_id\n"
                + "left join books \n"
                + "on shopping_cart.book_id = books.book_id\n"
                + "where customers.customer_id = ? and shopping_cart.statusDelete = 0\n"
                + "group by books.book_id, \n"
                + "         books.book_name, \n"
                + "         books.book_price, \n"
                + "         books.book_image, \n"
                + "         books.book_description,\n"
                + "         customers.customer_id,\n"
                + "         customers.customer_name, \n"
                + "         customers.customer_address, \n"
                + "         customers.customer_phone";

        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Create and populate Books object
                Books book = new Books();
                book.setBook_id(rs.getString("book_id"));
                book.setBook_name(rs.getString("book_name"));
                book.setBook_price(rs.getFloat("book_price"));
                book.setBook_image(rs.getString("book_image"));
                book.setBook_description(rs.getString("book_description"));

                // Create and populate Customers object
                Customers customer = new Customers();
                customer.setCustomer_id(rs.getString("customer_id"));
                customer.setCustomer_name(rs.getString("customer_name"));
                customer.setCustomer_address(rs.getString("customer_address"));
                customer.setCustomer_phone(rs.getString("customer_phone"));

                // Create and populate ShoppingCartInfo object
                ShoppingCartInfo info = new ShoppingCartInfo();
                info.setBooks(book);
                info.setCustomers(customer);
                info.setTotal_quantity(rs.getInt("total_quantity"));

                data.add(info);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // Close resources
            try {
                rs.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                ps.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return data;
    }
    public boolean deleteCartItem(String customerId, String bookId) {
        String query = "DELETE FROM shopping_cart WHERE customer_id = ? AND book_id = ?";
        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            ps.setString(1, customerId);
            ps.setString(2, bookId);
            int deletedRows = ps.executeUpdate();
            return deletedRows > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }
public boolean updateCartStatus(String customerId, int statusDelete) {
        String query = "UPDATE shopping_cart SET statusDelete = ? WHERE customer_id = ?";

        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, statusDelete);
            ps.setString(2, customerId);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }

    public ShoppingCartInfoDAO() {
    }

    public static void main(String[] args) {
        ShoppingCartInfoDAO shoppingCartInfoDAO = new ShoppingCartInfoDAO();
        String customerId = "CU001"; // Replace with a valid customer ID for testing

        List<ShoppingCartInfo> shoppingCartInfos = shoppingCartInfoDAO.getShoppingCartInfoById(customerId);

        for (ShoppingCartInfo info : shoppingCartInfos) {
            System.out.println(info);
        }
    }
}

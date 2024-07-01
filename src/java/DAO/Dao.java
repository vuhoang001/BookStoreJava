package DAO;

import context.DBContext;
import entity.Account;
import entity.Customers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Dao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

   public List<Customers> Login(String customer_username, String customer_password) {
        List<Customers> customersList = new ArrayList<>();
        String query = "SELECT * FROM customers WHERE customer_username = ? AND customer_password = ?";

        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, customer_username);
            ps.setString(2, customer_password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Customers customer = new Customers(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3), 
                        rs.getString(4),
                        rs.getString(5), 
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8));
                customersList.add(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return customersList;
    }
   
   public Customers CheckSignup(String username) {
        String query = "select * from customers where [customer_username] = ?";
        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customers(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3), 
                        rs.getString(4),
                        rs.getString(5), 
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8));
            }

        } catch (Exception e) {
        }
        return null;
    }
   
   
   public void Signup(String customer_name, String customer_address, String customer_phone, String customer_username, String customer_password) {
        String query = "INSERT INTO customers (customer_name, customer_address, customer_phone, customer_username, customer_password, customer_role, statusDelete) VALUES (?, ?, ?, ?, ?, 'customer', 0)";
        try {
            conn = new DBContext().getConnect();
            ps = conn.prepareStatement(query);
            ps.setString(1, customer_name);
            ps.setString(2, customer_address);
            ps.setString(3, customer_phone);
            ps.setString(4, customer_username);
            ps.setString(5, customer_password);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Main method for testing
    public static void main(String[] args) {
        Dao dao = new Dao();

        // Test Signup
        dao.Signup("Ädmin", " Address", "1234567890", "admin", "123");

        // Test Login
        String customer_username = "admin";
        String customer_password = "123";
        List<Customers> data = dao.Login(customer_username, customer_password);
        for (Customers customer : data) {
            System.out.println(customer);
        }
    }
//public static void main(String[] args) {
//        Dao dao = new Dao();
//        String customer_username = "admin"; 
//        String customer_password = "123"; 
//
//        List<Customers> data = dao.Login(customer_username, customer_password);
//        for (var item : data) {
//            System.out.println(item);
//        }
}

    



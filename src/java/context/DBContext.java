
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class DBContext {
    protected Connection conn;

    public Connection getConnect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
//          Hoanggggf

<<<<<<< HEAD
            String connectionUrl = "jdbc:sqlserver://HOANGGGGF\\SQLEXPRESS:1433;databaseName=BookStore4;encrypt=false";            
            conn = DriverManager.getConnection(connectionUrl, "sa", "123");
=======
            String connectionUrl = "jdbc:sqlserver://LEBAOKHANH:1433;databaseName=bookstore4;encrypt=false";            
            conn = DriverManager.getConnection(connectionUrl, "sa", "12345");
>>>>>>> e8f58080ff827c3ef220c5331068032ad2119767

//            String connectionUrl = "jdbc:sqlserver://LAPTOP-HLRA9EFE\\SQLEXPRESS:1433;databaseName=CuaHangSach;encrypt=false";            
//            conn = DriverManager.getConnection(connectionUrl, "sa", "123456");

            
            System.out.println("Kết nối cơ sở dữ liệu thành công !");
           
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Kết nối cơ sở dữ liệu thất bại !");
            System.out.println(0);
        }
         return conn;
    }
    
    public static void main(String[] args) {
        DBContext conn = new DBContext();
        conn.getConnect();
        
    }
}

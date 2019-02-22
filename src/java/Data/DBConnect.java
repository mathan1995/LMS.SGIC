/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

//Importing needed Packages 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Mathan
 */
public class DBConnect {
    
      static Connection con = null;

    public Connection getconnection() throws ClassNotFoundException//common method
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms2019?useSSL=false", "root", "");
            System.out.println("Succesfully Connected To Database !!");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, (" Error.." + e));
        }
        return con;
    }

    public static void disconnect() {
        if (con != null) {
            try {
                con.close();
                System.out.println("Database Connection Failed !!");
            } catch (SQLException es) {
                System.out.println("ERROR :" + es);
            }
        }
    }
}

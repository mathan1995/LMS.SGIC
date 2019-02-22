/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;
import Model.MainClassifaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Mathan
 */
public class MainClassifactionDataAccessObject {
    
    DBConnect db = new DBConnect();
    Connection con;
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO main_cat (MCatID, MCatName) "
            + "VALUES (?, ?)";

    public MainClassifactionDataAccessObject() throws ClassNotFoundException {
        this.con = db.getconnection();
    }
    
     public void addClassification(MainClassifaction mainClassification) {
        try {
            
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mainClassification.getMainClassificationId());
            pstmt.setString(2, mainClassification.getMainClassificationName());
            pstmt.executeUpdate();
            DBConnect.disconnect();

        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }

    }
     
       public List<MainClassifaction> showMainclassification() throws SQLException {
        try {
            List<MainClassifaction> result = new ArrayList<>();
            PreparedStatement statement;
            String showSQL = "SELECT * FROM main_cat ORDER BY MCatID";

            statement = con.prepareStatement(showSQL);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassifaction mainClassification = new MainClassifaction();
                mainClassification.setMainClassificationId(rsShow.getString("MCatID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCatName"));
                result.add(mainClassification);
            }
            return result;
        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }
        DBConnect.disconnect();
        return null;
    }
        public List<MainClassifaction> viewMainClassificationById(String mainClassificationId) throws SQLException {
        try {
            List<MainClassifaction> result = new ArrayList<>();
            //DatabaseConnect db = new DatabaseConnect();
            //Connection con = db.getconnection();
            PreparedStatement statement;
            String showSQL = "SELECT * FROM main_cat WHERE MCatID = '" + mainClassificationId + "'";

            statement = con.prepareStatement(showSQL);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassifaction mainClassification = new MainClassifaction();
                mainClassification.setMainClassificationId(rsShow.getString("MCatID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCatName"));
                result.add(mainClassification);
            }
            return result;
        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }
        DBConnect.disconnect();
        return null;
    }
        
            public void updateMainClassification(MainClassifaction mainClassification) throws SQLException {
        //Connection con = db.getconnection();
        try {

            PreparedStatement stmt;
            String id = mainClassification.getMainClassificationId();
            String sqlUpdate = "UPDATE main_cat SET "
                    + "MCatName = ? "
                    + "WHERE MCatID ='" + mainClassification.getMainClassificationId() + "'";
            stmt = con.prepareStatement(sqlUpdate);
            stmt.setString(1, mainClassification.getMainClassificationName());
            stmt.executeUpdate();
            DBConnect.disconnect();

        } catch (SQLException ex) {
            Logger.getLogger(MainClassifaction.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        }

    }
            
 public void deleteMainclassification(String MCID) throws SQLException {
        String deletesql = "DELETE FROM main_cat "
                + "WHERE MCatID = '" + MCID + "'";
        try {
            //Connection con = db.getconnection();
            //PreparedStatement pstmt;
            pstmt = con.prepareStatement(deletesql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL Query Error Exception: " + e);
        } finally {
            DBConnect.disconnect();
        }
    }
 public List<MainClassifaction> searchMainClassification(String searchID) throws SQLException {
        String search = "SELECT * FROM main_cat "
                + "WHERE MCatID LIKE '" + searchID + "%' "
                + "OR MCatName LIKE '" + searchID + "%' "
                + "ORDER BY MCatID";
        List<MainClassifaction> mainClassificationList = new ArrayList<>();
        //DatabaseConnect db = new DatabaseConnect();
        //Connection con = db.getconnection();
        PreparedStatement statement;
        try {
            statement = con.prepareCall(search);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassifaction mainClassification = new MainClassifaction();
                mainClassification.setMainClassificationId(rsShow.getString("MCatID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCatName"));
                mainClassificationList.add(mainClassification);
            }
        } catch (SQLException e) {
            System.out.println("SQL Error Exception: " + e.getMessage());
        } finally {
            DBConnect.disconnect();
        }
        return mainClassificationList;
    }
       
       
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;
import Model.SubClassifaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Mathan
 */
public class SubClassifactionDataAccessObject {
        public ArrayList showSubclassification() throws ClassNotFoundException {
        String sql = "SELECT * FROM sub_cat sc "
                + "JOIN main_cat mc ON sc.MCatID=mc.MCatID ORDER BY sc.SCatID ";

        ArrayList<SubClassifaction> subClassificationList = new ArrayList<>();

        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                SubClassifaction subClassification = new SubClassifaction();
                subClassification.setSubClassificationId(rs.getString("SCatID"));
                subClassification.setSubClassificationName(rs.getString("SCatName"));
                subClassification.setMainClassificationId(rs.getString("MCatID"));
                subClassification.setMainClassificationName(rs.getString("MCatName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DBConnect.disconnect();
        }

        return subClassificationList;

    }
        
        public ArrayList viewSubClassificationById(String subClassificationId) throws ClassNotFoundException {
        String sql = "SELECT * FROM sub_cat sc "
                + "JOIN main_cat mc "
                + "ON sc.MCatID = mc.MCatID "
                + "WHERE sc.SCatID = '" + subClassificationId + "'";

        ArrayList<SubClassifaction> subClassificationList = new ArrayList<>();
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                SubClassifaction subClassification = new SubClassifaction();
                subClassification.setSubClassificationId(rs.getString("SCatID"));
                subClassification.setSubClassificationName(rs.getString("SCatName"));
                subClassification.setMainClassificationId(rs.getString("MCatID"));
                subClassification.setMainClassificationName(rs.getString("MCatName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SubClassifactionDataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnect.disconnect();
        }
        return subClassificationList;
    }
        
        public void addSubClassification(SubClassifaction subClassification) throws ClassNotFoundException {
        DBConnect db = new DBConnect();
        Connection con = db.getconnection();
        PreparedStatement stmt;
        String sql = "INSERT INTO sub_cat (SCatID, SCatName,MCatID) "
                + "VALUES (?, ?, ?)";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, subClassification.getSubClassificationId());
            stmt.setString(2, subClassification.getSubClassificationName());
            stmt.setString(3, subClassification.getMainClassificationId());
            stmt.executeLargeUpdate();

        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        } finally {
            DBConnect.disconnect();
        }
    }
         public void editSubClassification(SubClassifaction subClassification) throws ClassNotFoundException {
        String sql = "UPDATE sub_cat SET "
                + "SCatName = ?, "
                + "MCatID = ? "
                + "WHERE SCatID = '" + subClassification.getSubClassificationId() + "'";

        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            stmt.setString(1, subClassification.getSubClassificationName());
            stmt.setString(2, subClassification.getMainClassificationId());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DBConnect.disconnect();
        }
    }
         
         
 public void deleteSubclassification(String subClassificationId) throws ClassNotFoundException {
        String sql = "DELETE FROM sub_cat "
                + "WHERE SCatID ='" + subClassificationId + "'";
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(" SQL Query Error Exception:" + e);
        } finally {
            DBConnect.disconnect();
        }
    }

    public List searchSubClassificationByMainClassificationName(String firstFilterText) throws ClassNotFoundException {
        String sql = "SELECT * FROM sub_cat sc "
                + "JOIN main_cat mc ON sc.MCatID=mc.MCatID "
                + "WHERE sc.SCID LIKE '" + firstFilterText + "%' "
                + "OR sc.SCatName LIKE '" + firstFilterText + "%' "
                + "OR mc.MCatName LIKE '" + firstFilterText + "%' "
                + "OR mc.MCatID LIKE '" + firstFilterText + "%' "
                + "ORDER BY sc.MCatID";

        List<SubClassifaction> subClassificationList = new ArrayList<>();

        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rs;
            rs = statement.executeQuery();

            while (rs.next()) {
                SubClassifaction subClassification = new SubClassifaction();
                subClassification.setSubClassificationId(rs.getString("SCatID"));
                subClassification.setSubClassificationName(rs.getString("SCatName"));
                subClassification.setMainClassificationId(rs.getString("MCatID"));
                subClassification.setMainClassificationName(rs.getString("MCatName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DBConnect.disconnect();
        }

        return subClassificationList;
    }
    
         public ArrayList subClassificationByMainClassification(String mainClassificationId) throws ClassNotFoundException {
        String sql = "SELECT * FROM main_cat mc "
                + "JOIN sub_cat sc "
                + "ON mc.MCatID=sc.MCatID "
                + "WHERE sc.MCatID='" + mainClassificationId + "'";

        ArrayList<SubClassifaction> subClassificationList = new ArrayList<>();

        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            Statement stmt = null;
            stmt=con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassifaction subClassification = new SubClassifaction();
                subClassification.setSubClassificationId(rs.getString("SCatID"));
                subClassification.setSubClassificationName(rs.getString("SCatName"));
                subClassification.setMainClassificationId(rs.getString("MCatID"));
                subClassification.setMainClassificationName(rs.getString("MCatName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
//            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DBConnect.disconnect();
        }

        return subClassificationList;
    }

        
}

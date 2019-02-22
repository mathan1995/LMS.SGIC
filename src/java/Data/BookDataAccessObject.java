/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;
//Importing Book from Model Class

import Model.Book;

//Importing Needed Packages

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mathan
 */
public class BookDataAccessObject {

    //Started Insert COde
    //Class For Add Data of Book in to database
    public void saveBook(Book book) throws ClassNotFoundException, SQLException {

        DBConnect db = new DBConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;
        try {
            String bookid = book.getBookId();
            String title = book.getTitle();
            String author = book.getAuthor();
            String mainclass = book.getMainClassification();
            String subclass = book.getSubClassification();
            String yearofpublish = book.getYearOfPublishing();
            String isbn = book.getISBN();

            String insertBook = "INSERT INTO books (BookID,Name,Author,MCatID,SCatID,PublishYear,ISBN) VALUES (?,?,?,?,?,?,?)";
            statement = con.prepareStatement(insertBook);
            statement.setString(1, bookid);
            statement.setString(2, title);
            statement.setString(3, author);
            statement.setString(4, mainclass);
            statement.setString(5, subclass);
            statement.setString(6, yearofpublish);
            statement.setString(7, isbn);
            statement.executeUpdate();
            DBConnect.disconnect();
        } catch (SQLException e) {
            Logger.getLogger(BookDataAccessObject.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    //Completed Insert COde

    //Started Data fetch from book table
    /**
     *
     * @return @throws ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public ArrayList<Book> showBook() throws SQLException, ClassNotFoundException {
        ArrayList<Book> result = new ArrayList<>();

        DBConnect db = new DBConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String showSQL = "SELECT * FROM books b"
                + " JOIN sub_cat sc ON b.SCatID = sc.SCatID"
                + " JOIN main_cat mc ON mc.MCatID=b.MCatID";

        statement = con.prepareStatement(showSQL);
        ResultSet rsShow = statement.executeQuery();

        while (rsShow.next()) {
            Book book = new Book();
            book.setBookId(rsShow.getString("BookID"));
            book.setTitle(rsShow.getString("Name"));
            book.setAuthor(rsShow.getString("Author"));
            book.setMainClassification(rsShow.getString("MCatName"));
            book.setSubClassification(rsShow.getString("SCatName"));
            book.setYearOfPublishing(rsShow.getString("PublishYear"));
            book.setISBN(rsShow.getString("ISBN"));

            result.add(book);

        }
        DBConnect.disconnect();
        return result;
    }
    //end data fetch from book tabel

    //Start of Data delete
    public void deleteBook(String bookId) throws SQLException, ClassNotFoundException {
        DBConnect db = new DBConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String deleteSQL = "DELETE FROM books WHERE BookID = ?";

        statement = con.prepareStatement(deleteSQL);
        statement.setString(1, bookId);
        statement.executeUpdate();
        DBConnect.disconnect();
    }
    //end of data delete

    //Start of update statement
    public void updateBook(Book book) throws SQLException, ClassNotFoundException {
        //Book book = new Book();
        String bookId = book.getBookId();
        DBConnect db = new DBConnect();
        Connection con = db.getconnection();
        //Query Statement
        try {
            String sqlUpdate = "UPDATE books SET "
                    + "Name = ?,"
                    + "Author = ?,"
                    + "MCatID =?,"
                    + "SCatID =?,"
                    + "PublishYear =?,"
                    + "ISBN =?,"
                    + "WHERE BookID ='" + bookId + "'";
            //con.setAutoCommit(false);
            // Book book = new Book();
            PreparedStatement pstmt = con.prepareStatement(sqlUpdate);
            //pstmt.setString(9, book.getBookId());
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getMainClassification());
            pstmt.setString(4, book.getSubClassification());
            pstmt.setString(5, book.getYearOfPublishing());
            pstmt.setString(6, book.getISBN());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            // Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DBConnect.disconnect();

        }
    }

    //end of update starement class
    //start of view book by id
    public ArrayList viewBookById(String bookId) throws ClassNotFoundException {
        String sql = "SELECT * FROM books b"
                + " JOIN sub_cat sc ON b.SCatID = sc.SCatID"
                + " JOIN main_cat mc ON mc.MCatID=b.MCatID"
                + " WHERE BookID ='" + bookId + "'";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rsShow = statement.executeQuery();

            while (rsShow.next()) {
                Book book = new Book();
                book.setBookId(rsShow.getString("BookID"));
                book.setTitle(rsShow.getString("Name"));
                book.setAuthor(rsShow.getString("Author"));
                book.setMainClassification(rsShow.getString("MCatID"));
                book.setSubClassification(rsShow.getString("SCatID"));
                book.setMainClassificationName(rsShow.getString("MCatName"));
                book.setSubClassificationName(rsShow.getNString("SCatName"));
                book.setYearOfPublishing(rsShow.getString("PublishYear"));
                book.setISBN(rsShow.getString("ISBN"));

                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnect.disconnect();
        }
        return bookList;
    }
//End of view book by id

    //start of Search Book
    public ArrayList serarchBook(String bookId) throws ClassNotFoundException {
        String sql = "SELECT * FROM books b "
                + " JOIN main_cat mc ON mc.MCatID=b.MCatID "
                + " JOIN sub_cat sc ON sc.SCatID =b.SCatID "
                + " WHERE BookID LIKE '" + bookId + "%'"
                + " OR sc.SCatName LIKE '" + bookId + "%'"
                + " OR mc.MCatName LIKE '" + bookId + "%'"
                + " OR b.Name LIKE '" + bookId + "%'"
                + " OR b.Author LIKE '" + bookId + "%'"
                + " OR b.PublishYear LIKE '" + bookId + "%'"
                + " OR b.ISBN LIKE '" + bookId + "%'"
                + " ORDER BY b.BookID ";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rsShow = statement.executeQuery();

            while (rsShow.next()) {
                Book book = new Book();
                book.setBookId(rsShow.getString("BookID"));
                book.setTitle(rsShow.getString("Name"));
                book.setAuthor(rsShow.getString("Author"));
                book.setMainClassification(rsShow.getString("MCatName"));
                book.setSubClassification(rsShow.getString("SCatName"));
                book.setYearOfPublishing(rsShow.getString("PublishYear"));
                book.setISBN(rsShow.getString("ISBN"));

                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnect.disconnect();
        }
        return bookList;
    }

}

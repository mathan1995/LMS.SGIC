/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Data.BookDataAccessObject;
import Model.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Mathan
 */
@WebServlet(name = "EditBookController", urlPatterns = {"/EditBookController"})
public class EditBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        Book book = new Book();
         String bookId = request.getParameter("editBookId");
        String bookTitle = request.getParameter("editBookTitle");
        String bookAuthor = request.getParameter("editBookAuthor");
        String bookMainClassificationId = request.getParameter("editBookMainClassification");
        String bookSubClassificationId = request.getParameter("editBookSubClassification");
        String bookPublishYear = request.getParameter("editBookPublishYear");
        String bookISBN = request.getParameter("editISBN");
        BookDataAccessObject dao = new BookDataAccessObject();
        //String bookId = request.getParameter("editBookId");
        try {
            book.setBookId(bookId);
            book.setTitle(bookTitle);
            book.setAuthor(bookAuthor);
            book.setMainClassification(bookMainClassificationId);
            book.setSubClassification(bookSubClassificationId);
            book.setYearOfPublishing(bookPublishYear);
            book.setISBN(bookISBN);
            dao.updateBook(book);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewBookController");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            Logger.getLogger(EditBookController.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

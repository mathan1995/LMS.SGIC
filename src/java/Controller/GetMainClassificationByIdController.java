/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Data.MainClassifactionDataAccessObject;
import Model.MainClassifaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Mathan
 */
@WebServlet(name = "GetMainClassificationByIdController", urlPatterns = {"/GetMainClassificationByIdController"})
public class GetMainClassificationByIdController extends HttpServlet {

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
            out.println("<title>Servlet GetMainClassificationByIdController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetMainClassificationByIdController at " + request.getContextPath() + "</h1>");
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
        try {
            //        processRequest(request, response);

            MainClassifactionDataAccessObject mainClassificationDao = new MainClassifactionDataAccessObject();
            String mainClassificationId = request.getParameter("mainClassificationId");

            List<MainClassifaction> mainClassificationList = mainClassificationDao.viewMainClassificationById(mainClassificationId);

            response.setContentType("application/json");
            PrintWriter writer = response.getWriter();

            JsonObjectBuilder rootBuilder = Json.createObjectBuilder();
            JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
            JsonObject mainClassificationJson = null;

            for (MainClassifaction mainClassification : mainClassificationList) {
                JsonObjectBuilder mainClassificationBuilder = Json.createObjectBuilder();

                mainClassificationJson = mainClassificationBuilder
                        .add("MainClassificationId", mainClassification.getMainClassificationId() != null ? mainClassification.getMainClassificationId() : "")
                        .add("MainClassificationName", mainClassification.getMainClassificationName() != null ? mainClassification.getMainClassificationName() : "")
                        .build();
                arrayBuilder.add(mainClassificationJson);
            }

            JsonObject root = rootBuilder.add("MainClassification", arrayBuilder).build();
            writer.print(root);
            writer.flush();
            writer.close();
        } catch (SQLException ex) {
            Logger.getLogger(GetMainClassificationByIdController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetMainClassificationByIdController.class.getName()).log(Level.SEVERE, null, ex);
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

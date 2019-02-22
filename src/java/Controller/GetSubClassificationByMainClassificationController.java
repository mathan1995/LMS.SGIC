/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Data.SubClassifactionDataAccessObject;
import Model.SubClassifaction;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "GetSubClassificationByMainClassificationController", urlPatterns = {"/GetSubClassificationByMainClassificationController"})
public class GetSubClassificationByMainClassificationController extends HttpServlet {
SubClassifactionDataAccessObject subClassificationDao = new SubClassifactionDataAccessObject();

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
            out.println("<title>Servlet GetSubClassificationByMainClassificationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetSubClassificationByMainClassificationController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String mainClassificationId = request.getParameter("mainClassificationId");
        
        List<SubClassifaction> subClassificationList = null;
    try {
        subClassificationList = subClassificationDao.subClassificationByMainClassification(mainClassificationId);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(GetSubClassificationByMainClassificationController.class.getName()).log(Level.SEVERE, null, ex);
    }
        
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        
        JsonObjectBuilder rootBuilder = Json.createObjectBuilder();
        JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
        JsonObject subClassificationJson = null;
        
        for(SubClassifaction subClassification : subClassificationList){
            JsonObjectBuilder subClassificationBuilder = Json.createObjectBuilder();
            
            subClassificationJson = subClassificationBuilder
                    .add("SubClassificationId", subClassification.getSubClassificationId())
                    .add("SubClassificationName", subClassification.getSubClassificationName())
                    .build();
            
            arrayBuilder.add(subClassificationJson);
        }
        JsonObject root = rootBuilder.add("SubClassification", arrayBuilder).build();
        writer.print(root);
        writer.flush();
        writer.close();
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

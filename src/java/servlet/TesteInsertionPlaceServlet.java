/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DateDao;
import dao.DestignationDao;
import dao.HeureDao;
import dao.TestePlaceDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SUKUNA
 */
public class TesteInsertionPlaceServlet extends HttpServlet {

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
            String heure = request.getParameter("heure");
            String numero_place = request.getParameter("place");
            String date = request.getParameter("date");
            String destignation = request.getParameter("destignation");
            TestePlaceDao place = new TestePlaceDao();
            HeureDao heureReservation =new HeureDao();
            DateDao dateReservation = new DateDao();
            DestignationDao dest = new DestignationDao();
            try {
                place.InsertionPlaceClient(numero_place);
                heureReservation.heureReservation(heure);
                dateReservation.DateReservation(date);
                dest.InsertionDestignationCient(destignation);
                request.getRequestDispatcher("/FormulaireClient.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.getLogger(TesteInsertionPlaceServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            }
            
            //place.updatePlace(numero_place, heure, date);
            
            //out.println(heure);
            //out.println(numero_place);
            //out.println(date);
            //request.getRequestDispatcher("/FormulaireClient.jsp").forward(request, response);
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
        processRequest(request, response);
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

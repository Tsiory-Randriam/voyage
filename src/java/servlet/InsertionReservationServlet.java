/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.ClientDao;
import dao.ReservationDao;
import dao.TestePlaceDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import teste.Main;

/**
 *
 * @author SUKUNA
 */
public class InsertionReservationServlet extends HttpServlet {

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
        ReservationDao reservation = new ReservationDao();
        TestePlaceDao mis_ajour_place = new TestePlaceDao();
        ClientDao client = new ClientDao();
        try {
            int placeReserver = reservation.DernierPlaceReserver();
            int dernierDate = reservation.DernierDateReserver();
            int dernierHeure = reservation.DernierHeureReserver();
            int idClient = client.DernierReservation();
            String username = client.nomClient(idClient);
            String email = client.emailClient(idClient);
            String contact = client.contactClient(idClient);
            String numeroPlace = reservation.PlaceClient(placeReserver);
            String dateReservation = reservation.DateClient(dernierDate);
            String heureReservation = reservation.HeureClient(dernierHeure);
            reservation.InsertionReservation(username, email, contact, numeroPlace, heureReservation, numeroPlace);
            mis_ajour_place.updatePlace(numeroPlace, heureReservation, dateReservation);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
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

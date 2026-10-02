package servlet;

import dao.ClientDao;
import dao.ReservationDao;
import dao.TestePlaceDao;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import teste.Main;

public class InsertionReservationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDao reservation = new ReservationDao();
        TestePlaceDao mis_ajour_place = new TestePlaceDao();
        ClientDao client = new ClientDao();

        try {
            // 1. Récupération et traitement des données
            int placeReserver = reservation.DernierPlaceReserver();
            int dernierDate = reservation.DernierDateReserver();
            int dernierHeure = reservation.DernierHeureReserver();
            int idClient = client.DernierReservation();
            int idDestignation = reservation.DernieridDestignation();

            String destignation = reservation.dernierDestignation(idDestignation);
            String username = client.nomClient(idClient);
            String email = client.emailClient(idClient);
            String contact = client.contactClient(idClient);
            String numeroPlace = reservation.PlaceClient(placeReserver);
            String dateReservation = reservation.DateClient(dernierDate);
            String heureReservation = reservation.HeureClient(dernierHeure);

            
            reservation.InsertionReservation(username, email, contact, dateReservation, heureReservation, numeroPlace, destignation);
            mis_ajour_place.updatePlace(numeroPlace, heureReservation, dateReservation, destignation);
            
            out.println("<script>");
                out.println("alert('Reservation sucess');");
            out.println("</script>");
        
            response.sendRedirect(request.getContextPath() + "/index.jsp?downloadPdf=true");

        } catch (SQLException ex) {
            System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=true");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
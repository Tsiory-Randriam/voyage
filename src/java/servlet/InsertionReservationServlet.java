package servlet;

import dao.ClientDao;
import dao.DateDao;
import dao.DestignationDao;
import dao.HeureDao;
import dao.ReservationDao;
import dao.TestePlaceDao;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ClientPlaceModele;
import teste.Main;

public class InsertionReservationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReservationDao reservation = new ReservationDao();
        TestePlaceDao mis_ajour_place = new TestePlaceDao();
        ClientDao client = new ClientDao();

        try {
            // 1. Récupération et tr$aitement des données
            int placeReserver = reservation.DernierPlaceReserver();
            int dernierDate = reservation.DernierDateReserver();
            int dernierHeure = reservation.DernierHeureReserver();
            int idClient = client.DernierReservation();
            int idDestignation = reservation.DernieridDestignation();
            int idPlace = reservation.DernierPlaceReserver();
            List<String> monPlace = reservation.MonPlace(idPlace);
            out.print(monPlace);
            
            String destignation = reservation.dernierDestignation(idDestignation);
            String username = client.nomClient(idClient);
            String email = client.emailClient(idClient);
            String contact = client.contactClient(idClient);
            String dateReservation = reservation.DateClient(dernierDate);
            String heureReservation = reservation.HeureClient(dernierHeure);
            

            
            ArrayList<String> listePlaceClient = new ArrayList<>();
            TestePlaceDao place = new TestePlaceDao();
            
            int nombre = place.compterPlaceReserver();
            String frais = reservation.selectFrais(destignation);
            int frais_final = Integer.parseInt(frais) * nombre;
            
            
            List<ClientPlaceModele> listPlace = new ArrayList<ClientPlaceModele>();
            listPlace = place.clientPlace(); 
            for (ClientPlaceModele voyager : listPlace) {
                listePlaceClient.add(voyager.getClientPlace());
            }
            
            reservation.InsertionReservation(username, email, contact, dateReservation, heureReservation,listePlaceClient, destignation,frais_final);
            
            List<ClientPlaceModele> listePlace = new ArrayList<ClientPlaceModele>();
            listePlace = reservation.PlaceClient(username);
            for(ClientPlaceModele MesPlace: listePlace){
                mis_ajour_place.updatePlace(MesPlace.getClientPlace(), heureReservation, dateReservation, destignation);
            }
            
            DateDao suprDate = new DateDao();
            DestignationDao suprDest = new DestignationDao();
            HeureDao suprHeure = new HeureDao();
            TestePlaceDao suprPlace = new TestePlaceDao();
            client.viderClient();
            suprDate.viderDate();
            suprDest.viderDestignation();
            suprHeure.viderHeure();
            suprPlace.viderPlace();
            
            response.sendRedirect(request.getContextPath() + "/recu.jsp");

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
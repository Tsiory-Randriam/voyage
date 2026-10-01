/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package teste;

import dao.ClientDao;
import dao.DateDao;
import dao.DestignationDao;
import dao.HeureDao;
import dao.PlaceDao;
import dao.ReservationDao;
import dao.TestePlaceDao;
import dao.VoyageDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.DateModele;
import models.HeureModele;
import models.PlaceModele;
import models.ReservationModele;
import models.VoyageModele;

/**
 *
 * @author SUKUNA
 */
public class Main {
    public static void main(String[] args)
    {
        try {
            
            ReservationDao reservation = new ReservationDao();
            List<ReservationModele> listeReservation = new ArrayList<ReservationModele>();
            listeReservation = reservation.listeReservation();
            
            
            for (ReservationModele voyager :listeReservation)
           {
                System.out.println(voyager.getIdReservation()+" "+voyager.getUsername());
            }
        } catch (SQLException ex) {
            System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
        //String date = "2026-09-25";
        //String heure = "08 h";
        //TestePlaceDao place = new TestePlaceDao();
        //int total = 0;
        //try {
        //    total = place.compterPlaceDisponible(date, heure);
        //} catch (SQLException ex) {
        //    System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        //}
        //System.out.println(total);
        //ReservationDao reservation = new ReservationDao();
        //ClientDao client = new ClientDao();
        //try {
            //int placeReserver = reservation.DernierPlaceReserver();
            //int dernierDate = reservation.DernierDateReserver();
            //int dernierHeure = reservation.DernierHeureReserver();
            //int idClient = client.DernierReservation();
            //String username = client.nomClient(idClient);
            //String email = client.emailClient(idClient);
            //String contact = client.contactClient(idClient);
            //String numeroPlace = reservation.PlaceClient(placeReserver);
            //String dateReservation = reservation.DateClient(dernierDate);
            //String heureReservation = reservation.HeureClient(dernierHeure);
            //System.out.println("Username : "+username);
            //System.out.println("contact : "+contact);
            //System.out.println("email : "+email); 
            //System.out.println("Place : "+numeroPlace); 
            
            //System.out.println("date  : "+dateReservation);
            //System.out.println("heure max : "+heureReservation);
        //} catch (SQLException ex) {
            //System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        //}
        
}
}

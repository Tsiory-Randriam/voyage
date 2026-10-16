/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import common.AccesBdd;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.ClientPlaceModele;
import models.PlaceModele;
import models.ReservationModele;

/**
 *
 * @author SUKUNA
 */
public class ReservationDao {
public int DernierPlaceReserver() throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idClientPlace from clientplace;";
        ResultSet resultat=acces.executeSelect(sql);
        int id_max_place = 0;
        while(resultat.next())
        {
            if (id_max_place <resultat.getInt("idClientPlace"))
            {
                id_max_place = resultat.getInt("idClientPlace");
            }
        }
        return id_max_place;
}

public String MesPlace(int idPlace) throws SQLException
{   
        String placeClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select clientPlace from clientplace where idClientPlace='"+idPlace+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            placeClient = resultat.getString("clientPlace");
        }
        return placeClient;
}


public List<String> PlaceClient(int idPlace) throws SQLException
{   
    // 1. Déclaration et initialisation de la liste
    List<String> listePlaces = new ArrayList<>();
    
    AccesBdd acces = new AccesBdd();
    acces.loadDriver();
    
    // Remarque : Si idPlace est un entier (int), il est préférable 
    // d'enlever les guillemets autour dans la requête SQL si c'est une colonne numérique.
    String sql = "select clientPlace from clientplace where idClientPlace='" + idPlace + "';";
    
    ResultSet resultat = acces.executeSelect(sql);
    
    while(resultat.next())
    {
        // 2. On ajoute chaque élément trouvé dans la liste
        String placeClient = resultat.getString("clientPlace");
        listePlaces.add(placeClient);
    }
    
    // 3. On retourne la liste
    return listePlaces;
}

public String nomClient(int idPlace) throws SQLException
{   
        String placeClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select usernameClient from clientplace where idClientPlace='"+idPlace+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            placeClient = resultat.getString("usernameClient");
        }
        return placeClient;
}

public List<ClientPlaceModele> PlaceClient(String usernameClient) throws SQLException
{   
        List<ClientPlaceModele> listePlace =new ArrayList<ClientPlaceModele>();
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select clientPlace from clientplace where usernameClient='"+usernameClient+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            ClientPlaceModele place = new ClientPlaceModele();
            place.setClientPlace(resultat.getString("clientPlace"));
            listePlace.add(place);
        }

        return listePlace;
}



public int DernierHeureReserver() throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idHeureReservation from heureReservation;";
        ResultSet resultat=acces.executeSelect(sql);
        int id_max_heure = 0;
        while(resultat.next())
        {
            if (id_max_heure <resultat.getInt("idHeureReservation"))
            {
                id_max_heure = resultat.getInt("idHeureReservation");
            }
        }
        return id_max_heure;
}

public String HeureClient(int idHeure) throws SQLException
{   
        String heureClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select heureReservation from heurereservation where idHeureReservation='"+idHeure+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            heureClient = resultat.getString("heureReservation");
        }
        return heureClient;
}


public int DernierDateReserver() throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idDateReservation from date;";
        ResultSet resultat=acces.executeSelect(sql);
        int id_max_date = 0;
        while(resultat.next())
        {
            if (id_max_date <resultat.getInt("idDateReservation"))
            {
                id_max_date = resultat.getInt("idDateReservation");
            }
        }
        return id_max_date;
}

public String DateClient(int idDate) throws SQLException
{   
        String dateClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select date from date where idDateReservation='"+idDate+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            dateClient = resultat.getString("date");
        }
        return dateClient;
}

public String selectFrais(String destignation) throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select frais_voyage from destignation where destignation='"+destignation+"';";
        ResultSet resultat=acces.executeSelect(sql);
        String frais = "";
        while(resultat.next())
        {
               frais = resultat.getString("frais_voyage");
        }
        return frais;
}

public void InsertionReservation(String username, String email, String contact, String date_voyage, String heure_depart, ArrayList<String> listePlaceClient, String destignation_reservation,int frais)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT Reservation(username,email,contact,date_voyage,heure_depart,numero_place,destignation_reservation,frais) VALUES ('"+username+"','"+email+"','"+contact+"','"+date_voyage+"','"+heure_depart+"','"+listePlaceClient+"','"+destignation_reservation+"','"+frais+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}

public int DernieridDestignation() throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idDestignation from destignationclient;";
        ResultSet resultat=acces.executeSelect(sql);
        int id_max_destignation = 0;
        while(resultat.next())
        {
            if (id_max_destignation <resultat.getInt("idDestignation"))
            {
                id_max_destignation = resultat.getInt("idDestignation");
            }
        }
        return id_max_destignation;
}
public String dernierDestignation(int idDestignation) throws SQLException
{   
        String destignationClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select destignation from destignationclient where idDestignation='"+idDestignation+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            destignationClient = resultat.getString("destignation");
        }
        return destignationClient;
}

public List<ReservationModele> listeReservation()throws SQLException
	{
                List<ReservationModele> list = new ArrayList<ReservationModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT idReservation,username,email,contact,date_voyage,heure_depart,numero_place,destignation_reservation FROM reservation";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {   
                    ReservationModele reservation = new ReservationModele();
                    reservation.setIdReservation(resultat.getInt("idReservation"));
                    reservation.setUsername(resultat.getString("username"));
                    reservation.setEmail(resultat.getString("email"));
                    reservation.setContact(resultat.getString("contact"));
                    reservation.setDate_voyage(resultat.getString("date_voyage"));
                    reservation.setHeure_depart(resultat.getString("heure_depart"));
                    reservation.setNumero_place(resultat.getString("numero_place"));
                    reservation.setDestignation_reservation(resultat.getString("destignation_reservation"));
                    
                    list.add(reservation);
                }
             return list;
        }
public void DeleteReservation(String id)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "DELETE FROM `reservation` WHERE idReservation='"+id+"';";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}

public List<ReservationModele> listeReservationClient(String login)throws SQLException
	{
                List<ReservationModele> list = new ArrayList<ReservationModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT username,date_voyage,heure_depart,numero_place,destignation_reservation FROM reservation WHERE username='"+login+"'";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {   
                    ReservationModele reservation = new ReservationModele();
                    reservation.setUsername(resultat.getString("username"));
                    reservation.setDate_voyage(resultat.getString("date_voyage"));
                    reservation.setHeure_depart(resultat.getString("heure_depart"));
                    reservation.setNumero_place(resultat.getString("numero_place"));
                    reservation.setDestignation_reservation(resultat.getString("destignation_reservation"));
                    
                    list.add(reservation);
                }
             return list;
        }
public int dernierIdReservation() throws SQLException
{   
        
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idReservation from reservation;";
        ResultSet resultat=acces.executeSelect(sql);
        int idReservationMax = 0;
        while(resultat.next())
        {
            if (idReservationMax < resultat.getInt("idReservation")){
                idReservationMax = resultat.getInt("idReservation");
            }
        }
        return idReservationMax;
}

public List<ReservationModele> dernierReservation(int idReservation) throws SQLException {
    List<ReservationModele> liste = new ArrayList<>();
    AccesBdd acces = new AccesBdd();
    acces.loadDriver();
    
    String sql = "select username, email, contact, date_voyage, heure_depart, numero_place, destignation_reservation from reservation where idReservation = '" + idReservation + "';";
    ResultSet resultat = acces.executeSelect(sql);
    
    while (resultat.next()) {
        ReservationModele reservation = new ReservationModele();
        reservation.setUsername(resultat.getString("username"));
        reservation.setEmail(resultat.getString("email"));
        reservation.setContact(resultat.getString("contact"));
        reservation.setDate_voyage(resultat.getString("date_voyage"));
        reservation.setHeure_depart(resultat.getString("heure_depart"));
        reservation.setNumero_place(resultat.getString("numero_place"));
        reservation.setDestignation_reservation(resultat.getString("destignation_reservation"));
       
        liste.add(reservation);
    }
    
    return liste;
}
public List<String> MonPlace(int idPlace) throws SQLException
{   
    List<String> placeClient = new ArrayList<>();
    
    AccesBdd acces = new AccesBdd();
    acces.loadDriver();
    
    String sql = "select clientPlace from clientplace where idClientPlace='" + idPlace + "';";
    ResultSet resultat = acces.executeSelect(sql);
    
    while(resultat.next())
    {
        placeClient.add(resultat.getString("clientPlace"));
    }
    
    return placeClient;
}

public int dernierFrais(int id)throws SQLException{
    int frais = 0;
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "SELECT frais from reservation WHERE idReservation='"+id+"';";
        ResultSet resultat=acces.executeSelect(sql);
        try {
            while(resultat.next())
            {
                frais = resultat.getInt("frais");
            }
        } catch (SQLException ex) {
            System.getLogger(FraisDao.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
        return frais;
}

public int dernierIdFrais() throws SQLException
{   
        
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idReservation from reservation;";
        ResultSet resultat=acces.executeSelect(sql);
        int idReservationMax = 0;
        while(resultat.next())
        {
            if (idReservationMax < resultat.getInt("idReservation")){
                idReservationMax = resultat.getInt("idReservation");
            }
        }
        return idReservationMax;
}

}

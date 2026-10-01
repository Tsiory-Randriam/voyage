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
import models.PlaceModele;

/**
 *
 * @author SUKUNA
 */
public class TestePlaceDao {
public List<PlaceModele> selectionPlace(String heure,String Date,String destignation)throws SQLException
	{
                List<PlaceModele> list = new ArrayList<PlaceModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT Numero_place,statut,heure_voyage_place,date_voyage FROM place_final where heure_voyage_place='"+heure+"' and date_voyage='"+Date+"' and destignationPlace='"+destignation+"'";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    PlaceModele place= new PlaceModele();
                    place.setNumero_place(resultat.getInt("Numero_place"));
                    place.setStatut(resultat.getString("statut"));
                    place.setHeure_voyage_place(resultat.getString("heure_voyage_place"));
                    place.setDate_voyage(resultat.getString("date_voyage"));
                    list.add(place);
                }
             return list;
        }
public void updatePlace(String numero_place,String heure,String date,String destignation){
    AccesBdd acces = new AccesBdd();
    acces.loadDriver();
    String sql = "UPDATE place_final SET statut='Disabled' WHERE Numero_place='"+numero_place+"' and heure_voyage_place='"+heure+"' and date_voyage='"+date+"' and destignationPlace='"+destignation+"'";
    acces.executeUpdate(sql);
}
public void creationPlace(int place,String statut,String heure,String date,String destignation)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO place_final(Numero_place,statut,heure_voyage_place,date_voyage,destignationPlace) VALUES ('"+place+"','"+statut+"','"+heure+"','"+date+"','"+destignation+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
public int compterPlace(String date,String heure,String destignation) throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select * from place_final where date_voyage='"+date+"' and heure_voyage_place='"+heure+"' and destignationPlace='"+destignation+"';";
        ResultSet resultat=acces.executeSelect(sql);
        int total = 0;
        while(resultat.next())
        {
            total = total + 1;
        }
        return total;
}
public int compterPlaceDisponible(String date,String heure) throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select * from place_final where date_voyage='"+date+"' and heure_voyage_place='"+heure+"' and statut='None';";
        ResultSet resultat=acces.executeSelect(sql);
        int total_dispo = 0;
        while(resultat.next())
        {
            total_dispo = total_dispo + 1;
        }
        return total_dispo;
}
public void InsertionPlaceClient(String place)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO clientplace(clientPlace) VALUES ('"+place+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}


   
}

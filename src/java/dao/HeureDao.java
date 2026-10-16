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
import models.HeureModele;
import models.PlaceModele;

/**
 *
 * @author SUKUNA
 */
public class HeureDao {
    
    public void viderHeure()throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "truncate heurereservation;";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
    
public List<HeureModele> selectionHeure()throws SQLException
	{
                List<HeureModele> listeHeure = new ArrayList<HeureModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT heure FROM heure";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    HeureModele heure= new HeureModele();
                    heure.setHeure(resultat.getString("heure"));
                    listeHeure.add(heure);
                }
             return listeHeure;
        }
public void heureReservation(String heure)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO heurereservation(heureReservation) VALUES ('"+heure+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}


}

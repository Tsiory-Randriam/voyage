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
import models.VoyageModele;

/**
 *
 * @author SUKUNA
 */
public class VoyageDao {
public void InsertionVoyage(String date_voyage,String heure_voyage,String destignation)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO voyager(date_Voyage,heure_voyage,destignation) VALUES ('"+date_voyage+"','"+heure_voyage+"','"+destignation+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
	public List<VoyageModele> selectionVoyage()throws SQLException
	{
                List<VoyageModele> list = new ArrayList<VoyageModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT date_voyage,heure_voyage,destignation FROM voyager";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    VoyageModele voyage= new VoyageModele();
                    voyage.setDate_Voyage(resultat.getString("date_voyage"));
                    voyage.setHeure_voyage(resultat.getString("heure_voyage"));
                    voyage.setDestignation(resultat.getString("destignation"));
                   list.add(voyage);
                }
             return list;
        }
}

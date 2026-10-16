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
import models.DateModele;
import models.HeureModele;

/**
 *
 * @author SUKUNA
 */
public class DateDao {
    
public void viderDate()throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "truncate date;";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
public List<DateModele> selectionDate()throws SQLException
	{
                List<DateModele> listeDate = new ArrayList<DateModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT date FROM date";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    DateModele date= new DateModele();
                    date.setDate(resultat.getString("date"));
                    listeDate.add(date);
                }
             return listeDate;
        }
public void creationDate(String date)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO date(date) VALUES ('"+date+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
public void DateReservation(String date)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO date(date) VALUES ('"+date+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}

}

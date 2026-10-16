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

/**
 *
 * @author SUKUNA
 */
public class FraisDao {

    
    public void viderFrais()throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "truncate frais_voyage;";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
    
public void insertionFraisReservation(String frais)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO frais_voyage(frais_reservation) VALUES ('"+frais+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
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


    
}

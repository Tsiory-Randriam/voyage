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
import models.VoyageModele;

/**
 *
 * @author SUKUNA
 */
public class DestignationDao {
    public List<VoyageModele> selectionDestignation()throws SQLException
	{
                List<VoyageModele> listeDestignation = new ArrayList<VoyageModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT destignation,frais_voyage FROM destignation";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    VoyageModele destignation= new VoyageModele();
                    destignation.setDestignation(resultat.getString("destignation"));
                    destignation.setFrais_voyage(resultat.getString("frais_voyage"));
                    listeDestignation.add(destignation);
                }
             return listeDestignation;
        }
public void InsertionDestignation(String destignation,String frais_voyage)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO destignation(destignation,frais_voyage) VALUES ('"+destignation+"','"+frais_voyage+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}
public String selectFrais(String destignation) throws SQLException
{   
        String frais_voyage ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select frais_voyage from destignation where destignation='"+destignation+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            frais_voyage = resultat.getString("frais_voyage");
        }
        return frais_voyage;
}

}

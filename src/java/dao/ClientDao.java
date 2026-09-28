/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import common.AccesBdd;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author SUKUNA
 */
public class ClientDao {
public void InsertionClient(String nom,String email,String contact)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO client(nom,email,contact) VALUES ('"+nom+"','"+email+"','"+contact+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}   
public int DernierReservation() throws SQLException
{
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select idClient from client;";
        ResultSet resultat=acces.executeSelect(sql);
        int id_max_client = 0;
        while(resultat.next())
        {
            if (id_max_client <resultat.getInt("idClient"))
            {
                id_max_client = resultat.getInt("idClient");
            }
        }
        return id_max_client;
}
public String nomClient(int idClient) throws SQLException
{   
        String nomClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select nom from client where idClient='"+idClient+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            nomClient = resultat.getString("nom");
        }
        return nomClient;
}

public String emailClient(int idClient) throws SQLException
{   
        String emailClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select email from client where idClient='"+idClient+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            emailClient = resultat.getString("email");
        }
        return emailClient;
}
public String contactClient(int idClient) throws SQLException
{   
        String contactClient ="";
    	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
        String sql = "select contact from client where idClient='"+idClient+"';";
        ResultSet resultat=acces.executeSelect(sql);
        while(resultat.next())
        {
            contactClient = resultat.getString("contact");
        }
        return contactClient;
}
}

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
public class PlaceDao {
public List<PlaceModele> selectionPlace()throws SQLException
	{
                List<PlaceModele> list = new ArrayList<PlaceModele>();
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT Numero_place,statut_place,heure_voyage_place FROM teste_place";
		ResultSet resultat = acces.executeSelect(sql);
		while(resultat.next())
                {
                    PlaceModele place= new PlaceModele();
                    place.setNumero_place(resultat.getInt("numero_place"));
                    place.setStatut(resultat.getString("statut_place"));
                    place.setHeure_voyage_place(resultat.getString("heure_voyage_place"));
                    list.add(place);
                }
             return list;
        }
public void updatePlace(String numero_place){
    AccesBdd acces = new AccesBdd();
    acces.loadDriver();
    String sql = "UPDATE places SET statut_place='Disabled' WHERE numero_place='"+numero_place+"'";
    acces.executeUpdate(sql);
}
}

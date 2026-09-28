/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author SUKUNA
 */
public class VoyageModele {
	private String date_Voyage;
	private String heure_voyage;
	private String destignation;
	private int id_voyage;
private String frais_voyage;

public String getFrais_voyage() {
	return frais_voyage;
}

public void setFrais_voyage(String frais_voyage) {
	this.frais_voyage = frais_voyage;
}        
	public String getDate_Voyage() {
		return date_Voyage;
	}
	public void setDate_Voyage(String date_Voyage) {
		this.date_Voyage = date_Voyage;
	}
	public String getHeure_voyage() {
		return heure_voyage;
	}
	public void setHeure_voyage(String heure_voyage) {
		this.heure_voyage = heure_voyage;
	}
	public String getDestignation() {
		return destignation;
	}
	public void setDestignation(String destignation) {
		this.destignation = destignation;
	}
	public int getId_voyage() {
		return id_voyage;
	}
	public void setId_voyage(int id_voyage) {
		this.id_voyage = id_voyage;
	} 
}

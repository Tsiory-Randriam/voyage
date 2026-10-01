/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author SUKUNA
 */
public class PlaceModele {
    private String heure_voyage_place; 
    private int numero_place;
    private String statut;
    private String date_voyage;
    private String destignation;
    	public String getDestignation() {
		return destignation;
	}
	public void setDestignation(String destignation) {
		this.destignation = destignation;
	}
	public String getDate_voyage() {
		return date_voyage;
	}
	public void setDate_voyage(String date_voyage) {
		this.date_voyage = date_voyage;
	}
	public int getNumero_place() {
		return numero_place;
	}
	public void setNumero_place(int numero_place) {
		this.numero_place = numero_place;
	}
	public String getHeure_voyage_place() {
		return heure_voyage_place;
	}
	public void setHeure_voyage_place(String heure_voyage_place) {
		this.heure_voyage_place = heure_voyage_place;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut_) {
		this.statut = statut_;
	}
}

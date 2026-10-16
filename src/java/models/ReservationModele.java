/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author SUKUNA
 */
public class ReservationModele {
private int idReservation;
private String username;
private String email;
private String contact;
private String date_voyage;
private String heure_depart;
private String numero_place;
private String destignation_reservation;
private String frais_reservation;
public String getFrais_reservation() {
	return frais_reservation;
}
public void setFrais_reservation(String frais_reservation) {
	this.frais_reservation = frais_reservation;
}
public int getIdReservation() {
	return idReservation;
}
public void setIdReservation(int idReservation) {
	this.idReservation = idReservation;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getDate_voyage() {
	return date_voyage;
}
public void setDate_voyage(String date_voyage) {
	this.date_voyage = date_voyage;
}
public String getHeure_depart() {
	return heure_depart;
}
public void setHeure_depart(String heure_depart) {
	this.heure_depart = heure_depart;
}
public String getNumero_place() {
	return numero_place;
}
public void setNumero_place(String numero_place) {
	this.numero_place = numero_place;
}
public String getDestignation_reservation() {
	return destignation_reservation;
}
public void setDestignation_reservation(String destignation_reservation) {
	this.destignation_reservation = destignation_reservation;
}

}

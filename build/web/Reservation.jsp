<%-- 
    Document   : Reservation
    Created on : 26 sept. 2026, 18:34:15
    Author     : SUKUNA
--%>
<%@page import="models.ClientPlaceModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClientDao"%>
<%@page import="dao.ReservationDao"%>
<%
        ReservationDao reservation = new ReservationDao();
        ClientDao client = new ClientDao();
        int placeReserver = reservation.DernierPlaceReserver();
        int dernierDate = reservation.DernierDateReserver();
        int dernierHeure = reservation.DernierHeureReserver();
        int idClient = client.DernierReservation();
        int idDestignation = reservation.DernieridDestignation();
        String destignation = reservation.dernierDestignation(idDestignation);
        String frais = reservation.selectFrais(destignation);
        String username = client.nomClient(idClient);
        String email = client.emailClient(idClient);
        String contact = client.contactClient(idClient);
        String dateReservation = reservation.DateClient(dernierDate);
        String heureReservation = reservation.HeureClient(dernierHeure);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file='header.jsp' %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation de Réservation - Django Transs</title>
        <!-- FontAwesome pour les icônes -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/reservation.css">
    </head>
    <body>
        <form action="InsertionReservationServlet" method="post">
            <section class="reservation-section">
                <div class="reservation-container">
                    
                    <div class="reservation-header">
                        <h2><i class="fa-solid fa-receipt"></i> Récapitulatif de votre Réservation</h2>
                        <p>Veuillez vérifier vos informations avant de valider.</p>
                    </div>

                    <div class="cards-wrapper">
                        <!-- Première Carte : Infos Client -->
                        <div class="card">
                            <h3><i class="fa-solid fa-user"></i> Informations Client</h3>
                            
                            <div class="mb-3">
                                <label class="form-label">Client Username</label>
                                <input type='text' class='form-control' value='<%= username %>' disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type='email' class='form-control' value='<%= email %>' disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Contact</label>
                                <input type='tel' class='form-control' value='<%= contact %>' disabled>
                            </div>
                        </div>

                        <!-- Deuxième Carte : Infos Voyage & Places -->
                        <div class="card">
                            <h3><i class="fa-solid fa-bus"></i> Détails du Trajet</h3>
                            
                            <div class="mb-3">
                                <label class="form-label">Destination</label>
                                <input type='text' class='form-control' value='<%= destignation %>' disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Date du voyage</label>
                                <input type='date' class='form-control' value='<%= dateReservation %>' disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Heure du départ</label>
                                <input type='text' class='form-control' value='<%= heureReservation %>' disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mes places réservées</label>
                                <div class="places-badges">
                                    <%
                                        List<ClientPlaceModele> listePlace = reservation.PlaceClient(username);
                                        for(ClientPlaceModele MesPlace : listePlace){
                                            out.println("<span class='badge-place'>" + MesPlace.getClientPlace() + "</span>");
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Frais Total</label>
                                <input type='text' class='form-control price-highlight' value='<%= frais %> Ar' disabled>
                            </div>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-check-circle"></i> Valider mon Réservation
                        </button>
                    </div>

                </div>
            </section>
        </form>
    </body>
</html>
<%@ include file='footer.jsp' %>
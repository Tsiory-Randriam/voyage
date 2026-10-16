<%-- 
    Document   : TestePlace
    Created on : 22 sept. 2026, 07:13:52
    Author     : SUKUNA
--%>
<%@page import="dao.DestignationDao"%>
<%@page import="java.util.Date"%>
<%@page import="models.PlaceModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestePlaceDao"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file='header.jsp' %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sélection des Places - Django Transs</title>
    <link rel="stylesheet" href="css/place.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%
    TestePlaceDao placeDao = new TestePlaceDao();
    DestignationDao destignerDao = new DestignationDao();
    
    String destignation = request.getParameter("destignation");
    String heure = request.getParameter("heure");
    String date = request.getParameter("date");
    int total = placeDao.compterPlace(date, heure, destignation);
    String frais = destignerDao.selectFrais(destignation);
    int nombre_place = placeDao.compterPlaceDisponible(date, heure, destignation);
    
    List<PlaceModele> listePlace = placeDao.selectionPlace(heure, date, destignation);
%>

<main class="booking-wrapper">
    <% if(total == 0) { %>
        <div class="alert-error">Pas de voyage disponible pour le moment.</div>
    <% } else { %>

    <form action="TesteInsertionPlaceServlet" method="post" class="booking-form-container">
        
        <div class="booking-grid">
            
            <!-- Colonne 1 : Schéma des places du bus -->
            <div class="card-section seat-selection-card">
                <h3><i class="fa-solid fa-bus"></i> Choix des Sièges</h3>
                <div class="bus-layout">
                    <div class="driver-indicator"><i class="fa-solid fa-steering-wheel"></i> Avant du Bus</div>
                    <div class="place-grid">
                        <%
                            int i = 0;
                            for (PlaceModele place : listePlace) {
                                i = i + 1;
                                boolean isOccupied = place.getStatut() != null && place.getStatut().contains("disabled");
                        %>
                            <label class="seat-item <%= isOccupied ? "occupied" : "" %>">
                                <input type="checkbox" value="<%= place.getNumero_place() %>" <%= place.getStatut() %> name="<%= i %>">
                                <span class="seat-badge"><%= place.getNumero_place() %></span>
                            </label>
                        <% } %>
                    </div>
                </div>
                <div class="seat-counter">
                    Places disponibles : <strong><%= nombre_place %> / <%= total %></strong>
                </div>
            </div>

            <!-- Colonne 2 : Détails du Voyage -->
            <div class="card-section trip-info-card">
                <h3><i class="fa-solid fa-ticket"></i> Détails du Trajet</h3>
                
                <div class="input-group">
                    <label>Heure de départ</label>
                    <input type="text" name="heure" value="<%= heure %>" readonly>
                </div>
                <div class="input-group">
                    <label>Date du voyage</label>
                    <input type="text" name="date" value="<%= date %>" readonly>
                </div>
                <div class="input-group">
                    <label>Destination</label>
                    <input type="text" name="destignation" value="<%= destignation %>" readonly>
                </div>
                <div class="input-group">
                    <label>Frais (Ar)/ Place</label>
                    <input type="text" name="frais" value="<%= frais %>" readonly>
                </div>
                <div class="input-group">
                    <label>Nombre Total</label>
                    <input type="text" name="total" value="<%= total %>" readonly>
                </div>
            </div>

            <!-- Colonne 3 : Informations Client -->
            <div class="card-section client-info-card">
                <h3><i class="fa-solid fa-user-shield"></i> Vos Coordonnées</h3>
                
                <div class="input-group">
                    <label>Nom complet</label>
                    <input type="text" name="username" placeholder="Entrez votre nom" required>
                </div>
                <div class="input-group">
                    <label>Téléphone / Contact</label>
                    <input type="number" name="contact" placeholder="034 XX XXX XX" required>
                </div>
                <div class="input-group">
                    <label>Adresse Email</label>
                    <input type="email" name="email" placeholder="votre@email.com">
                </div>

                <button type="submit" class="btn-validate">
                    <i class="fa-solid fa-check"></i> Valider ma Réservation
                </button>
            </div>

        </div>

    </form>
    <% } %>
</main>

</body>
</html>
<%@ include file='footer.jsp' %>
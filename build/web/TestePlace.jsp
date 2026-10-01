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
<style>
    body {
        background: var(--card);
    }
</style>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sélection des Places - Django Transs</title>
    <link rel="stylesheet" href="css/place.css">
    <!-- FontAwesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%
    TestePlaceDao placeDao = new TestePlaceDao();
    DestignationDao destignerDao = new DestignationDao();
    
    String destignation = request.getParameter("destignation");
    String heure = request.getParameter("heure");
    String date = request.getParameter("date");
    int total = placeDao.compterPlace(date, heure,destignation);
    String frais = destignerDao.selectFrais(destignation);
    int nombre_place = placeDao.compterPlaceDisponible(date, heure);
%>

<section class="booking-section">
    <form action="TesteInsertionPlaceServlet" method="post" class="booking-form">
        
        <% if (total == 0) { %>
            <div class="error-card">
                <i class="fa-solid fa-triangle-exclamation"></i>
                <p id="erreur">Pas de voyage disponible pour le moment (<%= date %> à <%= heure %>)</p>
            </div>
        <% } else { 
            List<PlaceModele> liste = placeDao.selectionPlace(heure, date, destignation);
        %>

        <div class="booking-container">
            
            <!-- Carte du Trajet & Disposition du Bus -->
            <div class="bus-card">
                <div class="badge-premium">
                    <i class="fa-solid fa-crown"></i> PREMIUM
                </div>

                <!-- En-tête de la carte : Départ et Prix -->
                <div class="bus-header">
                    <div class="time-badge">
                        <i class="fa-regular fa-clock"></i> Départ à <strong><%= heure %></strong>
                    </div>
                    <div class="price-badge">
                        <span><%= (frais != null) ? frais : "0" %> Ar</span>
                    </div>
                </div>

                <!-- Informations de Trajet -->
                <div class="route-details">
                    <div class="route-point">
                        <span class="city-name">Antsirabe</span>
                        <span class="city-code">ATJ</span>
                    </div>
                    <div class="route-arrow">
                        <i class="fa-solid fa-arrow-right-long"></i>
                    </div>
                    <div class="route-point">
                        <span class="city-name"><%= (destignation != null) ? destignation : "Destination" %></span>
                        <span class="city-code">DEST</span>
                    </div>
                </div>

                <div class="trip-info">
                    <i class="fa-solid fa-calendar-day"></i> <%= date %>
                </div>

                <!-- Légende des Sièges -->
                <div class="seat-legend">
                    <div class="legend-item">
                        <span class="dot dispo"></span> Disponible
                    </div>
                    <div class="legend-item">
                        <span class="dot selectionne"></span> Sélectionné
                    </div>
                    <div class="legend-item">
                        <span class="dot occupe"></span> Occupé
                    </div>
                </div>

                <!-- Intérieur du Bus / Plan des Sièges -->
                <div class="bus-interior">
                    <div class="driver-row">
                        <span class="driver-icon" title="Conducteur"><i class="fa-solid fa-user-gear"></i> Volant</span>
                    </div>

                    <div class="seats-grid">
                        <% for (PlaceModele p : liste) { 
                            boolean isOccupied = p.getStatut() != null && p.getStatut().contains("disabled");
                        %>
                            <label class="seat-item <%= isOccupied ? "occupied" : "" %>">
                                <input type="checkbox" name="place" value="<%= p.getNumero_place() %>" <%= p.getStatut() %>>
                                <span class="seat-box">
                                    <i class="fa-solid fa-couch"></i>
                                    <span class="seat-number"><%= p.getNumero_place() %></span>
                                </span>
                            </label>
                        <% } %>
                    </div>
                </div>

                <div class="available-info">
                    <i class="fa-solid fa-bus"></i> <strong><%= nombre_place %></strong> places disponibles sur ce trajet
                </div>

                <!-- Champs cachés transmis au Servlet -->
                <input type="hidden" name="heure" value="<%= heure %>">
                <input type="hidden" name="date" value="<%= date %>">
                <input type="hidden" name="destignation" value="<%= destignation %>">
                <input type="hidden" name="frais_voyage" value="<%= frais %>">
            </div>

            <!-- Carte Panier / Récapitulatif à droite -->
            <div class="cart-summary-card">
                <h2><i class="fa-solid fa-ticket"></i> Récapitulatif</h2>
                
                <div class="summary-details">
                    <div class="summary-row">
                        <span><i class="fa-solid fa-location-dot"></i> Destination</span>
                        <strong><%= destignation %></strong>
                    </div>
                    <div class="summary-row">
                        <span><i class="fa-regular fa-calendar"></i> Date</span>
                        <strong><%= date %></strong>
                    </div>
                    <div class="summary-row">
                        <span><i class="fa-regular fa-clock"></i> Heure</span>
                        <strong><%= heure %></strong>
                    </div>
                    <div class="summary-row">
                        <span><i class="fa-solid fa-money-bill-wave"></i> Tarif / place</span>
                        <strong><%= frais %> Ar</strong>
                    </div>
                </div>

                <hr class="divider">

                <div class="summary-total">
                    <span>Places libres</span>
                    <span class="badge-count"><%= nombre_place %></span>
                </div>

                <div class="btn-container">
                    <button type="submit" class="btn-submit">
                        <i class="fa-solid fa-check-circle"></i> Valider Mon Choix
                    </button>
                </div>
            </div>

        </div>

        <% } %>

    </form>
</section>

</body>
</html>

<%@ include file='footer.jsp' %>
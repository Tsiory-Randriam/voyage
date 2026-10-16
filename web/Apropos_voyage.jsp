<%-- 
    Document   : index.jsp
    Created on : 20 sept. 2026, 13:40:12
    Author     : SUKUNA
--%>
<%@ include file='header.jsp' %>
<%@page import="dao.DestignationDao"%>
<%@page import="models.DateModele"%>
<%@page import="dao.DateDao"%>
<%@page import="models.HeureModele"%>
<%@page import="dao.HeureDao"%>
<%@page import="models.VoyageModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VoyageDao"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Réservation de Voyage - Django Transs</title>
        <!-- FontAwesome pour les icônes -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <style>
            :root {
                --primary: #2563eb;
                --primary-hover: #1d4ed8;
                --card-bg: var(--card, #ffffff);
                --text-color: var(--text, #1e293b);
                --border-color: #cbd5e1;
            }

            body {
                background-color: #f8fafc;
                font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
                color: var(--text-color);
                margin: 0;
            }

            /* Section principale en mode carte centrée */
            section {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 55vh;
                padding: 20px;
            }

            .search-card {
                background: var(--card-bg);
                border: 1px solid var(--border-color);
                border-radius: 24px;
                box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.08);
                padding: 40px;
                width: 100%;
                max-width: 950px;
            }

            .search-title {
                font-size: 1.5rem;
                font-weight: 800;
                color: var(--text-color);
                margin-bottom: 25px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .search-title span {
                color: var(--primary);
            }

            /* Grille du formulaire */
            .formulaire {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr auto;
                gap: 20px;
                align-items: end;
            }

            @media (max-width: 850px) {
                .formulaire {
                    grid-template-columns: 1fr;
                }
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-group label {
                font-size: 0.85rem;
                font-weight: 700;
                color: #64748b;
                display: flex;
                align-items: center;
                gap: 6px;
            }

            /* Champs de saisie et sélecteurs modernes */
            #date input, 
            #heure select, 
            #destignation select {
                background: var(--card-bg);
                color: var(--text-color);
                width: 100%;
                padding: 12px 16px;
                border-radius: 12px;
                border: 1px solid var(--border-color);
                font-size: 0.95rem;
                box-sizing: border-box;
                transition: all 0.2s ease;
            }

            #date input:focus, 
            #heure select:focus, 
            #destignation select:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
            }

            /* Bouton de recherche élégant */
            .btn button {
                background: var(--primary);
                color: #ffffff;
                border: none;
                padding: 13px 30px;
                border-radius: 12px;
                font-size: 1rem;
                font-weight: 700;
                cursor: pointer;
                transition: background 0.2s, transform 0.1s;
                height: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                width: 100%;
            }

            .btn button:hover {
                background: var(--primary-hover);
                transform: translateY(-1px);
            }

            option {
                padding: 12px;
                background: var(--card-bg);
                color: var(--text-color);
            }
        </style>
    </head>
    <body>
        <form action="TestePlaceServlet" method="post">
            <section>
                <div class="search-card">
                    <h3 class="search-title">
                        <i class="fa-solid fa-bus-side"></i> Rechercher un <span>Voyage</span>
                    </h3>
                    
                    <div class="formulaire">

                        <!-- Sélection Destination -->
                        <div class="form-group" id="destignation">
                            <label><i class="fa-solid fa-location-dot"></i> Destination & Tarif</label>
                            <%
                                DestignationDao destignation = new DestignationDao();
                                List<VoyageModele> listeDestignation = destignation.selectionDestignation();
                            %>
                            <select name="destignation">
                                <% 
                                    for (VoyageModele voyager : listeDestignation) {
                                        out.println("<option value='" + voyager.getDestignation() + "'>" + voyager.getDestignation() + "  " + voyager.getFrais_voyage() + " Ar</option>");
                                    }
                                %>
                            </select>
                        </div>
         
                        <!-- Sélection Date -->
                        <div class="form-group" id="date">
                            <label><i class="fa-regular fa-calendar"></i> Date du voyage</label>
                            <input type="date" name="date" id="date_">
                        </div>

                        <!-- Sélection Heure -->
                        <div class="form-group" id="heure">
                            <label><i class="fa-regular fa-clock"></i> Heure de départ</label>
                            <%
                                HeureDao heure = new HeureDao();
                                List<HeureModele> listeHeure = heure.selectionHeure();
                            %>
                            <select name="heure">
                                <% 
                                    for (HeureModele voyager : listeHeure) {
                                        out.println("<option value='" + voyager.getHeure() + "'>" + voyager.getHeure() + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <!-- Bouton de Soumission -->
                        <div class="form-group btn"> 
                            <label>&nbsp;</label>
                            <button type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i> Rechercher
                            </button>
                        </div>

                    </div>
                </div>
            </section>
        </form>
    </body>
</html>
<%@ include file='footer.jsp' %>

<script>
    let today = new Date();
    let minDate = today.toISOString().split("T")[0];
    let max = new Date();
    max.setDate(today.getDate() + 5);
    let maxDate = max.toISOString().split("T")[0];
    let input = document.getElementById("date_");
    input.setAttribute("min", minDate);
    input.setAttribute("max", maxDate);
</script>
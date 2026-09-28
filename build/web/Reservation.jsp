<%-- 
    Document   : Reservation
    Created on : 26 sept. 2026, 18:34:15
    Author     : SUKUNA
--%>
<%@page import="dao.ClientDao"%>
<%@page import="dao.ReservationDao"%>
<%
        ReservationDao reservation = new ReservationDao();
        ClientDao client = new ClientDao();
            int placeReserver = reservation.DernierPlaceReserver();
            int dernierDate = reservation.DernierDateReserver();
            int dernierHeure = reservation.DernierHeureReserver();
            int idClient = client.DernierReservation();
            String username = client.nomClient(idClient);
            String email = client.emailClient(idClient);
            String contact = client.contactClient(idClient);
            String numeroPlace = reservation.PlaceClient(placeReserver);
            String dateReservation = reservation.DateClient(dernierDate);
            String heureReservation = reservation.HeureClient(dernierHeure);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file='header.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation</title>
    </head>
    <body>
        <form action="InsertionReservationServlet" method="post">
                    <section style="height: 100vh;display: flex;justify-content: center;align-items: center;">
                        <div class="card">
                        <form>
                            <div class="mb-3">
                                <label class="form-label">Client Username</label>
                                <% out.println("<input type='text'  class='form-control' id='exampleInputPassword1' value='"+username+"' disabled>"); %>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <% out.println("<input type='email'  class='form-control' id='exampleInputPassword1' value='"+email+"' disabled>"); %>
                                
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Contact</label>
                                <% out.println("<input type='tel'  class='form-control' id='exampleInputPassword1' value='"+contact+"' disabled>"); %>
                            </div>
                        <form>
                            </div>
                            <div class="card">
                            <div class="mb-3">
                                <label class="form-label"> Date du voyage </label>
                                <% out.println("<input type='date'  class='form-control' id='exampleInputPassword1' value='"+dateReservation+"' disabled>"); %>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"> heure du depart </label>
                                <% out.println("<input type='text'  class='form-control' id='exampleInputPassword1' value='"+heureReservation+"' disabled>"); %>
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Numero de place
                                </label>
                                <% out.println("<input type='text'  class='form-control' id='exampleInputPassword1' value='"+numeroPlace+"' disabled>"); %>
                            </div>
                            </div>
                            

                        </div>
                        
                    </section>
                    <div class="btn" style="width: 100%;">
                        <button type="submit" style="width: 60%;" class="btn btn-primary">Valider mon Reservation</button>
                    </div>
        </form>
    </body>
</html>
            <style>
                .card {
                    color: var(--text);
                    width: 30%;
                    background: transparent;
                    border: 1px solid transparent;
                }
                .mb-3 input {
                    color: black;
                    padding: 1rem 0px 1rem 0px;
                    border-radius: 20px;
                    border: 1px solid var(--text);

                }
                .mb-3 label {
                    font-size: 14px;
                }
                section {
                    flex-wrap: wrap;
                    gap: 12px;
                }
            </style>
<%@ include file='footer.jsp' %>
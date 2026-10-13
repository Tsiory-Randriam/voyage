<%@page import="models.ReservationModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReservationDao"%>
<%@include file="headerAdmin.jsp" %>
<%
            ReservationDao reservation = new ReservationDao();
            List<ReservationModele> listeReservation = new ArrayList<ReservationModele>();
            listeReservation = reservation.listeReservationClient(login);

%>
<link rel="stylesheet" href="css/dashboard.css">
<div class="table-container">
  <table class="modern-table">
    <thead>
      <tr>
        <th scope="col">Nom d'utilisateur</th>
        <th scope="col">Date de voyage</th>
        <th scope="col">Heure de départ</th>
        <th scope="col">N° Place</th>
        <th scope="col">Destination</th>
        <th scope="col" class="text-center">Action</th>
      </tr>
    </thead>
    <tbody>
    <%
        for (ReservationModele voyager : listeReservation) {
    %>
      <tr>
        <td class="fw-bold"><%= voyager.getUsername() %></td>
        <td><span class="badge date-badge"><%= voyager.getDate_voyage() %></span></td>
        <td><%= voyager.getHeure_depart() %></td>
        <td><span class="badge place-badge"><%= voyager.getUsername() %></span></td>
        <td><%= voyager.getDestignation_reservation() %></td>
        <td class="text-center">
            <a href="${pageContext.request.contextPath}/DeleteReservation?id=<%= voyager.getIdReservation() %>" class="btn-delete" title="Supprimer">
            Telecharger
          </a>
        </td>
      </tr>
    <%
        }
    %>
    </tbody>
  </table>
</div>



<%@include file="footer.jsp" %>
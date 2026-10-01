<%@page import="models.ReservationModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReservationDao"%>
<%@include file="headerAdmin.jsp" %>
<%
            ReservationDao reservation = new ReservationDao();
            List<ReservationModele> listeReservation = new ArrayList<ReservationModele>();
            listeReservation = reservation.listeReservation();

%>
<table style="width: 100%;">
    <thead style="background: blueviolet;width:100%;padding: 20px 0px 20px 0px;border-radius:20px">
        <tr style="padding: 20px 0px 20px 0px;">
      <th scope="col">idReservation</th>
      <th scope="col">Username</th>
      <th scope="col">email</th>
      <th scope="col">contact</th>
       <th scope="col">date_voyage</th>
      <th scope="col">heure de depart</th>
      <th scope="col">numero place</th>
      <th scope="col">destignation</th>
      <th scope="col">Supprimer</th>
    </tr>
  </thead>

    <%
        for (ReservationModele voyager :listeReservation)
        {
            out.println("<tbody>");
            out.println("<tr>");
            out.println("<td>"+voyager.getIdReservation()+"</td>");
            out.println("<td>"+voyager.getUsername()+"</td>");
            out.println("<td>"+voyager.getEmail()+"</td>");
            out.println("<td>"+voyager.getContact()+"</td>");
            out.println("<td>"+voyager.getDate_voyage()+"</td>");
            out.println("<td>"+voyager.getHeure_depart()+"</td>");
            out.println("<td>"+voyager.getNumero_place()+"</td>");
            out.println("<td>"+voyager.getDestignation_reservation()+"</td>");
            out.println("<td> Supprimer </td>");
            out.println("</tbody>");
            out.println("</tr>");
        }
    %>
</table>




<%@include file="footer.jsp" %>
<%-- 
    Document   : index
    Created on : 21 sept. 2026, 13:04:25
    Author     : SUKUNA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <!--
    form action="TestePlace.jsp" method="post">
        <h1>Accueil</h1>
        Heure depart <br>
        <select name="heure" id=""><br>
            <option value="08 h">08 h : 00</option>
            <option value="10 h">10 h : 00</option>
            <option value="02 h">02 h : 00</option>
        </select>
        <button>Reserver Maintenant</button>
    </form>
    -->
    </body>
    <a href="AjoutVoyage.jsp">Ajouter voyage</a>
    <form action="DateServlet">
        Reservation <br>
        <button>CommencerReservation</button>
    </form>
</html>

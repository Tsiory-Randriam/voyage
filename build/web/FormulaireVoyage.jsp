<%-- 
    Document   : FormulaireVoyage
    Created on : 21 sept. 2026, 13:39:30
    Author     : SUKUNA
--%>

<%@page import="models.VoyageModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VoyageDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="InsertionTempServlet" method="post">
     
        <h1>Choisir votre date heure et destignation</h1>
<%
            VoyageDao voyage = new VoyageDao();
            List<VoyageModele> liste = new ArrayList<VoyageModele>();
            liste = voyage.selectionVoyage();
%>
<select name="temps" id="">
<%                
           for (VoyageModele voyager :liste)
            {
                out.println("<option value='"+voyager.getDate_Voyage()+" - "+voyager.getHeure_voyage()+" - "+voyager.getDate_Voyage()+"'>'"+voyager.getDate_Voyage()+" - "+voyager.getHeure_voyage()+" - "+voyager.getDate_Voyage()+"'</option>");
            }
%>
</select>
<button>Valider</button>
</form>
    </body>
</html>

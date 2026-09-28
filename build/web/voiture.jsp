<%-- 
    Document   : index.jsp
    Created on : 20 sept. 2026, 13:40:12
    Author     : SUKUNA
--%>

<%@page import="java.util.List"%>
<%@page import="models.PlaceModele"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PlaceDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                
            }
        </style>
    </head>
    <body>
        <form action="PlaceServlet" method="post">
            <section>
                <h2>Choisir votre Place</h2>
<% 
            PlaceDao place = new PlaceDao();
            List<PlaceModele> liste = new ArrayList<PlaceModele>();
            liste =place.selectionPlace();
%>                
                <div class="place">
<%          int n = 1;
            for (PlaceModele placed :liste)
            {
                out.print(""+placed.getNumero_place()+"");
                out.println("<input type='checkbox' name='place' value='"+placed.getNumero_place()+"' "+placed.getStatut()+">");
                //out.println("<br>");
                if (n%2 == 0){
                    out.println("<br>");
                }
                n = n + 1;
            }     
%>   
                </div>   
                <button>Valider</button>
            </section>
        </form>
    </body>
</html>

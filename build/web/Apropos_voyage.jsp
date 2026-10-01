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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            section {
                display: flex;
                height: 40vh;
            }
            .formulaire {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80%;
                gap:15px;flex-wrap:wrap;
            }
            #date input {
                background: var(--card);
                color: var(--text);
                margin: 0px 20px 0px 20px;
                padding: 1rem 3rem 1rem 3rem;
                border-radius: 20px;
                border:0.1px solid var(--text) ;
            }
            #heure select ,#destignation select{
                background: var(--card);
                color: var(--text);
                margin: 0px 20px 0px 20px;
                padding: 1rem 3rem 1rem 3rem;
                border-radius: 20px;
            }
            .btn button {
                background: var(--card);
                color: var(--text);
                margin: 0px 20px 0px 20px;
                padding: 1rem 3rem 1rem 3rem;
                border-radius: 20px;
            }
            option {
                padding: 10px 0px 10px 0px;
                background: transparent;
                border: 1px solid transparent;
            }
        </style>
    </head>
    <body>
        <form action="TestePlaceServlet" method="post">
            <section>
                <div class="container">
                   <h3 style="font-family: 'Island-Moment',cursive;color: rgb(133, 133, 162);">Ajout v<span style="color: rgb(141, 88, 88);">oyag</span>e</h3>
                    <div class="formulaire">

    <div id="destignation">
<%

            DestignationDao destignation = new DestignationDao();
            List<VoyageModele> listeDestignation = new ArrayList<VoyageModele>();
            listeDestignation = destignation.selectionDestignation();
            
%>
Destignation <br>
<select name="destignation" id="">
<%                
            for (VoyageModele voyager :listeDestignation)
           {
                out.println("<option value='"+voyager.getDestignation()+"'>"+voyager.getDestignation()+" Frais "+voyager.getFrais_voyage()+"    Ar</option>");
            }
%>
</select>
</div>
 
    <div id="date">
        <input type="date" name="date" id="date_">
    </div>
    <div id="heure">
<%
            HeureDao heure = new HeureDao();
            List<HeureModele> listeHeure = new ArrayList<HeureModele>();
            listeHeure = heure.selectionHeure();
            
%>

<select name="heure" id="">
<%                
            for (HeureModele voyager :listeHeure)
            {
                out.println("<option value='"+voyager.getHeure()+"'>Heure de depart : "+voyager.getHeure()+"</option>");
            }
%>
</select>
    </div>
<div class="btn">    
     <button class="btn btn-primary">Rechercher</button>
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
  max.setDate(today.getDate() +5);
  let maxDate = max.toISOString().split("T")[0];
  let input = document.getElementById("date_");
  input.setAttribute("min",minDate);
  input.setAttribute("max",maxDate);
</script>
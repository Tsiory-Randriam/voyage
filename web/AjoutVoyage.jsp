<%-- 
    Document   : index.jsp
    Created on : 20 sept. 2026, 13:40:12
    Author     : SUKUNA
--%>
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
        <a href=""></a>
        <form action="VoyageServlet" method="post">
            <section>
                   <h3>Ajout voyage</h3>
                   <div class="date">
                        <label>Date du voyage</label>
                        <input type="date" name="date" required>
                   </div>
                   <div class="heure_voyage">
                        <label>Heure depart voyage</label>
                        <select name="heure" id="">
                            <option value="08 h">08h : 00</option>
                            <option value="10 h">10h : 00</option>
                            <option value="02 h">02h : 00</option>
                        </select>
                   </div>
                   <div class="destignation">
                        <label>Ajouter Destignation </label>
                        <input type="text" name="destignation" required>
                   </div>
                    <div class="frais_voyage">
                        <label>Frais du voyage </label>
                        <input type="text" name="frais_voyage" required>
                   </div>
                <button>Valider</button>
            </section>
        </form>
    </body>
</html>

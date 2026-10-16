<%-- 
    Document   : recu
    Created on : 13 oct. 2026, 08:04:37
    Author     : SUKUNA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file='HeaderClient.jsp' %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Télécharger votre reçu - Django Transs</title>
        <!-- FontAwesome pour les icônes -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/recu.css">
    </head>
    <body>
        <section class="receipt-section">
            <div class="receipt-card">
                <div class="receipt-icon">
                    <i class="fa-solid fa-file-invoice-dollar"></i>
                </div>
                <h2>Votre Reçu de Réservation</h2>
                <p>Votre réservation a été enregistrée avec succès. Cliquez ci-dessous pour télécharger votre reçu officiel au format PDF.</p>
                
                <form action="RecuServlet" method="post">
                    <button type="submit" class="btn-download">
                        <i class="fa-solid fa-download"></i> Télécharger mon reçu
                    </button>
                </form>
            </div>
        </section>
    </body>
</html>
<%@ include file='footer.jsp' %>
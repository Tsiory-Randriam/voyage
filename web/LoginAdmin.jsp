<%-- 
    Document   : LoginAdmin
    Created on : 13 oct. 2026
    Author     : SUKUNA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file='header.jsp' %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion Administrateur - Django Transs</title>
        <!-- FontAwesome pour les icônes -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <section class="login-section">
            <div class="login-card">
                <form action="VerificationAdminServlet" method="post">
                    
                    <div class="login-header">
                        <h3><i class="fa-solid fa-shield-halved"></i> Connexion Admin</h3>
                        <p>Veuillez entrer vos identifiants administrateur</p>
                    </div>

                    <div class="login-body">
                        <div class="mb-3">
                            <label for="loginInput" class="form-label">
                                <i class="fa fa-user"></i> Login
                            </label>
                            <input type="text" class="form-control" id="loginInput" placeholder="Ex: JOHN doe" name="login" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="passwordInput" class="form-label">
                                <i class="fa fa-lock"></i> Mot de passe
                            </label>
                            <input type="password" class="form-control" id="passwordInput" placeholder="••••••••" name="password" required>
                        </div>
                    </div>

                    <div class="login-footer">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-right-to-bracket"></i> Se connecter
                        </button>
                    </div>

                </form>
            </div>
        </section>
    </body>
</html>
<%@ include file='footer.jsp' %>
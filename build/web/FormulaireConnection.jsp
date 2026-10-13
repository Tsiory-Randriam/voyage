<%@ include file='header.jsp' %>
<div class="container" style="display: flex;justify-content:center;align-items:center;height:50vh"> 
<div class="card" style="width: 20rem;background: transparent">
  <form action="ConnexionServlet" method="post">
    <div class="card-header" style="display: flex;justify-content:center;align-items:center">
        <h3 style="color: var(--text);"><i class="fa-solid fa-check"></i>Connexion</h3>
    </div>
  <div class="card-body">
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput" class="form-label"> <i class="fa fa-user"></i>Login </label>
        <input style="color: var(--text);background:var(--card)" type="text" class="form-control" id="formGroupExampleInput" placeholder="JOHN doe" name="login">
    </div>
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput2" class="form-label"><i class="fa fa-lock"></i> password </label>
        <input style="color: var(--text);background:var(--card)" type="password" class="form-control" id="formGroupExampleInput2" name="password">
    </div>
  </div>
  <div class="card-footer">
    <button type="submit" class="btn btn-primary" style="width: 100%;">Connecter</button>
  </div>
  </form>
</div>
</div>
<%@ include file='footer.jsp' %>
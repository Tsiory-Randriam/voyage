<%@include file="headerAdmin.jsp" %>
<div class="container" style="display: flex;justify-content:center;align-items:center;height:50vh"> 
<div class="card" style="width: 20rem;background: transparent">
  <form action="InsertionDestignationServlet" method="post">
    <div class="card-header" style="display: flex;justify-content:center;align-items:center">
        <h3 style="color: var(--text);"><i class="fa-solid fa-plus"></i>New Destignation</h3>
    </div>
  <div class="card-body">
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput" class="form-label"> <i class="fa fa-location"></i>Destignation </label>
        <input style="color: var(--text);background:var(--card)" type="text" class="form-control" id="formGroupExampleInput" placeholder="Antananarivo" name="destignation" required>
    </div>
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput2" class="form-label"><i class="fa fa-money"></i> Frais voyage </label>
        <input style="color: var(--text);background:var(--card)" type="texte" class="form-control" id="formGroupExampleInput2" name="frais_voyage" required>
    </div>
  </div>
  <div class="card-footer">
    <button type="submit" class="btn btn-primary" style="width: 100%;">Connecter</button>
  </div>
  </form>
</div>
</div>
<%@include file="footer.jsp" %>
<%@page import="models.VoyageModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DestignationDao"%>
<%

            DestignationDao destignation = new DestignationDao();
            List<VoyageModele> listeDestignation = new ArrayList<VoyageModele>();
            listeDestignation = destignation.selectionDestignation();
            

%>
<%@include file="headerAdmin.jsp" %>
<div class="container" style="display: flex;justify-content:center;align-items:center;height:50vh"> 
<div class="card" style="width: 20rem;background: transparent">
  <form action="VoyageServlet" method="post">
    <div class="card-header" style="display: flex;justify-content:center;align-items:center">
        <h3 style="color: var(--text);"><i class="fa-solid fa-plus"></i>New Destignation</h3>
    </div>
  <div class="card-body">
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput" class="form-label"> <i class="fa fa-location"></i>Destignation </label>
        <select name="destignation">
<%                
            for (VoyageModele voyager :listeDestignation)
           {
                out.println("<option value='"+voyager.getDestignation()+"'>"+voyager.getDestignation()+"</option>");
            }
%>
        </select>
        
    </div>
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput2" class="form-label"><i class="fa fa-money"></i> Heure de depart </label>
        <select name="heure">
            <option value="08 h">08h 00</option>
            <option value="10 h">10h 00</option>
            <option value="02 h">02h 00</option>
        </select>
    </div>
    <div class="mb-3">
        <label style="color: var(--text);" for="formGroupExampleInput2" class="form-label"><i class="fa fa-money"></i> Heure de depart </label>
        <input type="date" name="date" id="date" required>
    </div>
  </div>
  <div class="card-footer">
    <button type="submit" class="btn btn-primary" style="width: 100%;">Connecter</button>
  </div>
  </form>
</div>
</div>
<%@include file="footer.jsp" %>
<script>
    
  let today = new Date();
  let minDate = today.toISOString().split("T")[0];
  let max = new Date();
  max.setDate(today.getDate() +5);
  let maxDate = max.toISOString().split("T")[0];
  let input = document.getElementById("date");
  input.setAttribute("min",minDate);
  input.setAttribute("max",maxDate);
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>    
    
   <%
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
   	String ruolo = (String) session.getAttribute("ruolo");
   	if(ruolo == null){
		response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
	} else if(ruolo.equals("cliente")){
		response.sendRedirect(request.getContextPath() + "/CatalogoGadget.jsp");
	}
   	
   	ProdottoFisicoDS prodDS = new ProdottoFisicoDS(ds);
	Collection<ProdottoFisicoBean> colProd = prodDS.doRetrieveAll(null);
	Videogioco vidDS = new VideogiocoDS(ds);
	Collection<VideogiocoBean> colVid = vidDS.doRetrieveAll(null);
	SoftwareHouse softDS = new SoftwareHouseDS(ds);
	Collection<SoftwareHouseBean> collSoft = softDS.doRetrieveAll(null);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/style.css" rel="stylesheet">
<script src="script/jquery-3.6.0.min.js"></script>
<title>Modifica Catalogo</title>

<script>
$(document).ready(function () {
	$("#tipo").change(function () {
		$.ajax({url:"", success: function(){
			var selectedSubject = $("#tipo option:selected").val()
			if(selectedSubject == "videogioco"){
				$("#videogSel").css("display", "inline");
				$("#prodSel").css("display", "none");
				$("#submit").css("display", "inline");
				$("#dati").html("");
			}else if(selectedSubject == "prodotto"){
				
				$("#prodSel").css("display", "inline");
				$("#videogSel").css("display", "none");
				$("#submit").css("display", "inline");
				$("#dati").html("");
			}else{

				$("#pagina").html("<div id = 'pagina'>"
								+ "</div>");
				$("#prodSel").css("display", "none");
				$("#videogSel").css("display", "none");
				$("#submit").css("display", "none");
				$("#dati").html("");
			}
		}});
		
	});
	
	$("#videogSelect").change(function () {
		$.ajax({url:"", success: function(){
			var selectedSubject = $("#videogSelect option:selected").val();
			
			$("#dati").html("<div class='row'>"
						+"<div class='col-md-6 mb-3'>"
							+ "<label for='nome-vid'>Nome: </label>"
							+ "<input type='text' class='form-control'  id='nome-vid' name='nome-vid' required>"
						+ "</div>"
						
					+ "</div>"
					+ "<div class='row'>"
						+ "<div class='col-md-6 mb-3'>"
							+ "<label for='cod-vid'>Codice Originale: </label>"
							+ "<input type='text' class='form-control' id='cod-vid' name='cod-vid' required>"
						+ "</div>"
						+ "<div class='col-md-6 mb-3'>"
							+ "<label for='annoProd'>Anno produzione: </label>"
							+ "<input type='text' class='form-control' id='annoProd' name='annoProd' required>"
						+ "</div>"
						+ "<div class='col-md-6 mb-3'>"
						+ "<label for='quantita-vid'>Quantità: </label>"
						+ "<input type='text' class='form-control' id='quantita-vid' name='quantita-vid' required>"
					+ "</div>"
					+ "</div>"	
					+ "<div class='row'>"	
						+ "<div class='col-md-6 mb-3'>"
							+ "<label for='costo'>Costo: </label>"
							+ "<input type='text' class='form-control' id='costo' name='costo' required>"
						+ "</div>"
						+ "<div class='col-md-6 mb-3'>"
							+ "<label for='pegi'>Pegi: </label>"
							+ "<select name='pegi' id='pegi' class='form-control'>"
								+ "<option value='tre'>tre</option>"
								+ "<option value='sette'>sette</option>"
								+ "<option value='dodici'>dodici</option>"
								+ "<option value='sedici'>sedici</option>"
								+ "<option value='diciotto'>diciotto</option>"
							+ "</select>"
						+ "</div>"
					+ "</div>"
					
				+ "</div>");

		}});
		
	});
	
	$("#prodSelect").change(function () {
		$.ajax({url:"", success: function(){
			var selectedSubject = $("#prodSelect option:selected").val();
			$("#dati").html(""
				+ "<div class='row'>"	
					+ "<div class='col-md-6 mb-3'>"
						+ "<label for='costo'>Costo: </label>"
						+ "<input type='text' class='form-control' id='costo' name='costo' required>"
					+ "</div>"
					 "<div class='col-md-6 mb-3'>"
					+ "<label for='cod-prod'>Codice Originale: </label>"
					+ "<input type='text' class='form-control' id='cod-prod' name='cod-prod' required>"
				+ "</div>"
					+ "<div class='col-md-6 mb-3'>"
						+ "<label for='quantita-prod'>Quantità: </label>"
						+ "<input type='text' class='form-control' id='quantita-prod' name='quantita-prod' required>"
					+ "</div>"
				+ "</div>"
				+ "<br/>");
		}});
		
	});
});
</script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/fragments/headerNuovo.jsp" %>
	
	<div id ="cont" class="container page">
		<h2>Modifica Prodotto</h2>
		<br/>
		
			<form action="ModInCatServlet" method="post">
				<div>
					<label for="tipo">Tipologia:</label>
					<select name="tipo" id="tipo" class=' col-md-6 mb-3 form-control '>
						<option value="null" selected>-</option>
						<option value="videogioco">videogioco</option>
						<option value="prodotto">Prodotto</option>
					</select>
				</div>
				<div id="videogSel" style="display:none">
					<label for="videogSelect">Scegli videogioco:</label>
					<select name="videogSelect" id="videogSelect" class=' col-md-6 mb-3 form-control '>
						<%
							for(VideogiocoBean vidBean: colVid){
						%>
						<option value="<%= vidBean.getId() %>"><%= vidBean.getNome() %></option>
						<%
							}
						%>
					</select>
				</div>
				<div id="prodSel" style="display:none">
					<label for="prodSelect">Scegli prodotto:</label>
					<select name="prodSelect" id="prodSelect" class=' col-md-6 mb-3 form-control '>
						<%
							for(ProdottoFisicoBean prodBean: colProd){
						%>
						<option value="<%= prodBean.getNome() %>"><%= prodBean.getNome() %></option>
						<%
							}
						%>
					</select>
				</div>
				<br/>
				<div id = "pagina">	
				
				
				</div>
				<div id = "dati">
				
				
				</div>
				
				<input id = "submit" type = "submit" value = "Modifica" class="btn btn-primary btn-block" style="display:none">
			</form>
	</div>
	
	<%@ include file="/fragments/footer.jsp" %>
</body>
</html>
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
<title>Aggiungi Catalogo</title>

<script>

$(document).ready(function () {
	$("#tipo").change(function () {
		$.ajax({url:"", success: function(){
			var selectedSubject = $("#tipo option:selected").val()
			if(selectedSubject == "videogioco"){
				$("#pagina").html("<div class='row'>"
										+"<div class='col-md-6 mb-3'>"
											+ "<label for='nome-vid'>Nome: </label>"
											+ "<input type='text' class='form-control'  id='nome-vid' name='nome-vid' required>"
										+ "</div>"
										+"<div class='col-md-6 mb-3'>"
											+ "<label for='cod-vid'>Codice: </label>"
											+ "<input type='text' class='form-control' id='cod-vid' name='cod-vid' maxlength='8' required>"
										+ "</div>"
									+ "</div>"
									+ "<div class='row'>"
										+ "<div class='col-md-6 mb-3'>"
											+ "<label for='softHouse'>Software House: </label>"
											+ "<select name='softHouse' id='softHouse' class='form-control'>"
											<%
												for(SoftwareHouseBean softBean: collSoft){
											 %>
												+ "<option value='<%=softBean.getNome()%>'><%=softBean.getNome()%></option>"
											<%
												}
											 %>
											+ "</select>"
										+ "</div>"
									+ "</div>"	
									+ "<div class='row'>"	
										+ "<div class='col-md-6 mb-3'>"
											+ "<label for='annoProd'>Anno produzione: </label>"
											+ "<input type='text' class='form-control' id='annoProd' name='annoProd' required>"
										+ "</div>"
										+ "<div class='col-md-6 mb-3'>"
											+ "<label for='annoProd'>Quantità: </label>"
											+ "<input type='text' class='form-control' id='quantita' name='quantita' required>"
									+ "</div>"
										+ "<div class='col-md-6 mb-3'>"
											+ "<label for='costo'>Costo: </label>"
											+ "<input type='text' class='form-control' id='costo' name='costo' required>"
										+ "</div>"
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
									+ "<div class='row'>"
										+ "<div class='col-md-6 mb-3'>"
											+ "<label for='inputImage'>Immagine del videogioco:</label>"
											+ "<input type='file' class='form-control' id='inputImage' name='inputImage' accept='image/*' required>"
										+ "</div>"
									+ "</div>"
								+ "</div>");
				$("#submit").css("display", "inline");
			}else if(selectedSubject == "prodotto"){
				$("#pagina").html("<div class='col-md-6 mb-3'>"
									+ "<label for='nome-prod'>Nome: </label>"
									+ "<input type='text' class='form-control' id='nome-prod' name='nome-prod' required>"
								+ "</div>"
								+ "<div class='col-md-6 mb-3'>"
									+ "<label for='costo-prod'>Costo: </label>"
									+ "<input type='text' class='form-control' id='costo-prod' name='costo-prod' required>"
								+ "</div>"
								+ "<div class='col-md-6 mb-3'>"
									+ "<label for='quantita-prod'>Quantità: </label>"
									+ "<input type='text' class='form-control' id='quantita-prod' name='quantita-prod' required>"
								+ "</div>"
								+ "<div class='row'>"
									+ "<div class='col-md-6 mb-3'>"
										+ "<label for='inputImage'>Immagine del prodotto:</label>"
										+ "<input type='file' class='form-control' id='inputImage' name='inputImage' required>"
									+ "</div>"
								+ "</div>"
								+ "<div class='col-md-6 mb-3'>"
									+ "<label for='cod-prod'>Codice: </label>"
									+ "<input type='text' class='form-control' id='cod-prod' name='cod-prod' required>"
							+ "</div>"
								+ "<br/>");
				$("#submit").css("display", "inline");
				
			}else{
				$("#pagina").html("<div id = 'pagina'>"
								+ "</div>");
				$("#submit").css("display", "none");
			}
		}});
		
	});
});




</script>
</head>

<title>Aggiungi Prodotto</title>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/fragments/headerNuovo.jsp" %>
	
	<div id ="cont" class="container page">
		<h2>Aggiungi in Catalogo</h2>
		<br/>
		
			<form action="AddInCatServlet" method="post" enctype="multipart/form-data">
				<div>
					<label for="tipo">Tipologia:</label>
					<select name="tipo" id="tipo" class=' col-md-6 mb-3 form-control '>
						<option value="null" selected>-</option>
						<option value="videogioco">Videogioco</option>
						<option value="prodotto">Prodotto</option>
					</select>
				</div>
				<br/>
				<div id = "pagina">	
				
				
				</div>
				<input id = "submit" type = "submit" value = "Aggiungi" class="btn btn-primary btn-block" style="display: none">
			</form>
		</div>
		<div><%@ include file="/fragments/footer.jsp" %></div>
</body>
</html>
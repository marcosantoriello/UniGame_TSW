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
		response.sendRedirect(request.getContextPath() + "/Catalogo.jsp");
	}
   	
   	Videogioco vidDS = new VideogiocoDS(ds);
	Collection<VideogiocoBean> colVid = vidDS.doRetrieveAll(null);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestione Videogiochi</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<script src="script/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script src="script/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>
	function remOggetto(id){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if (this.readyState == 4 && this.status == 200){
				document.getElementById("pagina").innerHTML = this.responseText;
			}
		};
		xhttp.open("GET","RemFromCatalogServlet?id=" + id + "&tipo=videogioco",true);
		xhttp.send();
	}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/fragments/headerNuovo.jsp" %>
	<div id="pagina">
	<div class="container" id="cont">
		<div class="card-header my-3">
			<h2>Gestione Videogiochi</h2>
			<br/>
		</div>
		<div style="text-align:center">
			<a href="/gamePlatformSite/addInCat.jsp" class="btn border-dark">
				<img src="images\icon\add.svg" alt="add-to-cart" class="icona" style="font-size:0; width:40px; height:40px;" style="font-size:0; width:40px; height:40px;"> Aggiungi Videogioco	
			</a>
			<a href="/gamePlatformSite/modInCat.jsp" class="btn border-dark"> 	
				<img src="images\icon\pencil.svg" alt="mod-abb" class="icona" style="font-size:0; width:40px; height:40px;" style="font-size:0; width:40px; height:40px;">	Modifica Videogioco
			</a>
		</div>
		<div class="row">
		<%
			if(!colVid.isEmpty()){
				for(VideogiocoBean vid: colVid){
		%>
		
			<div class="col-md-3 my-3">
				<div class="card text-center w-100" style="width: 18rem;">
					<form>
						 <input type="hidden" name="userId" value="<%=vid.getId()%>">
						<a href="prodottoVideog.jsp?id=<%=vid.getId()%>"> <img class="card-img-top" src="ImageServlet?immagine=video_<%=vid.getId()%>.jpg" alt="Card image"> </a>
					</form>
					<div class="card-body">
						<h5 class="card-title"><%= vid.getNome() %></h5>
						<h6 class="price"> &euro; <%= vid.getPrezzo() %></h6>
						<button type="button" class="btn border-dark" onclick='remOggetto("<%= vid.getId() %>"); alert("Prodotto Rimosso")'><img src="images\icon\trash.svg" alt="rem-videog" class="icona" style="font-size:0; width:40px; height:40px;"></button>
					</div>
				</div>
			</div>
		<%	
				}
			}
		%>
		</div>
	</div>
	<%@ include file="/fragments/footer.jsp" %>
	</div>

</body>
</html>
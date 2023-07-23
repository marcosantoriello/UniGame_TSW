<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>    
    
   <%
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Videogioco vidDS = new VideogiocoDS(ds);
	Collection<VideogiocoBean> colVid = vidDS.doRetrieveAll("nome");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/style.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="32x32" href="img/icon/favicon.png">
<title>Catalogo Videogiochi</title>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="../fragments/headerNuovo.jsp" %>
	<div class="container page">
		<div class="card-header my-3">
			<h2>Catalogo Videogiochi</h2>
			<br/>
		</div>
		<div class="row">
		<%
			if(!colVid.isEmpty()){
				for(VideogiocoBean vid: colVid){
		%>
		
		
		
			<div class="col-md-4 my-3">
				<div class="card text-center w-100" style="width: 18rem;">
				
					<form>
						<input type="hidden" name="VideogiocoID" value="<%=vid.getId()%>">
						<a href="prodotto.jsp?id=<%=vid.getId()%>"><img class="card-img-top" src="ImageServlet?immagine=video_<%=vid.getId()%>.jpg" alt="Card image"></a>
					</form>
	
					
						<div class="card-body">
						<!-- colonne da visualizzare ella collection  -->
						<h5 class="nome"><%= vid.getNome() %></h5>
						<h6 class="prezzo"> &euro; <%= vid.getPrezzo()%></h6>
						<a href="AggiungiCarrello?id=<%= vid.getId() %>" class="btn">
							<img src="images\icon\shopping-cart.png" alt="add-to-cart" class="icona">	
						</a>
						


						</div>
				</div>
			</div>
		<%	
				}
			}
		%>
		</div>
	</div>
	<%@ include file="../fragments/footer.jsp" %>
</body>
</html>
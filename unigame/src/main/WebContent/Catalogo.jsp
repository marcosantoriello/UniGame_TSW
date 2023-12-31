<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>    
    
   <%
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
   	String ruolo = (String) session.getAttribute("ruolo");
   	if (ruolo == null || ruolo == "cliente" || ruolo == "admin") {
   		
   	} else if (ruolo == "gestAssist") {
   		response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
   	}
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
<script src="script/jquery-3.6.0.min.js"></script>
<title>Catalogo Videogiochi</title>
</head>
<body>
	<script src="script/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
	<%@ include file="/fragments/headerNuovo.jsp" %>
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
						<a href="prodottoVideogioco.jsp?id=<%=vid.getId()%>"> <img class="image-piccola card-img-top image-responsive" src="ImageServlet?immagine=video_<%=vid.getId()%>.jpg" alt="Card image"> </a>
					</form>
	
					
						<div class="card-body">
						<!-- colonne da visualizzare ella collection  -->
						<h5 class="nome"><%= vid.getNome() %></h5>
						<h6 class="prezzo"> &euro; <%= vid.getPrezzo()%></h6>
						<%if (!vid.isDisponibile() || vid.getQuantità() == 0) {%>
							<h6>Non disponibile</h6>
						<%} else { %>
							<a href="AggiungiCarrello?id=<%=vid.getId()%>&tipo=videogioco" class="btn">
								<img src="images\icon\shopping-cart.png" alt="add-to-cart" class="icona">	
							</a>
						<%} %>


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
</body>
</html>
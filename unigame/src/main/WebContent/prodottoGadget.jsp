<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>

<!DOCTYPE html>	
<%
	String ruolo = (String) session.getAttribute("ruolo");
	if (ruolo == "gestAssist") {
		response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	}
	String id_p = (String) request.getParameter("id");
	System.out.println(id_p);
	int id = Integer.parseInt(id_p);
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	ProdottoFisico prodDS = new ProdottoFisicoDS(ds);
	ProdottoFisicoBean prodBean = prodDS.doRetrieveByKey(id);
	String disponibile;
	if (!prodBean.isDisponibile() || prodBean.getQuantità() == 0) {
		disponibile = "No";
	} else  {
		disponibile = "Sì";
	}
	Cliente clDS = new ClienteDS(ds);
	
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%=prodBean.getNome()%></title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
	</head>
	<body>
		<script src="script/jquery-3.6.0.min.js"></script> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		
		<%@include file="/fragments/headerNuovo.jsp" %>
		<div class="container">
		<h2 class="text-center"><%=prodBean.getNome()%></h2>
	</div>
	<div class="container mt-5 mb-5" id="product-section">
		<div class="row text-center">
			<div class="col-md-6 border-end">
				<img class="image-responsive" width="70%" src="ImageServlet?immagine=prodotto_<%=prodBean.getId()%>.jpg" alt="image">
			</div>
			<div class="col-md-6">
				<h4>Prodotto</h4>
				<br/>
				<h5>Prezzo: &euro;<%= prodBean.getPrezzo() %></h5>
				<div class="mt-5"> <span class="fw-bold">Info:</span>
                   <div>
                       <ul style="list-style-type:none">
                           <li class="text-center">Disponibile: <%=disponibile %></li><br/>
                           <%if (prodBean.isDisponibile()) { %>
                           	<!-- DISPONIBILE -->
                           		<li>Rimanenti: <%=prodBean.getQuantità() %>
                           		<% if(ruolo==null || ruolo.equals("cliente")){
            	   
               
               					%>
               				<br/>
               				<a href="AggiungiCarrello?id=<%=prodBean.getId()%>" class="btn border-dark"> 
               		 			Aggiungi al carrello
			   				</a>
			  				 	<%
			   
              	 					}
               
			   					%>
                           <% } else {%>
                           	<li>Il prodotto non e' al momento disponibile. Scopri altri prodotti oppure attendi qualche giorno!</li>
                           	<% } %>
                       </ul>
                   </div>
               </div>
               
			   
			</div>
		</div><!-- end row -->
		<br/> 		
		</div><!-- end container -->
		<%@include file="/fragments/footer.jsp" %>
	</body>
</html>
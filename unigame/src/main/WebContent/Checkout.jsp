<%@ page language="java" import="it.unisa.unigame.model.bean.* ,java.util.Collection,it.unisa.unigame.model.interfaceDS.*, it.unisa.unigame.model.DAO.*,javax.sql.DataSource "  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
	ClienteBean cliente = (ClienteBean) session.getAttribute("utente");
	Carrello carrello = (Carrello) session.getAttribute("carrello");
	Collection<VideogiocoBean> arrVid = carrello.getVideogames();
	Collection<ProdottoFisicoBean> arrAbb = carrello.getProdottiFisici();
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CheckOut</title>
		<link href="style/style.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<link rel="icon" type="image/png" sizes="32x32" href="img/icon/favicon.png">
	</head>
	<body>
	<script> function datiFattura() { 
		// Ottieni il riferimento al checkbox var
		checkbox = document.getElementById("fattura"); 
	// Controlla lo stato del checkbox e imposta il valore corrispondente
	if (checkbox.checked) {
		checkbox.value = "true"; // Se il checkbox è selezionato, imposta il valore a "true" 
		} 
	else { checkbox.value = "false"; // Se il checkbox non è selezionato, imposta il valore a "false" 
	} } 
	</script>
	
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
	
		<%@ include file="/fragments/headerNuovo.jsp" %>
		<div id="cont" class="container">
			<h2>CheckOut</h2>
	
			<br/><br/>
			
			<form action="CheckoutServlet" method="post">
			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Il tuo carrello</span> <span
							class="badge badge-secondary badge-pill">3</span>
					</h4>
					<ul class="list-group mb-3">					
								
					<% 
						for(VideogiocoBean vidBean : arrVid){
					%>
	
						<li	class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0"><%=vidBean.getNome() %></h6>
								<small class="text-muted"></small>
							</div> <span class="text-muted">&euro; <%=vidBean.getPrezzo()%></span>
						</li>
					<% 
						}
					%>
					
						<li class="list-group-item d-flex justify-content-between"><span>Totale
						</span> <strong>&euro; <%= carrello.getTotale() %>
						</strong></li>
					</ul>
	
				</div>
				
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Riepilogo Dati</h4>
					
					<div class="row">
						<div class="col-md-6 mb-3"> Nome: <%=cliente.getNome()%></div>
						<div class="col-md-6 mb-3"> Cognome: <%=cliente.getCognome()%></div>
					</div>
					
	
					<div class="row">
						<div class="col-md-6 mb-3"> Codice Fiscale:	<%=cliente.getCodice_fiscale() %> </div>
						<div class="col-md-6 mb-3"> Data Nascita: <%=cliente.getData_di_nascita() %> </div>
					</div>
	
					<div class="row">
						<div class="col-md-6 mb-3"> Username: <%=cliente.getUsername() %> </div>
						<div class="col-md-6 mb-3"> Email: <%=cliente.getEmail() %> </div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3"> Indirizzo di fatturazione <%=cliente.getInd_fatturazione() %></div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3"><input type="checkbox" name="fattura" id="fattura" onclick="datiFattura()"> Richiedi fattura  </div>
					</div>
					<div id="datiFattura">
					
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3" > Se vuoi modificare i dati personali, <a href="utentePage.jsp">clicca qui</a>  </div>
					</div>
					<hr class="mb-4">
	
					<h4 class="mb-3">Pagamento</h4>
	
						
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name">Nome titolare della carta&#42;</label> <input id="cc-name" type="text"
								name="cc-name" class="form-control" placeholder="" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">Numero della carta di credito&#42;</label> <input
								type="text" class="form-control" id="cc-number" name="cc-number" placeholder="" maxlength="16" required>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="cc-expiration">Data di scadenza&#42;</label> <input
								type="date" class="form-control" id="cc-expiration" name="cc-expiration" placeholder="" required>
						</div>
						<div class="col-md-3 mb-3">
							<label for="cc-cvv">CVV&#42;</label> <input type="text"
								class="form-control" id="cc-cvv" name="cc-cvv" placeholder="" maxlength="3" required>
						</div>
					</div>
					<hr class="mb-4">
				</div>	
			</div>
			<button class="btn btn-primary btn-block" type="submit" >Procedi al pagamento</button>
		</form>				
		</div>
		<%@ include file="/fragments/footer.jsp" %>
	
	</body>
</html>
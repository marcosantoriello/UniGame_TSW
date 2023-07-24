<%@ page language="java" import = "javax.sql.DataSource,java.time.format.DateTimeFormatter, java.time.LocalDateTime,java.util.*,it.unisa.unigame.model.DAO.OrdineDS,it.unisa.unigame.model.interfaceDS.Ordine,it.unisa.unigame.model.bean.OrdineBean,it.unisa.unigame.model.interfaceDS.Ordine,it.unisa.unigame.model.bean.ClienteBean" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String ruolo = (String) session.getAttribute("ruolo");
	ClienteBean cliente = (ClienteBean) session.getAttribute("utente");
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Ordine ordineDS = new OrdineDS(ds);
	Collection<OrdineBean> ordiniData= (Collection<OrdineBean>)ordineDS.doRetrieveAll("data_e_ora");

	
	final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
	
%>

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>I miei ordini</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="32x32" href="img/icon/favicon.png">
<link href="style/style.css" rel="stylesheet">

</head>
<body>
	
	<script src="script/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<div id="pagina">
		<%@ include file="/fragments/headerNuovo.jsp" %>
		<div class="container page">
			<h2>I miei ordini</h2>
			<br/>
			
			<table class="table table-light align-middle" id="tabellaOrdini">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Codice Riscatto</th>
						<th scope="col">Data e Ora</th>
						<th scope="col">Prezzo</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
						
						for(OrdineBean order: ordiniData){
							if(order.getCodice_fiscale()==cliente.getCodice_fiscale()){
								
		
								
					%>
					
					<tr id = "<%= order.getData_e_ora().format(dtf) %>">
						<td><%= order.getId() %></td>
						
					</tr>
					
					<%
				
						} 
					
						}
					%>
					
			
			</table>  
			
		</div>
	
		<%@ include file="/fragments/footer.jsp" %>
	</div>


	
</body>
</html>
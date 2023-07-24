<%@ page language="java" import = "javax.sql.DataSource,java.time.format.DateTimeFormatter, java.time.LocalDateTime,java.util.*,it.unisa.unigame.model.DAO.OrdineDS,it.unisa.unigame.model.interfaceDS.Ordine,it.unisa.unigame.model.bean.OrdineBean,it.unisa.unigame.model.interfaceDS.Ordine" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String ruolo = (String) session.getAttribute("ruolo");
	if (ruolo != "admin") {

		response.sendRedirect(request.getContextPath() + "/errorPage.jsp");

		}
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
			<form action="FiltraOrdiniData" method="post">
				<div class="col-md-2 mb-3">
					<label for="first">Da:</label>
					<input id="first" type="date" name="first" class="form-control" placeholder="first" required>
					<label for="last">A:</label>
					<input id="last" type="date" name="last" class="form-control" placeholder="last" required>
					<button type="submit" value="Filtra per data" class="btn btn-primary mt-2">Filtra per data</button>
				</div>
				<br/>
			
			</form>
			<table class="table table-light align-middle" id="tabellaOrdini">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Data e Ora</th>
						<th scope="col">Prezzo</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
						Collection<OrdineBean> colAcqByData = (Collection<OrdineBean>) request.getAttribute("orderList");
						if(colAcqByData == null){
							for(OrdineBean acq: ordiniData){
					%>
					
					<tr id = "<%= acq.getId() %>">
						
						<td><%= acq.getId() %></td>
						<td><%= acq.getData_e_ora().format(dtf) %></td>
						<td><%=acq.getImporto_totale() %>&euro;</td>
					</tr>
					
					<%
							}
						} else {
							if(colAcqByData.size() > 0){
								for(OrdineBean acq: colAcqByData){
								
					%>
					<tr id = "<%= acq.getId() %>">
						
						<td><%= acq.getId() %></td>
						<td><%= acq.getData_e_ora().format(dtf) %></td>
						<td><%=acq.getImporto_totale() %>&euro;</td>
						
					</tr>
					<%
								}
							} else {
					%>
					<tr>
						<td>Non c'è stato nessuno acquisto effettuato nell'intervallo di date inserite.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
								
							}
						}	
							
					%>
				</tbody>
				
			
			</table>  
			
		</div>
	
		<%@ include file="/fragments/footer.jsp" %>
	</div>


	
</body>
</html>
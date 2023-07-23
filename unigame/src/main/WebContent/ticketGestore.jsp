<%@ page language="java" import="javax.sql.DataSource, it.unisa.unigame.model.bean.TicketBean, it.unisa.unigame.model.interfaceDS.Ticket, 
it.unisa.unigame.model.DAO.TicketDS, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String role = (String) session.getAttribute("ruolo");
	
	if(role == null){
		response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
	} else if (role.equals("admin") || role.equals("cliente")) {
	response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	}
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Ticket ticketDS = new TicketDS(ds);
	Collection<TicketBean> colTic = ticketDS.doRetrieveAll("num_ticket");

%>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="style/style.css" rel="stylesheet">
		<link rel="icon" type="image/png" sizes="32x32" href="img/icon/favicon.png">
	<title>UNIGAME | Gestione tickets</title>
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
			//richiesta asincrona
			xhttp.open("GET","RemTicketRes?id=" + id,true);
			xhttp.send();
		}
	</script>
	
	
	<div id="pagina">
	<%@ include file="/fragments/headerNuovo.jsp" %>
	<div id = "cont" class="container page">
		<h2>Gestione tickets</h2>
			
			<br/>
			<%
				if(colTic.isEmpty()){
			%>		
				<p>Non ci sono ticket da risolvere.</p>	
			<% 
				}else{
			%>
			<table class="table table-light align-middle">
				<thead>
					<tr>
						<th scope="col">Numero ticket</th>
						<th scope="col">Categoria</th>
						<th scope="col">Messaggio</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<% 
						for(TicketBean ticBean : colTic){
					%>
					
						<tr id = "<%= ticBean.getNum_ticket() %>">
						
							<td><%= ticBean.getCategory() %></td>
							<td><%= ticBean.getMessaggio() %></td>
							<td>
								<button type="button" class="btn border-dark" onclick='remOggetto("<%= ticBean.getNum_ticket() %>")'><img src="img\icon\check.svg" alt="prob-risolto" class="icona"></button>
							</td>
							
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
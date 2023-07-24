<%@ page language="java" import="it.unisa.unigame.model.bean.*, java.util.*" 
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<%
	boolean flag = false;
	Carrello carrello = (Carrello) session.getAttribute("carrello");
	String ruolo = (String) session.getAttribute("ruolo");
	
	if(ruolo == null){
		flag = false;
	}else if(ruolo.equals("admin") || ruolo.equals("gestAssist")){
		response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	}else if(ruolo.equals("cliente")){
		flag = true;
	}
	
%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/style.css" rel="stylesheet">
</head>
<body>
<script src="script/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function remOggetto(idV, idP){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if (this.readyState == 4 && this.status == 200){
				document.getElementById("pagina").innerHTML = this.responseText;
			}
		};
		xhttp.open("GET","RemFromCartServlet?idV=" + idV+"&idP=" + idP,true);
		xhttp.send();
	}
	
	function checkTot(tot){
		if(tot == "0"){
			alert("Per procedere all'acquisto devi contenere almeno un oggetto nel carrello.");
		} else {
			window.location.href="/unigame/Checkout.jsp";
		}
	}
	
	
</script>
<div id= "pagina">
<%@ include file="/fragments/headerNuovo.jsp"%>

<%
	if(flag == true){	
%>
	
	<div id = "cont" class="container page">
	<h2>Carrello</h2>
		<div class="d-flex py-3"><h3>Prezzo totale: &euro; <%= carrello.getTotale() %></h3><button class="mx-3 btn btn-primary" onclick='checkTot("<%= carrello.getTotale() %>")'>Compra ora</button></div>

		<%
			Collection<VideogiocoBean> arrVid = carrello.getVideogames();
			Collection<ProdottoFisicoBean> arrProd = carrello.getProdottiFisici();
			if(arrVid.isEmpty() && arrProd.isEmpty()){
		%>		
			<p>Il carrello è vuoto.</p>	
		<% 
			}else{
				
			
		%>
		<table class="table table-light align-middle">
			<thead>
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Tipo</th>
					<th scope="col">Prezzo</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<% 
					for(ProdottoFisicoBean prodBean : arrProd){
				%>
				
				<tr id = "<%= prodBean.getNome() %>">
					
					<td><%= prodBean.getNome() %></td>
					<td>Prodotto</td>
					<td>&euro; <%= prodBean.getPrezzo() %></td>
					<td>
						<button type="button" class="btn btn-sm btn-danger" onclick='remOggetto(0, <%= prodBean.getId() %>)'>Rimuovi</button>
					</td>
				</tr>
				<%
					}
				%>
			
			
				<% 
					for(VideogiocoBean vidBean : arrVid){
				%>
				
				<tr id = "<%=vidBean.getId()%>">
					
					<td><%= vidBean.getNome() %></td>
					<td>Videogioco</td>
					<td>&euro; <%= vidBean.getPrezzo() %></td>
					<td><button type="button" class="btn btn-sm btn-danger" onclick='remOggetto(<%= vidBean.getId() %>, 0)'>Rimuovi</button></td>
				</tr>
				<%
					}
				%>
				
			</tbody>
		
		</table>
		<%
			}
		%>

	</div>			
<% 
	}else{
%>		
		<div id = "cont" class="container page">
			<h2>Carrello</h2>
			<br/>
			<p>La funzionalità carrello non è disponibile se non sei autenticato, effettua il <a href = "/unigame/loginPage.jsp">login</a></p>
		</div>
<%	
	}

%>
<%@ include file="/fragments/footer.jsp" %>

</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String roles = (String) session.getAttribute("ruolo");
	
	if(roles == null){
		response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
	}else if (roles.equals("cliente")) {
		
	}else{
		response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	}
	
	
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Unigame | Richiesta Ticket</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		
	</head>
	<body>
		<script>
			function redirectToJSP(var page){
				window.location.href=page;
			}
			
			function submitForm() {
			    // Ottengo i valori dai campi del form
			    var email = document.getElementById('exampleInputEmail1').value;
			    var category = document.getElementById('exampleInputEmail3').value;
			    var requestBody = document.getElementById('exampleFormControlTextarea1').value;
			    
			    // Creo un oggetto con i dati del form da inviare alla servlet
			    var formData = {
			      email: email,
			      category: category,
			      requestBody: requestBody
			    };
			    
			    // Effettuo la richiesta HTTP POST alla servlet
			    var xhttp = new XMLHttpRequest();
			    xhttp.onreadystatechange = function() {
			      if (this.readyState === 4 && this.status === 200) {
			        // Gestisco la risposta dalla servlet, se necessario
			        window.location.href = "ticketEffettuato.jsp";
			      }
			    };
			    xhttp.open("POST", "TicketCreato", true);
			  }
		</script>
		
		<%@include file="/fragments/headerNuovo.jsp"  %>
		
	
		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		    <small id="emailHelp" class="form-text text-muted">Non mostreremo a nessuno la tua email.</small>
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail2">Data</label>
		    <input type="date" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail3">Categoria</label>
		    <select class="form-control" id="exampleInputEmail3">
			  <option>account</option>
			  <option>pagamento</option>
			  <option>ordine</option>
			  <option>altro</option>
			</select>
		  </div>
			
		  
		  <div class="form-group">
			 <label for="exampleFormControlTextarea1">Corpo della richiesta</label>
			 <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		  </div>
		
		<button type="submit" class="btn btn-primary"  onclick="redirectToJSP(ticketEffettuato.jsp)">Submit</button>
		
		</form>
				
		<%@include file="/fragments/footer.jsp"  %>
	</body>
</html>
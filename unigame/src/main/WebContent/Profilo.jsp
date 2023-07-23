<%@ page language="java" import="it.unisa.unigame.model.bean.GestoreAssistenzaBean,java.util.Collection,it.unisa.unigame.model.bean.TelefonoBean, it.unisa.unigame.model.bean.AmministratoreBean,it.unisa.unigame.model.interfaceDS.Telefono, it.unisa.unigame.model.DAO.TelefonoDS,it.unisa.unigame.model.bean.ClienteBean,javax.sql.DataSource "  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Unigame | Profilo</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<script src="script/jquery-3.6.0.min.js"></script>
	</head>
	
	<body>
		<script src="script/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<script>
			function redirectToJSP(var page){
				window.location.href=page;
			}
		
		</script>
		
		<%@include file="/fragments/headerNuovo.jsp"  %>
		
		<% 	
			String ruoloProf =(String) session.getAttribute("ruolo");
			DataSource ds = (DataSource) getServletContext().getAttribute("DataSource"); 
			if(ruoloProf.equals("cliente")){
				ClienteBean utente= (ClienteBean) session.getAttribute("utente");
				Telefono tel= new TelefonoDS(ds);
				Collection<TelefonoBean> telbean= tel.doRetrieveAll(null);
		
		%>
		
		
		
		<section>
		  <div class="container py-5">
		    	
		    <div class="row">
		      <div class="col-lg-4" >
		        <div class="card mb-4"style="background-color:#62A6FA;">
		          <div class="card-body text-center">
		            <img src="images/avatar.jpg" alt="avatar"
		              class="rounded-circle img-fluid" style="width: 150px;">
		            <h5 class="my-3">John Smith</h5>
		             <div class="d-flex justify-content-center mb-2">
		              <button type="button" class="btn btn-primary" onclick="redirectToJSP(OrdiniEffettuati.jsp)">I miei ordini</button>
		              <button type="button" class="btn btn-primary ms-2" onclick="redirectToJSP(Fatture.jsp)">Le mie fatture</button>
		            </div>
		          </div>
		        </div>
		        
		      </div>
		      <div class="col-lg-8">
		        <div class="card mb-4">
		          <div class="card-body" style="background-color:#62A6FA;">
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Nome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= utente.getNome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Cognome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= utente.getCognome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Email</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= utente.getEmail() %></p>
		              </div>
		            </div>
		            
		            <hr>
		            <% for(TelefonoBean bean : telbean){ %>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Telefono</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0">(39) <%= bean.getNumero() %></p>
		              </div>
		            </div>
		            <hr>
		            <%} %>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Data di nascita</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"> <%= utente.getData_di_nascita() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Indirizzo</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= utente.getInd_fatturazione() %></p>
		              </div>
		            </div>
		          </div>
		        </div>
		        
		    </div>
		  </div>
		  </div>
		</section>
		<%
			}if(ruoloProf.equals("gestAssist")){
				GestoreAssistenzaBean gest = (GestoreAssistenzaBean) session.getAttribute("utente");
			
		%>
		
		<section>
		  <div class="container py-5">
		    	
		    <div class="row">
		      
		      <div class="col-lg-8">
		        <div class="card mb-4">
		          <div class="card-body" style="background-color:#62A6FA;">
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Nome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%=gest.getNome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Cognome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= gest.getCognome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Email</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%=gest.getEmail() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Retribuzione Annuale</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= gest.getRetribuzione_annuale() %> &#8364</p>
		              </div>
		            </div>
		          </div>
		        </div>
		        
		    </div>
		  </div>
		  </div>
		</section>
		
		<%
		}if(ruoloProf.equals("admin")){
				AmministratoreBean amm = (AmministratoreBean) session.getAttribute("utente");
				System.out.println("Amministratore: " + amm.getNome());
		%>
		
		<section>
		  <div class="container py-5">
		    	
		    <div class="row">
		      
		      <div class="col-lg-8">
		        <div class="card mb-4">
		          <div class="card-body" style="background-color:#62A6FA;">
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Nome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%=amm.getNome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Cognome</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= amm.getCognome() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Email</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%=amm.getEmail() %></p>
		              </div>
		            </div>
		            <hr>
		            <div class="row">
		              <div class="col-sm-3">
		                <p class="mb-0">Retribuzione Annuale</p>
		              </div>
		              <div class="col-sm-9">
		                <p class="text-muted mb-0"><%= amm.getRetribuzione_annuale() %> &#8364</p>
		              </div>
		            </div>
		          </div>
		        </div>
		        
		    </div>
		  </div>
		  </div>
		</section>
	
		<%} %>
		
		<%@include file="/fragments/footer.jsp"  %>
	</body>
</html>
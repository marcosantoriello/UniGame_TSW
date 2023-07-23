<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime"
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
	Videogioco vidDS = new VideogiocoDS(ds);
	VideogiocoBean vidBean = vidDS.doRetrieveByKey(id);
	
	RecensioneDS recDS = new RecensioneDS(ds);
	Collection<RecensioneBean> colRec = recDS.doRetrieveAll(id, null);
	
	Cliente clDS = new ClienteDS(ds);
	
%>

<html>
<head>
<meta charset="UTF-8">
<title><%=vidBean.getNome() %></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
	<script src="script/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/fragments/headerNuovo.jsp" %>
	<div class="container">
		<h2 class="text-center"><%=vidBean.getNome()%></h2>
	</div>
	<div class="container mt-5 mb-5" id="product-section">
		<div class="row text-center">
			<div class="col-md-6 border-end">
				<img class="image-responsive" width="70%" src="ImageServlet?immagine=video_<%=vidBean.getId()%>.jpg" alt="image">
			</div>
			<div class="col-md-6">
				<h4>Videogioco</h4>
				<br/>
				<h5>Prezzo: &euro;<%= vidBean.getPrezzo() %></h5>
				<div class="mt-5"> <span class="fw-bold">Specifiche:</span>
                   <div>
                       <ul style="list-style-type:none">
                           <li class="text-center">Prodotto da: <%= vidBean.getProduttore() %></li>
                           <li>Sviluppato nel:<%= vidBean.getAnno_produzione() %> </li>
                           <li>Pegi: <%= vidBean.getPegi() %></li>
                           
                       </ul>
                   </div>
               </div>
               <% if(ruolo==null || ruolo.equals("cliente")){
            	   
               
               %>
               <br/>
               <a href="AggiungiCarrello?id=<%=vidBean.getId()%>" class="btn border-dark"> 
               		 Aggiungi al carrello
			   </a>
			   <%
			   
              	 }
               
			   %>
			   
			</div>
		</div><!-- end row -->
		<br/> 
		<!-- RECENSIONI -->
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
			
				<section>
					<div class="row d-flex justify-content-center py-3">
						<div class="col-md-10 col-xl-8 text-center">
							<h3 class="mb-4">Recensioni</h3>
						</div>
					</div>
					
					<div class="row text-center">
						<%
							if(!colRec.isEmpty()){
								for(RecensioneBean rec: colRec){
								ClienteBean clBean = clDS.doRetrieveByKey(rec.getCliente());
						%>
						<div class="col-md-12  mb-md-5">
							<h5 class="mb-3"><%=clBean.getNome() %> <%=clBean.getCognome() %></h5>
							<p class="px-xl-3">
								<%=rec.getDescrizione() %><br/>
								Data e ora: <%=DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss").format(rec.getData_e_ora()) %>
							</p>
							<%
								String strGrado = rec.getIndice_di_gradimento().toString();
								int grado = 0;
							
								if(strGrado.equals("cinque")){
									grado = 5; 
								} else if (strGrado.equals("quattro")){
									grado=4;
								} else if (strGrado.equals("tre")){
									grado=3;
								} else if (strGrado.equals("due")){
									grado=2;
								} else if (strGrado.equals("uno")){
									grado=1;
								}
									
							%>
							<div>
							<ul class="list-inline">
							
								<% 
									for(int i=1; i<=grado; i++){
								%>
									<img src="image\icon\star.svg" alt="star-piena" class="icona">
									
								<% } %>
								
								<% 
									for(int i=grado; i<5; i++){
								%>
									<img src="image\icon\star-vuota.svg" alt="star-vuota" class="icona")>
									
								<% } %>
							</ul>
						</div>
							
						</div>
						
						<% 
						}
						}else{
						
						%>
						<h5>Non ci sono recensioni.</h5>				
						
						<% 
					}
						
				%>
					</div><!-- chiusura div per il for -->
				
				</section>
				
			</div>
		
		</div><!-- end row -->
		
		
		
		<br/><br/>
			 <% 
			 	if(ruolo==null){
			 		
			 	}else if(ruolo.equals("cliente")){
			 		
             %>
			<form action="RecensioneServlet?id=<%=vidBean.getId() %>" method="post">
				<div class="row">
					<div class="form-group">
						<label for="textArea">Descrizione</label>
						<textarea class="form-control" id="textArea" name="textArea" rows="7"></textarea>
					</div>
				</div>
				<br/>
				<div class="row">	
					<div class="col-md-6 mb-3">
						<label for="grado">Grado di Apprezzamento</label> <br /> <select name="grado"
							id="grado" class="form-control">
							<option value="uno" id="uno">uno</option>
							<option value="due" id="due">due</option>
							<option value="tre" id="tre">tre</option>
							<option value="quattro" id="quattro">quattro</option>
							<option value="cinque" id="cinque">cinque</option>
						</select>
					</div>
				</div>
				<input type="submit" value="Aggiungi recensione" class="btn btn-block btn-warning"/>
			</form>
			<%
			 	}
			%>
		
	</div><!-- end container -->
	<%@ include file="/fragments/footer.jsp" %>
</body>
</html>
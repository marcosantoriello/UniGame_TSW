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
	int id = Integer.parseInt(id_p);
	
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Videogioco vidDS = new VideogiocoDS(ds);
	VideogiocoBean vidBean = vidDS.doRetrieveByKey(id);
	String disponibile;
	if (!vidBean.isDisponibile() || vidBean.getQuantità() == 0) {
		disponibile = "No";
	} else  {
		disponibile = "Sì";
	}
	
	RecensioneDS recDS = new RecensioneDS(ds);
	Collection<RecensioneBean> colRec = recDS.doRetrieveAll(id, null);
	
	Cliente clDS = new ClienteDS(ds);
	
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/style.css" rel="stylesheet">
<script src="script/jquery-3.6.0.min.js"></script>

<title><%=vidBean.getNome() %></title>

</head>
<body>
	<script src="script/jquery-3.6.0.min.js"></script>
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
                           <li class="text-center">Prodotto da: <%= vidBean.getProduttore() %></li><br/>
                           <li>Sviluppato nel:<%= vidBean.getAnno_produzione() %> </li><br/>
                           <li>Pegi: <%= vidBean.getPegi() %></li><br/>
                           
                       </ul>
                   </div>
               </div>
               <%if (!disponibile.equals("No")) {%>
	               <% if(ruolo==null || ruolo.equals("cliente")){
	            	   
	               
	               %>
	               <br/>
	               <a href="AggiungiCarrello?id=<%=vidBean.getId()%>&tipo=videogioco" class="btn border-dark"> 
	               		 Aggiungi al carrello
				   </a>
				   <%
				   
	              	 }
	               
				   %>
			  	<% } else {%>
                           	<li>Il prodotto non e' al momento disponibile.</br> Scopri altri prodotti oppure attendi qualche giorno!</li>
				<% } %>
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
									<img src="images\icon\star.svg" alt="star-piena" class="icona" style="font-size:0; width:40px; height:40px;">
									
								<% } %>
								
								<% 
									for(int i=grado; i<5; i++){
								%>
									<img src="images\icon\star-vuota.svg" alt="star-vuota" class="icona" style="font-size:0; width:40px; height:40px;")>
									
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
						<label for="grado">Grado di Apprezzamento</label> <br /> <select name="valutazione"
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
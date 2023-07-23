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
	
	//aggiungi recensioni
	
	Cliente clDs = new ClienteDS(ds);
	
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
               		<img src="img\icon\shopping-cart.svg" alt="add-to-cart" class="icona"> Aggiungi al carrello
			   </a>
			   <%
			   
              	 }
               
			   %>
			   
			</div>
		</div><!-- end row -->
		<br/>
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
			
				<!-- AGGIUNGI SECTION RECENSIONI -->
				
			</div>
		
		</div>
	</div><!-- end container -->
	<%@ include file="/fragments/footer.jsp" %>
</body>
</html>
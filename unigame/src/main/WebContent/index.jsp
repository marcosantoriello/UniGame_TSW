<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>

<%
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Videogioco vidDS = new VideogiocoDS(ds);
	Collection<VideogiocoBean> rigaVid = (List<VideogiocoBean>) vidDS.doRetrieveAll(null);
	
	
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Unigame | Home</title>
		
		<!-- Bootstrap Script -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
	</head>
	
	<body>
		
		<script src="script/jquery-3.6.0.min.js"></script> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		
		
		
		<%@include file="/fragments/headerNuovo.jsp" %>
	
		<!-- DA AGGIUNGERE COPERTINA CON TITOLO -->
		
				
		<!-- SEZIONE PRODOTTI -->
		<div class="container">
		
		<!-- VIDEOGIOCHI -->
			<div class="row text-center"> 
				<h3 class="my-3">Videogiochi in evidenza</h3>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="ImageServlet?immagine=video_gta5.png" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="images/Videogiochi/video_gta5.png" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				
				<div class="col-md-3 my-3">
					<div class="card text-center w-100">
						<a href="#"> <img class="card-img-top" src="images/Videogiochi/video_gta5.png" alt="Card image"> </a>				
					</div>
				</div>
				
			</div>
			
			<!-- PRODOTTI FISICI -->
			<div class="row text-center"> 
				<h3 class="my-3">Gadget e Accessori</h3>
				<!-- PRODOTTO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="images/Videogiochi/video_gta5.png" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">Card title</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				
				<div id="roccia" class="col-md-4 my-3 mx-auto">
					<div id="rocket" class="card text-center w-100">
						<a href="#"> <img class="card-img-top" src="images/Videogiochi/video_gta5.png" alt="Card image"> </a>
					</div>
				</div>
				
				
			</div>
		</div>
		
		<%@include file="/fragments/footer.jsp" %>
	</body>
</html>
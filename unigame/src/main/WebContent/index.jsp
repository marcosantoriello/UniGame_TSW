<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>

<%
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	Videogioco vidDS = new VideogiocoDS(ds);
	List<VideogiocoBean> rigaVid = (List<VideogiocoBean>) vidDS.doRetrieveAll(null);
	Random rand = new Random();
	int index = rand.nextInt(rigaVid.size());
	VideogiocoBean vidBean = vidDS.doRetrieveByKey(rigaVid.get(index).getId());
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Unigame | Home</title>
		
		<!-- Bootstrap Script -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<script src="script/jquery-3.6.0.min.js"></script>
	</head>
	
	<body>
		 
		<script src="script/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		
		<script>
		$(document).ready(function(){
		  $("div#rocket").hover(function(){
		    $("div#roccia a .image-piccola").addClass("image-grande");
		    }, function(){
		    $("div#roccia a .image-piccola").removeClass("image-grande");
		  });
		});
		</script>	
		
		<%@include file="/fragments/headerNuovo.jsp" %>
	
		
		
				
		<!-- SEZIONE PRODOTTI -->
		<div class="container">
		
		<!-- VIDEOGIOCHI -->
			<div class="row text-center"> 
				<h3 class="my-3">Videogiochi in evidenza</h3>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="ImageServlet?immagine=video_693302.jpg" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">Grand Theft Auto: V</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="ImageServlet?immagine=video_660563.jpg" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">FIFA 22</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="ImageServlet?immagine=video_446002.jpg" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">AC: Valhalla</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				<!-- VIDEOGIOCO -->
				<div class="card" style="width: 18rem;">
				  <img class="card-img-top" src="ImageServlet?immagine=video_894354.jpg" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title">Skyrim</h5>
				    <a href="#" class="btn btn-primary">Visualizza</a>
				  </div>
				</div>
				
				
				
				
				
			<div class="row text-center">
			<h3 class="my-3">Selezionato per te</h3>
			
			<div id="roccia" class="col-md-4 my-3 mx-auto">
				<div id="rocket" class="card text-center w-100">
					<a href="#"> <img class="image-piccola card-img-top image-responsive" src="ImageServlet?immagine=video_<%=vidBean.getId()%>.jpg" alt="Card image"> </a>				
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
	</div>
		
		<%@include file="/fragments/footer.jsp" %>
	</body>
</html>
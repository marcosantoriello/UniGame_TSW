<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Chi siamo</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/aboutUs.css">
	</head>
	<style>
		div.back{
			min-height: 500px;
			background-image: url("images/who.jpg");
	  		background-repeat: no-repeat;
	  		background-size: cover;
 		}
	</style>
	
	<script src="script/jquery-3.6.0.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<body>
		<%@include file="/fragments/headerNuovo.jsp" %>
		<div class="back">
			<h1 class="title">Chi siamo?</h1>
		</div>
		
		<div class="container">
		  <div class="row">
		    <div class="col-sm">
		      <div class="card" style="width:20rem;">
	  			<img src="images/videogames.jpeg" class="card-img-top">
	  			<div class="card-body">
	    			<p class="card-text">Il nostro shop offre gadgets e videogames che hanno appassionato ben due generazini!</p>
	  			</div>
			  </div> 
		    </div>
		    <div class="col-sm">
		      <div class="card" style="width:20rem;">
	  			<img src="images/DI.png" class="card-img-top">
	  			<div class="card-body">
	    			<p class="card-text">Siamo un team di tre studenti che studiano informatica presso l'Universita' degli stud di Salerno, e questo sito fa parte di un progetto accademico.</p>
	  			</div>
			</div>
		   </div>
		    <div class="col">
		      Column
		    </div>
		  </div>

			
			
		</div>
			
		<%@include file="/fragments/footer.jsp" %>
	</body>
	
</html>
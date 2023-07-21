<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>

<%
	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
	
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Unigame | Home</title>
		
		<!-- Bootstrap Script -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<link rel="stylesheet" type="text/css" href="style/delstyle.css">
	</head>
	
	<body>
		<script src="script/jquery-3.6.0.min.js"></script> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> 

		
		<div class="card" style="width: 18rem;">
  			<img class="card-img-top" src="images/who.jpg" alt="Card image cap">
		  	<div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Go somewhere</a>'
			</div>
		</div>

		
		
		
		<%@include file="/fragments/footer.jsp" %>
	</body>
</html>
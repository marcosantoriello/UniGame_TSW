<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ruolo = (String) session.getAttribute("ruolo");
	if (ruolo == null) {
		
	} else {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Unigame | Accedi</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/style.css">
		
	</head>
	<body>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<%@include file="/fragments/headerNuovo.jsp" %>
		
		<div class="col fixed-center d-flex justify-content-center align-items-center page">
	
			<form action="LoginServlet" method="post"> 
				<h2>Accedi</h2><br/>
				<div class="form-outline mb-3">
					 <label class="form-label" for="email">Email</label>
				     <input id="email" type="email" name="email" class="form-control" placeholder="email" autofocus>
				     
				</div> 
				<div class="form-outline mb-3">
					 <label class="form-label" for="password">Password</label> 
				     <input id="password" type="password" name="password" class="form-control" placeholder="password">
				    
				</div>
				<input type="submit" class="btn btn-primary btn-block mb-4" value="Login"/>
			    <input type="reset" class="btn btn-danger btn-block mb-4" value="Reset"/>
				
				
				
				<div class="text-center">
			   		 <p>Non sei registrato? <a href="/gamePlatformSite/signup-form.jsp">Registrati</a></p>
			    </div>
			     
			   
			</form>

		</div>
		<%@include file="/fragments/footer.jsp" %>
		
	</body>
</html>
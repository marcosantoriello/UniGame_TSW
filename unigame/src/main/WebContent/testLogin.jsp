<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SCRIPT DI PROVA: DA CANCELLARE!!!!!!!!!!!! -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<!-- SCRIPT DI PROVA: DA CANCELLARE!!!!!!!!!!!! -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> 
<%@ include file="./fragments/header.jsp"%>
	<form action="LoginServlet" method="post">
		Email
		<input type="text" id="email" name="email"><br><br>
		Password
		<input type="password" id="password" name="password"><br><br>
		<button type="submit">Login</button>
	</form>
	<h3><a href="testTokenSessione.jsp">Pannello admin</a></h3>
	<a href="testTokenSessione.jsp">Admin Dashboard</a>
</body>
</html>
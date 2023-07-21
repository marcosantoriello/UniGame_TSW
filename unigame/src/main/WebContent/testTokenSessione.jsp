<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="javax.sql.DataSource, it.unisa.unigame.model.bean.*, it.unisa.unigame.model.DAO.*, it.unisa.unigame.model.interfaceDS.*,
	java.util.*"
%>

<%
		AmministratoreBean admBean = null;
		//CONTROLLO TOKEN
		String ruolo = (String) session.getAttribute("ruolo");
		if (ruolo == null) { //se utente non e' loggato
			response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
		} else if ((ruolo.equals("cliente")) || ruolo.equals("gestAssist")) { //se utente e' loggato ma non ha i permessi
			response.sendRedirect(request.getContextPath() + "errorPage.jsp");
		} else {
			admBean = (AmministratoreBean)session.getAttribute("utente");
		}
		
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Test Token Sessione</title>
</head>
<body>
	<h1>BENVENUTO ADMIN!</h1>
	<p>Username:  <%=admBean.getUsername()%></p><br><br>
	<p>Nome:  <%=admBean.getNome()%></p><br><br>
	<p>Cognome:  <%=admBean.getCognome()%></p><br><br>
	<p>Codice Fiscale:  <%=admBean.getCodice_fiscale()%></p><br><br>
</body>
</html>
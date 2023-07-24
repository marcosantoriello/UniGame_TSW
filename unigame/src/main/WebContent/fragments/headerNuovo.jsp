<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>


<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!--<link rel="stylesheet" type="text/css" href="style/style.css">  -->	
	</head>
	
	<%
		//prendo dalla sessione il ruolo per far visualizzare la rispettiva navbar
		String ruoloNav = (String) session.getAttribute("ruolo");
		
	%>
	
	
	<header>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> 
		<%
				if(ruoloNav == null){
			%>
			<nav class="navbar navbar-expand-lg bg-costum" id="headerNav" >
		  	<div class="container-fluid">
		    	<a class="navbar-brand" id="logo" href="#">Unigame</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		     	 	<span class="navbar-toggler-icon"></span>
		    	</button>
		    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        		<li class="nav-item">
		          			<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        		</li>
		        		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Negozio
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="Catalogo.jsp">Videogiochi</a>
          						<a class="dropdown-item" href="CatalogoGadget.jsp">Gadgets</a>
        					</div>
        				</li>
		         		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Chi siamo</a>
		        		</li>
		         		 <li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="loginPage.jsp">Accedi</a>
          						<a class="dropdown-item" href="signupPage.jsp">Registrati</a>
        					</div>
        				</li>
		        		
		      		</ul>
		      	</div>
		      </div>
		  </nav> 
			<%
				} else if (ruoloNav.equals("cliente")) {
			%>
			
			<nav class="navbar navbar-expand-lg bg-costum" id="headerNav" >
		  	<div class="container-fluid">
		    	<a class="navbar-brand" id="logo" href="#">Unigame</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		     	 	<span class="navbar-toggler-icon"></span>
		    	</button>
		    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        		<li class="nav-item">
		          			<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        		</li>
		        			<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Negozio
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="Catalogo.jsp">Videogiochi</a>
          						<a class="dropdown-item" href="CatalogoGadget.jsp">Gadgets</a>
        					</div>
        				</li>
		         		<li class="nav-item">
		         		 	<a class="nav-link" href="richiestaTicket.jsp">Contatta Assistenza</a>
		        		</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Chi siamo</a>
		        		</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="carrello.jsp">Carrello</a>
		        		</li>
		        		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="Profilo.jsp">Il mio profilo</a>
          						<a class="dropdown-item" href="#">I miei ordini</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="LogoutServlet">Logout</a>
        					</div>
        				</li>
		        		
		      		</ul>
		      	</div>
		      </div>
		  </nav> 
			
			<%
				} else if (ruoloNav.equals("gestAssist")) {
			%>
			<nav class="navbar navbar-expand-lg bg-costum" id="headerNav" >
		  	<div class="container-fluid">
		    	<a class="navbar-brand" id="logo" href="#">Unigame</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		     	 	<span class="navbar-toggler-icon"></span>
		    	</button>
		    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        		<li class="nav-item">
		          			<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		          		</li>
		          		<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          					Negozio
        				</a>
        				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          					<a class="dropdown-item" href="Catalogo.jsp">Videogiochi</a>
          					<a class="dropdown-item" href="CatalogoGadget.jsp">Gadgets</a>
        				</div>
        				</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="ticketGestore.jsp">Tickets</a>
		        		</li>
		        		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="Profilo.jsp">Il mio profilo</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="LogoutServlet">Logout</a>
        					</div>
        				</li>
		        		
		      		</ul>
		      	</div>
		      </div>
		  </nav> 
			<%
				} else if (ruoloNav.equals("admin")) {
			%>
			<nav class="navbar navbar-expand-lg bg-costum" id="headerNav" >
		  	<div class="container-fluid">
		    	<a class="navbar-brand" id="logo" href="#">Unigame</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		     	 	<span class="navbar-toggler-icon"></span>
		    	</button>
		    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        		<li class="nav-item">
		          			<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        		</li>
		        		<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          					Gestisci Prodotti
        				</a>
        				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          					<a class="dropdown-item" href="CatalogoAdmin.jsp">Videogiochi</a>
          					<a class="dropdown-item" href="CatalogoGadgetAdmin.jsp">Gadgets</a>
        				</div>
        				</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Chi Siamo</a>
		        		</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Staff</a> <!-- da cui si aggiungono/rimuovono assistenti e admin -->
		        		</li>
		         		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="Profilo.jsp">Il mio profilo</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="LogoutServlet">Logout</a>
        					</div>
        				</li>
		        		
		      		</ul>
		      	</div>
		      </div>
		  </nav> 
			<%
				}
			%>
	</header>
	
</html>	  
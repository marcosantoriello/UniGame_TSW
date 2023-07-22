<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>


<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style/style.css">
	</head>
	
	<%
	//prendo dalla sessione il ruolo per far visualizzare la rispettiva navbar
		String ruoloNav = (String) session.getAttribute("roles");
	
	%>
	
	
	<header>
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
          						<a class="dropdown-item" href="#">Videogiochi</a>
          						<a class="dropdown-item" href="#">Gadgets</a>
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
		         		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Contatta Assistenza</a>
		        		</li>
		        		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="#">Il mio profilo</a>
          						<a class="dropdown-item" href="#">I miei ordini</a>
          						<a class="dropdown-item" href="carrello.jsp">Carrello</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="#">Logout</a>
        					</div>
        				</li>
		        		
		      		</ul>
		      	</div>
		      </div>
		  </nav> 
			
			<%
				} else if (ruoloNav.equals("ass")) {
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
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Tickets</a>
		        		</li>
		        		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="#">Il mio profilo</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="#">Logout</a>
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
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Aggiorna catalogo</a>
		        		</li>
		        		<li class="nav-item">
		         		 	<a class="nav-link" href="chiSiamo.jsp">Staff</a> <!-- da cui si aggiungono/rimuovono assistenti e admin -->
		        		</li>
		         		<li class="nav-item dropdown">
        					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          						Account
        					</a>
        					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="#">Il mio profilo</a>
          						<div class="dropdown-divider"></div>
          							<a class="dropdown-item" href="#">Logout</a>
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
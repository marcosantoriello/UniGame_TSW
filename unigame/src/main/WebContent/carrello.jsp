 <%@ page language="java"  import=" java.text.SimpleDateFormat, it.unisa.unigame.model.bean.Carrello, java.util.*, it.unisa.unigame.model.bean.VideogiocoBean, it.unisa.unigame.model.bean.ProdottoFisicoBean" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Carrello</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="style/aboutUs.css">
	</head>
	
<body id="demo">
	
	<%
	//admin, utenti non loggati ed assistenti non vi hanno accesso, se l'utente non è loggato lo rimando alla page di accesso
		boolean isLogged=false;
	
		Carrello cart = (Carrello) session.getAttribute("carrello");
		String ruoloCart = (String) session.getAttribute("ruolo");
			
		if(ruoloCart == null){
			 isLogged= false;
		}else if(ruoloCart.equals("admin") || ruoloCart.equals("gestAssist")){
			response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
		}else if(ruoloCart.equals("cliente")){
			isLogged = true;
		}
		
	%>
		
	<script src="script/jquery-3.6.0.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	//funzione per l'evento di andare al checkout
		function checkout(importo){
			if(importo == "0"){
				alert("Per procedere all'acquisto devi contenere almeno un oggetto nel carrello.");
			} else {
				window.location.href="CheckoutServlet";
			}
		}
	
	//funzione per chiamare la servlet della rimozione del carrello quando si clicca sul pulsante
		function rimuoviElemento(id){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function(){
				if (this.readyState == 4 && this.status == 200){
					document.getElementById("demo").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET","RimuoviCarrello?id=" + id,true);
			xhttp.send();
		}
	
	</script>
	
	
		<%@include file="/fragments/headerNuovo.jsp" %>
		
		<%
		//nel caso in cui il carrello sia vuoto, faccio visualizzare solo questa cosa
			Collection<VideogiocoBean> videogames = cart.getVideogames();
			Collection<ProdottoFisicoBean> prodotti= cart.getProdottiFisici();
			if(videogames.isEmpty() && prodotti.isEmpty()){
		%>		
			<p text-align= center>Il carrello &#232 vuoto.</p> 
			 	 
		<% 
			}else{
				int numTotal= videogames.size()+prodotti.size();
				Calendar cal =Calendar.getInstance();
				cal.add(Calendar.DATE, 3);
				Date data= cal.getTime();
				SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/YYYY");
				float prodRel=0, vidRel=0;
		%>
	
		<section class="h-100 gradient-custom">
			  <div class="container py-5">
			    <div class="row d-flex justify-content-center my-4">
			      <div class="col-md-8">
			        <div class="card mb-4">
			          <div class="card-header py-3">
			            <h5 class="mb-0">Carrello -  elementi</h5>
			          </div>
			          <div class="card-body">
			          
			          <% 
						for(VideogiocoBean vid : videogames){
							//inizio a fare la somma dei prezzi dei videogame
							vidRel=vidRel+ vid.getPrezzo();
					  %>
			            <!-- Single  videogame -->
			            <div class="row">
			              <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
			                <!-- Image -->
			                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
			                  <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Vertical/12a.webp"
			                    class="w-100" alt="Blue Jeans Jacket" />
			                  <a href="#!">
			                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
			                  </a>
			                </div>
			                
			              </div>
			
			              <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
			                <!-- Data -->
			                <p><strong><%= vid.getNome() %></strong></p>
			                <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"title="Remove item"
			                onclick='rimuoviElemento("<%= vid.getId() %>")'> Rimuovi elemento
                  				<i class="fas fa-trash"></i>
                			</button>
			                
			              </div>
			
			              <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
			                <!-- Quantity -->
			                <div class="d-flex mb-4" style="max-width: 300px">
			                  
			
			                  <div class="form-outline">
			                    <input id="form1" min="0" name="quantity" value="1" type="number" class="form-control" />
			                    <script>
			                    	const qta=document.getElementById("form1").value;
			                    	
			                    	//funzione per il controllo della qtà selezionata
			            			function quantityVid(){
			            				
			            				if(qta > vid.getQuantità())
			            					alert("Non puoi selezionare questa quantità.")
			            				if(qta==0)
			            					rimuoviElemento(vid.getId());
			            			}
			                    	
			            			form1.addEventListener('input', quantityProd);
			                    </script>
			                    <label class="form-label" for="form1">Quantit&agrave</label>
			                  </div>
		
			                </div>
			                
			
			                <!-- Price -->
			                <p class="text-start text-md-center">
			                  <strong><%=vid.getPrezzo() %></strong>
			                </p>
			                
			              </div>
			            </div>
			            
			            <%} %>
			            <!-- Single item -->
			
			            <hr class="my-4" />
			            
			            <!-- Product item -->
						<% 
						//Faccio la stessa cosa per tutti i prodotti fisici del carrello
							for(ProdottoFisicoBean prod : prodotti){
								//inizio a fare la somma dei prezzi dei prodotti
								prodRel=prodRel+prod.getPrezzo();
					  	%>
			            
			            <div class="row">
			              <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
			                <!-- Image -->
			                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
			                  <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Vertical/13a.webp"
			                    class="w-100" />
			                  <a href="#!">
			                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
			                  </a>
			                </div>
			               
			              </div>
			
			              <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
			                <!-- Data -->
			                <p><strong><%= prod.getNome() %></strong></p>
			
			                <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"title="Remove item"
			                onclick='rimuoviElemento("<%= prod.getId() %>")'> Rimuovi elemento
			                  <i class="fas fa-trash"></i>
			                </button>
			                
			              </div>
			
			              <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
			                <!-- Quantity -->
			                <div class="d-flex mb-4" style="max-width: 300px">
			                  
			                  <div class="form-outline">
			                    <input id="form2" min="0" name="quantity" value="1" type="number" class="form-control" />
			                     <script>
			                     	const qta=document.getElementById("form1").value;
			                     	
			                    	//funzione per il controllo della qtà selezionata
			            			function quantityProd(){
			            				var qta=document.getElementById("form1").value;
			            				if(qta > prod.getQuantità())
			            					alert("Non puoi selezionare questa quantità.")
			            				if(qta==0)
			            					rimuoviElemento(prod.getId());
			            			}
			                    	
			            			form1.addEventListener('input', quantityProd);
			                    </script>
			                    <label class="form-label" for="form1">Quantit&agrave</label>
			                  </div>
			                </div>
			
			                <!-- Price -->
			                <p class="text-start text-md-center">
			                  <strong> <%= prod.getPrezzo() %> </strong>
			                </p>
			              </div>
			            </div>
			            
			            <%} %>
			            
			            <!-- box consegna e box riepilogo -->
			          </div>
			        </div>
			        <div class="card mb-4">
			          <div class="card-body">
			            <p><strong>Consegna stimata il giorno</strong></p>
			            <p class="mb-0"> <%= sdf.format(data) %></p>
			          </div>
			        </div>
			      </div>
			      <div class="col-md-4">
			        <div class="card mb-4">
			          <div class="card-header py-3">
			            <h5 class="mb-0">Riepilogo</h5>
			          </div>
			          <div class="card-body">
			            <ul class="list-group list-group-flush">
			              <li
			                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
			                Prodotti
			                <span><%= (prodRel+vidRel) %></span>
			              </li>
			              <li class="list-group-item d-flex justify-content-between align-items-center px-0">
			                Spedizione
			                <span>5.99 &#8364</span>
			              </li>
			              <li
			                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
			                <div>
			                  <strong>Totale </strong>
			                  <strong>
			                    <p class="mb-0">(IVA inclusa)</p>
			                  </strong>
			                </div>
			                <span><strong><%= (prodRel+vidRel+5.99f) %> &#8364</strong></span>
			              </li>
			            </ul>
			
			            <button type="button" class="btn btn-primary btn-lg btn-block">
			              Vai al checkout
			            </button>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
		</section>
		<%} %>
	
		<%@include file="/fragments/footer.jsp" %>
	</body>
</html>
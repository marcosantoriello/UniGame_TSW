<%@ page language="java" import="it.unisa.unigame.model.interfaceDS.ComprendeOP,it.unisa.unigame.model.interfaceDS.ComprendeOV,it.unisa.unigame.model.DAO.ComprendeOVDS,it.unisa.unigame.model.bean.ComprendeOVBean,it.unisa.unigame.model.bean.ComprendeOPBean,it.unisa.unigame.model.bean.ComprendeOPBean,it.unisa.unigame.model.DAO.ComprendeOPDS,it.unisa.unigame.model.bean.VideogiocoBean,it.unisa.unigame.model.bean.ProdottoFisicoBean,it.unisa.unigame.model.DAO.ProdottoFisicoDS,it.unisa.unigame.model.DAO.VideogiocoDS,it.unisa.unigame.model.interfaceDS.ProdottoFisico,it.unisa.unigame.model.interfaceDS.Videogioco,it.unisa.unigame.model.bean.OrdineBean, it.unisa.unigame.model.bean.GestoreAssistenzaBean,java.util.Collection,it.unisa.unigame.model.bean.TelefonoBean, it.unisa.unigame.model.bean.AmministratoreBean,it.unisa.unigame.model.interfaceDS.Telefono, it.unisa.unigame.model.DAO.TelefonoDS,it.unisa.unigame.model.bean.ClienteBean,javax.sql.DataSource "  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unigame | Thank you</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<% 	
			ClienteBean utente=(ClienteBean) session.getAttribute("utente");
			DataSource ds = (DataSource) getServletContext().getAttribute("DataSource"); 
			Telefono tel= new TelefonoDS(ds);
			ComprendeOP op= new ComprendeOPDS(ds);
			ComprendeOV ov= new ComprendeOVDS(ds);
			OrdineBean order= (OrdineBean) session.getAttribute("odine");
			Collection<TelefonoBean> telbean= tel.doRetrieveAll(null);
			Collection<ComprendeOPBean> prodotti= (Collection<ComprendeOPBean>) op.doRetrieveAll(null);
			Collection<ComprendeOVBean> videogiochi= (Collection<ComprendeOVBean>) ov.doRetrieveAll(null);
			
			
			
		%>
<body>
	<script>
		function redirectToJSP(var page){
			window.location.href=page;
		}	
	</script>
	
  <div class="card">
    <div class="card-body mx-4">
      <div class="container">
        <p class="my-5 mx-5" style="font-size: 30px;">Grazie per il tuo acquisto</p>
        <div class="row">
          <ul class="list-unstyled">
            <li class="text-black"><%= utente.getNome()%> <%=utente.getCognome() %></li>
            <% for(TelefonoBean bean : telbean){ %>
            <li class="text-muted mt-1"><span class="text-black"><%= bean.getNumero() %></li>
            <%} %>
            <li class="text-black mt-1"><%=order.getData_e_ora() %></li>
          </ul>
          <hr>
          
          <% for(ComprendeOPBean bean: prodotti){
        	  //crea il datasource
        	  ProdottoFisico prodDS= new ProdottoFisicoDS(ds);
        	  //si fa restituire la collezione di prdotti fisici
  				ProdottoFisicoBean prod=prodDS.doRetrieveByKey(bean.getProdotto());
  					
        			  
        	  
        	  %>
         
          
          
          <div class="col-xl-10">
            <p><%= prod.getNome() %></p>
          </div>
          <div class="col-xl-2">
            <p class="float-end"><%= prod.getPrezzo() %> &euro;
            </p>
          </div>
          <hr>
        </div>
        <%} %>
        <% for(ComprendeOVBean bean: videogiochi){
        	Videogioco vidDS= new VideogiocoDS(ds);
			VideogiocoBean vid= vidDS.doRetrieveByKey(bean.getVideogioco());
        	  
        	  %>
         
          
          
          <div class="col-xl-10">
            <p><%= vid.getNome() %></p>
          </div>
          <div class="col-xl-2">
            <p class="float-end"><%= vid.getPrezzo() %> &euro;
            </p>
          </div>
          <hr>
        </div>
        <%} %>
        
        <div class="row">
          <div class="col-xl-10">
            <p>Spedizione</p>
          </div>
          <div class="col-xl-2">
            <p class="float-end">5.99 &euro
            </p>
          </div>
          <hr style="border: 2px solid black;">
        </div>
        <div class="row text-black">

          <div class="col-xl-12">
            <p class="float-end fw-bold">Total: <%=order.getImporto_totale() %> &euro
            </p>
          </div>
          <hr style="border: 2px solid black;">
        </div>
		<button type="button" class="btn btn-primary text-capitalize"
              style="background-color:#60bdf3 ;" onclick="redirectToJSP(thankyouPage.jsp)">Avanti</button>
      </div>
    </div>
  </div>
</body>
package it.unisa.unigame.control;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.ComprendeOPDS;
import it.unisa.unigame.model.DAO.ComprendeOVDS;
import it.unisa.unigame.model.DAO.OrdineDS;
import it.unisa.unigame.model.bean.Carrello;
import it.unisa.unigame.model.bean.ClienteBean;
import it.unisa.unigame.model.bean.ComprendeOPBean;
import it.unisa.unigame.model.bean.ComprendeOVBean;
import it.unisa.unigame.model.bean.OrdineBean;
import it.unisa.unigame.model.bean.ProdottoFisicoBean;
import it.unisa.unigame.model.bean.VideogiocoBean;
import it.unisa.unigame.model.interfaceDS.ComprendeOP;
import it.unisa.unigame.model.interfaceDS.ComprendeOV;
import it.unisa.unigame.model.interfaceDS.Ordine;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteBean cliente = (ClienteBean) request.getSession().getAttribute("utente");
		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
		float totale =  carrello.getTotale();
		
		
		Collection<VideogiocoBean> videogiochi = carrello.getVideogames();
		Collection<ProdottoFisicoBean> prodotti = carrello.getProdottiFisici();
		
		String cf = cliente.getCodice_fiscale();
		//momento del pagamento
		long numCarta = Long.parseLong(request.getParameter("cc-number"));
		
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Ordine ordine = new OrdineDS(ds);
		OrdineBean beanOrder= new OrdineBean();
		//comprendeOvDS e comprendeOPDS
		ComprendeOV vidDS= new ComprendeOVDS(ds);
		ComprendeOP prodDS= new ComprendeOPDS(ds);
		ComprendeOPBean beanOP= new ComprendeOPBean();
		ComprendeOVBean beanOV= new ComprendeOVBean();
		
    	int min = 100000;
		int max = 999999;
    	int id = (int) (Math.random() * (max - min)) + min;
    	
    	//genero l'id  lo converto in int
    	int random = creaIdOrdine();
    	beanOrder.setCodice_fiscale(cf);
    	beanOrder.setNum_carta(numCarta);
    	beanOrder.setImporto_totale(totale);
    	beanOrder.setId(random);
    	beanOrder.setData_e_ora(LocalDateTime.now());
    	
    	try {
    		//salva nel nostro ordine
    		ordine.doSave(beanOrder);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	    	
		for(ProdottoFisicoBean prod : prodotti){
			try {
				//per ogni prodottofisico acquistato, crea una query in COMPRENDEOPDS
				
				beanOP.setOrdine(random);
				beanOP.setProdotto(prod.getId());
				prodDS.doSave(beanOP);
				prod.setQuantità((prod.getQuantità()-1));
				if(prod.getQuantità()==0)
					prod.setDisponibilità(false);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		for(VideogiocoBean vid : videogiochi){
			try {
				//per ogni videgioco acquistato, crea una query in COMPRENDEOVDS
				
				beanOV.setOrdine(random);
				beanOV.setVideogioco(vid.getId());
				vidDS.doSave(beanOV);
				vid.setQuantità((vid.getQuantità()-1));
				if(vid.getQuantità()==0)
					vid.setDisponibilità(false);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		//crea un nuovo carrello ogni volta eseguito un ordine
		request.getSession().setAttribute("carrello", new Carrello(ds));
		
		//PER LA FATTURA CI FACCIAMO PASSARE UN PARAMETRO DALLA JSP PER VEDERE SE VUOLE LA FATTURA O MENO
		System.out.println("fatturaaa"+request.getAttribute("fattura"));
		if(request.getSession().getAttribute("fattura").equals(true)) {
			request.getSession().setAttribute("ordine", beanOrder);
			request.getSession().setAttribute("op", prodotti);
			request.getSession().setAttribute("ov", videogiochi);
			response.sendRedirect(request.getContextPath()+"/Fattura.jsp");
		}
		
	
		response.sendRedirect(request.getContextPath()+"/ThankYouPage.jsp");
		
	}
	
	public static int creaIdOrdine() {
		Random random = new Random();
        return random.nextInt(900) + 100;
	}

}

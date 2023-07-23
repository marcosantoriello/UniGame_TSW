package it.unisa.unigame.control;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.unigame.model.bean.Carrello;


/**
 * Servlet implementation class AggiungiCarrello
 */
@WebServlet("/AggiungiCarrello")
public class AggiungiCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiCarrello() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ruolo = (String) request.getSession().getAttribute("ruolo");
		System.out.println("ruolo=" +ruolo);
		
		if(ruolo != null) {
			Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
			//mi faccio passare l'id e la quantità in questione dalla jsp
			String id_p = (String) request.getParameter("id");
			int id = Integer.parseInt(id_p);
			String tipo = (String) request.getParameter("tipo");
			//in base alla quantità selezionata
			System.out.println(tipo);
			//nel caso in cui sia un videogioco
			if(tipo.equals("videogioco")) {
				
				//lo aggiungo al carrello
				carrello.addVideogame(id);
				response.sendRedirect(request.getContextPath() + "/Catalogo.jsp");
			}
			else {
					
				//lo aggiungo al carrello
				carrello.addProduct(id);
				response.sendRedirect(request.getContextPath() + "/CatalogoGadget.jsp");
			}
			
				
		}
		//nel caso in cui non sia loggato non può accedere al carrello
		else {
			response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
			return;
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

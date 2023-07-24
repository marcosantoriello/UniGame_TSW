package it.unisa.unigame.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.unigame.model.bean.Carrello;

/**
 * Servlet implementation class RimuoviCarrello
 */
@WebServlet("/RimuoviCarrello")
public class RimuoviCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RimuoviCarrello() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Carrello carrello = (Carrello)request.getSession().getAttribute("carrello");
		int id =(int) request.getAttribute("id");
		String tipo= (String) request.getAttribute("tipo");
		
		if(tipo.equals("videogame")) {
			carrello.removeVideogame(id);
		}
		else
			carrello.removeProduct(id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

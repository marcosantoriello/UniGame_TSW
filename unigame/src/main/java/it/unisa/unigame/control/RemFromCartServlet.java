package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.ProdottoFisicoDS;
import it.unisa.unigame.model.DAO.VideogiocoDS;
import it.unisa.unigame.model.bean.Carrello;

/**
 * Servlet implementation class RemFromCartServlet
 */
@WebServlet("/RemFromCartServlet")
public class RemFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Carrello carrello = (Carrello)request.getSession().getAttribute("carrello");
		int idV = Integer.parseInt(request.getParameter("idV"));
		int idP = Integer.parseInt(request.getParameter("idP"));
		boolean isVid; //true = videogioco, false = prodotto
		VideogiocoDS vidDS = new VideogiocoDS(ds);
		
		if (idV != 0) {
			isVid = true; 
			}
		else {
			isVid = false;
		}
		if(isVid) {
			System.out.println("Rimuovo Videogioco");
			carrello.removeVideogame(idV);
		}else {
			System.out.println("Rimuovo Videogioco");
			carrello.removeProduct(idP);
		}
		
		response.sendRedirect(request.getContextPath() + "/carrello.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import java.util.*;

import it.unisa.unigame.model.DAO.ProdottoFisicoDS;
import it.unisa.unigame.model.DAO.VideogiocoDS;
import it.unisa.unigame.model.bean.Carrello;
import it.unisa.unigame.model.bean.ProdottoFisicoBean;
import it.unisa.unigame.model.bean.VideogiocoBean;


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
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		if(ruolo != null) {
			Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
			int id = Integer.parseInt(request.getParameter("id"));
			String tipo = request.getParameter("tipo");
			if(tipo.equals("prodotto")) {
				ProdottoFisicoDS prodDS = new ProdottoFisicoDS(ds);
				ProdottoFisicoBean prodBean = null;
				try {
					prodBean = prodDS.doRetrieveByKey(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Collection<ProdottoFisicoBean> colAbb = carrello.getProdottiFisici();
				if(!colAbb.contains(prodBean)) {
					carrello.addProduct(id);
				}else {
					response.sendRedirect(request.getContextPath() + "/errorPege.jsp");
					return;
				}
				
			}else {
				VideogiocoDS vidDS = new VideogiocoDS(ds);
				VideogiocoBean vidBean = null;
				try {
					vidBean = vidDS.doRetrieveByKey(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Collection<VideogiocoBean> colVid = carrello.getVideogames();
				if(!colVid.contains(vidBean)) {
					carrello.addVideogame(id);
				}else {
					response.sendRedirect(request.getContextPath() + "/errorPege.jsp");
					return;
				}
				
			}
			
			response.sendRedirect(request.getContextPath() + "/carrello.jsp");
		}else {
			response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
		}
		
	}
		
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

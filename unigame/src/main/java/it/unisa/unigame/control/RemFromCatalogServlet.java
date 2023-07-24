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
import it.unisa.unigame.model.bean.ProdottoFisicoBean;
import it.unisa.unigame.model.bean.VideogiocoBean;

/**
 * Servlet implementation class RemFromCatalogServlet
 */
@WebServlet("/RemFromCatalogServlet")
public class RemFromCatalogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemFromCatalogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		
		
		String id_p = (String) request.getParameter("id");
		int id = Integer.parseInt(id_p);
		System.out.println(id);
		String tipo = (String) request.getParameter("tipo");
		System.out.println(tipo);
		if (tipo.equals("videogioco")) { //RIMUOVO VIDEOGIOCO
			VideogiocoDS vidDS = new VideogiocoDS(ds);
			try {
				VideogiocoBean vidBean = (VideogiocoBean) vidDS.doRetrieveByKey(id);
				vidBean.setDisponibilità(false);
				vidDS.doUpdate(vidBean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/CatalogoAdmin.jsp");
		} else { //RIMUOVO PRODOTTO FISICO
			ProdottoFisicoDS prodDS = new ProdottoFisicoDS(ds);
			try {
				ProdottoFisicoBean prodBean = (ProdottoFisicoBean) prodDS.doRetrieveByKey(id);
				prodBean.setDisponibilità(false);
				prodDS.doUpdate(prodBean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/CatalogoGadgetAdmin.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

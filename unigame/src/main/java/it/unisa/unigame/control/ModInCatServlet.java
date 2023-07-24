package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.unigame.model.DAO.ProdottoFisicoDS;
import it.unisa.unigame.model.DAO.VideogiocoDS;
import it.unisa.unigame.model.bean.ProdottoFisicoBean;
import it.unisa.unigame.model.bean.VideogiocoBean;
import it.unisa.unigame.model.bean.VideogiocoBean.Pegi;

/**
 * Servlet implementation class ModInCatServlet
 */
@WebServlet("/ModInCatServlet")
public class ModInCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModInCatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		
		if (request.getParameter("tipo").equals("videogioco")) {
			String nome = request.getParameter("nome-vid");
			int codVid = Integer.parseInt(request.getParameter("cod-vid"));
			int annoProd = Integer.parseInt(request.getParameter("annoProd"));
			int costo = Integer.parseInt(request.getParameter("costo"));
			int quant = Integer.parseInt(request.getParameter("quantita-vid"));
			Pegi pegi = Pegi.valueOf(request.getParameter("pegi"));
			
			VideogiocoDS vidDS = new VideogiocoDS(ds);
			VideogiocoBean vidBean;
			try {
				vidBean = vidDS.doRetrieveByKey(codVid);
				vidBean.setAnno_produzione(annoProd);
				vidBean.setNome(nome);
				vidBean.setPrezzo(costo);
				vidBean.setQuantità(quant);
				vidBean.setPegi(pegi);
				vidDS.doUpdate(vidBean);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			response.sendRedirect(request.getContextPath() + "/CatalogoAdmin.jsp");
		} else {
			int codProd = Integer.parseInt(request.getParameter("cod-prod"));
			int prezzo = Integer.parseInt(request.getParameter("costo"));
			int quantitaProd = Integer.parseInt(request.getParameter("quantita-prod"));
			ProdottoFisicoDS prodDS = new ProdottoFisicoDS(ds);
			ProdottoFisicoBean prodBean;
			try {
				prodBean = prodDS.doRetrieveByKey(codProd);
				prodBean.setPrezzo(prezzo);
				prodBean.setQuantità(quantitaProd);
				prodDS.doUpdate(prodBean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect(request.getContextPath() + "/CatalogoGadgetAdmin.jsp");
			
		}
		
	}

}

package it.unisa.unigame.control;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.VideogiocoDS;
import it.unisa.unigame.model.bean.AmministratoreBean;
import it.unisa.unigame.model.bean.VideogiocoBean;
import it.unisa.unigame.model.bean.VideogiocoBean.Pegi;

/**
 * Servlet implementation class AddInCatServlet
 */
@WebServlet("/AddInCatServlet")
public class AddInCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInCatServlet() {
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
		
		int codVid = 0;
		int codProd = 0;
		
		if (request.getParameter("tipo").equals("videogioco")) {
			String nome = request.getParameter("nome-vid");
			codVid = Integer.parseInt(request.getParameter("cod-vid"));
			System.out.println(codVid);
			int annoProd = Integer.parseInt(request.getParameter("annoProd"));
			int prezzo = Integer.parseInt(request.getParameter("costo"));
			System.out.println(prezzo);
			int qnt = Integer.parseInt(request.getParameter("quantita"));
			String softHouse = request.getParameter("softHouse");
			Pegi pegi = Pegi.valueOf(request.getParameter("pegi"));
			
			Part part = request.getPart("inputImage");
			String nomeImg = "video_"+codVid+".jpg";
			System.out.println(nomeImg);
			
			String path = getServletContext().getRealPath("/"+"images"+"/"+"Videogiochi"+File.separator+nomeImg);
			System.out.println(path);
	        part.write(path);
	        
	        VideogiocoDS vidDS = new VideogiocoDS(ds);
	        VideogiocoBean vidBean = new VideogiocoBean (codVid, nome, prezzo, qnt, true, pegi, annoProd, softHouse);
	        try {
				vidDS.doSave(vidBean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	        response.sendRedirect(request.getContextPath() + "/CatalogoAdmin.jsp");
		}
	}

}

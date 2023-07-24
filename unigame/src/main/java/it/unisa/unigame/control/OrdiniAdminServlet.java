package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.OrdineDS;
import it.unisa.unigame.model.bean.ClienteBean;
import it.unisa.unigame.model.bean.OrdineBean;
import it.unisa.unigame.model.interfaceDS.Ordine;


/**
 * Servlet implementation class FiltraOrdiniData
 */
@WebServlet("/OrdiniAdminServlet")
public class OrdiniAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdiniAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		ClienteBean clBean = (ClienteBean) request.getSession().getAttribute("utente");
		String first = request.getParameter("first");
		String last = request.getParameter("last");
		
		Ordine ordini = new OrdineDS(ds);
		Collection<OrdineBean> colAcq = null;
		try {
			colAcq = ordini.doRetrieveAllDate( first, last);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("text/html");
		request.setAttribute("orderList", colAcq);
		request.getRequestDispatcher("Ordini.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.TicketDS;
import it.unisa.unigame.model.bean.TicketBean;
import it.unisa.unigame.model.interfaceDS.Ticket;

/**
 * Servlet implementation class TicketRisolto
 */
@WebServlet("/TicketRisolto")
public class TicketRisolto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketRisolto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		TicketBean risolto=new TicketBean();
		Ticket ticketDS = new TicketDS(ds);
		try {
			risolto= ticketDS.doRetrieveByKey(id);
			risolto.setRisolto(true);
			ticketDS.doUpdate(risolto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ticketGestore.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

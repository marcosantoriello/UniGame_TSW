package it.unisa.unigame.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.mysql.cj.Session;

import it.unisa.unigame.model.DAO.ClienteDS;
import it.unisa.unigame.model.DAO.TicketDS;
import it.unisa.unigame.model.bean.ClienteBean;
import it.unisa.unigame.model.bean.TicketBean;
import it.unisa.unigame.model.bean.TicketBean.Categoria;
import it.unisa.unigame.model.interfaceDS.Cliente;
import it.unisa.unigame.model.interfaceDS.Ticket;

/**
 * Servlet implementation class TicketCreato
 */
@WebServlet("/TicketCreato")
public class TicketCreato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketCreato() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        Categoria category = Categoria.valueOf(request.getParameter("category"));
        String requestBody = request.getParameter("requestBody");
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		TicketBean ticket=new TicketBean();
		Ticket ticketDS = new TicketDS(ds);
		Cliente user= new ClienteDS(ds);
		ClienteBean userBean= (ClienteBean)request.getSession().getAttribute("utente") ;
		try {
			String cf=userBean.getCodice_fiscale();
			ticket.setCliente(cf);
			ticket.setMessaggio(requestBody);
			ticket.setData_e_ora(LocalDateTime.now());
			ticket.setCategory(category);
			ticket.setNum_ticket(0);
			ticket.setRisolto(false);
			ticketDS.doSave(ticket);
			System.out.println("mess="+ticket.getMessaggio());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		response.sendRedirect(request.getContextPath()+"/ticketEffettuato.jsp");
	}

}

package it.unisa.unigame.control;

import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.ClienteDS;
import it.unisa.unigame.model.DAO.TelefonoDS;
import it.unisa.unigame.model.bean.Carrello;
import it.unisa.unigame.model.bean.ClienteBean;
import it.unisa.unigame.model.bean.TelefonoBean;
import it.unisa.unigame.model.interfaceDS.Cliente;
import it.unisa.unigame.model.interfaceDS.Telefono;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String redirectedPage;
		
		String codFis = request.getParameter("codFis");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String indFatt = request.getParameter("indFatt");
		String tel1 = request.getParameter("tel1");
		String data = request.getParameter("data");

//creo un bean con i dati passati dal cliente che vuole creare l'account
		ClienteBean clienteBean = new ClienteBean(codFis, nome, cognome,username, email, password, indFatt,LocalDate.parse(data));
		TelefonoBean telBean1 = null;
		telBean1 = new TelefonoBean(Integer.valueOf(tel1), codFis);

//Creo il datasource per la connessione al db con i rispettivi oggetti per effettuare il doSave (insert nel db)
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Cliente clDS = new ClienteDS(ds);
		Telefono telDS = new TelefonoDS(ds);
		
		try {
			clDS.doSave(clienteBean);
			telDS.doSave(telBean1);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
//setto l'attributo della sessione con il ruolo "cliente" e creo il nuovo carrello per il nuovo cliente		
		try {
			request.getSession().setAttribute("utente", clienteBean);
			request.getSession().setAttribute("roles", "cliente");
			request.getSession().setAttribute("carrello", new Carrello(ds));
			
			redirectedPage = "/index.jsp";
			
		} catch (Exception e) {
//se qualcosa è andato storto reindirizzo alla signup page
			request.getSession().setAttribute("roles", null);
			redirectedPage = "/signupPage.jsp";
		}
		response.sendRedirect(request.getContextPath() + redirectedPage);
	}

}

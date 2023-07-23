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

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import it.unisa.unigame.model.DAO.RecensioneDS;
import it.unisa.unigame.model.bean.ClienteBean;
import it.unisa.unigame.model.bean.RecensioneBean;
import it.unisa.unigame.model.bean.RecensioneBean.Indice_gradimento;
import it.unisa.unigame.model.interfaceDS.Recensione;
import java.util.*;

/**
 * Servlet implementation class RecensioneServlet
 */
@WebServlet("/RecensioneServlet")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecensioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruolo = (String) request.getSession().getAttribute("ruolo");
		if(ruolo == null) {
			response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
		}else if(ruolo.equals("supVid")) {
			response.sendRedirect(request.getContextPath() + "/ticketGestore.jsp");
		}else if(ruolo.equals("cliente")){
			DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
			Recensione recDS = new RecensioneDS(ds);
			ClienteBean cliente = (ClienteBean) request.getSession().getAttribute("utente");
			String codiceVid_p = request.getParameter("id");
			int codiceVid = Integer.parseInt(codiceVid_p);
			String descrizione = (String) request.getParameter("textArea");
			Random random = new Random();
			
			Indice_gradimento indGrad = Indice_gradimento.valueOf(request.getParameter("valutazione"));
			try {
				recDS.doSave(new RecensioneBean(random.nextInt(), cliente.getCodice_fiscale(), codiceVid, LocalDateTime.now(), descrizione, indGrad));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/prodottoVideogioco.jsp?id=" + codiceVid);
		}else {
			response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
		}
		
	}

}
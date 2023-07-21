package it.unisa.unigame.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeImg = request.getParameter("immagine");
		System.out.println("Sono nella servlet");
		System.out.println("Nome immagine:" + nomeImg);
		if (!nomeImg.contains("prodotto")) { //immagine videogioco
			String path = getServletContext().getRealPath("/"+"images"+"/"+"Videogioco"+File.separator+nomeImg);
			response.setContentType("/image/*"); //setto il tipo di contenuto restituito
			File file = new File(path);
			if(!file.exists()) {
				System.out.println("FILE NON TROVATO!");
				response.sendError(404); //file non trovato
			}
			else {
				System.out.println("FILE TROVATO!");
				FileInputStream is = new FileInputStream(file);
				response.getOutputStream().write(is.readAllBytes());
				is.close();
			}
		} else { //immagine prodotto fisico
			String path = getServletContext().getRealPath("/"+"images"+"/"+"ProdottiFisici"+File.separator+nomeImg);
			response.setContentType("/image/*");
			File file = new File(path);
			if (!file.exists()) { //file non trovato
				response.sendError(404);
			}
			else {
				FileInputStream is = new FileInputStream(file);
				response.getOutputStream().write(is.readAllBytes());
				is.close();
			}
		}
	}

}

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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeImg = request.getParameter("immagine");
		//System.out.println("Nome Immagine: " + nomeImg);
		if(!nomeImg.contains("prodotto")){
			String path = getServletContext().getRealPath("/"+"images"+"/"+"Videogiochi"+File.separator+nomeImg);
			//System.out.println("Percorso: " + path);
			response.setContentType("image/*");
			File file = new File(path);
			if(!file.exists()) {
				response.sendError(404);
			}else {
				FileInputStream is = new FileInputStream(file);
				response.getOutputStream().write(is.readAllBytes());
				is.close();
			}
		}else {
			String path = getServletContext().getRealPath("/"+"images"+"/"+"ProdottiFisici"+File.separator+nomeImg);
			response.setContentType("image/*");
			File file = new File(path);
			if(!file.exists()) {
				response.sendError(404);
			}else {
				FileInputStream is = new FileInputStream(file);
				response.getOutputStream().write(is.readAllBytes());
				is.close();
			}
		}
	}


}

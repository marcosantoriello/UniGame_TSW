package it.unisa.unigame.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.*;
import it.unisa.unigame.model.bean.*;
import it.unisa.unigame.model.bean.VideogiocoBean.Pegi;

/**
 * Servlet implementation class ServletPopolamento
 */
@WebServlet("/ServletPopolamento")
public class ServletPopolamento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPopolamento() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<h3>Popolamento effettuato correttamente</h3>");
		
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		
		//Datasources
		VideogiocoDS vidDs = new VideogiocoDS(ds);
		SoftwareHouseDS shDs = new SoftwareHouseDS(ds);
		
		
		//Software-houses
		SoftwareHouseBean sh1 = new SoftwareHouseBean("Bethesda", "USA", LocalDate.of(1986, 7, 10));
		SoftwareHouseBean sh2 = new SoftwareHouseBean("Ea Sports", "USA", LocalDate.of(1982, 5, 27));
		SoftwareHouseBean sh3 = new SoftwareHouseBean("Epic Games", "USA", LocalDate.of(1991, 1, 15));
		SoftwareHouseBean sh4 = new SoftwareHouseBean("Rockstar Games", "USA", LocalDate.of(1998, 12, 1));
		SoftwareHouseBean sh5 = new SoftwareHouseBean("Ubisoft", "France", LocalDate.of(1986, 3, 28));
		
		
		try {
			shDs.doSave(sh1);
			shDs.doSave(sh2);
			shDs.doSave(sh3);
			shDs.doSave(sh4);
			shDs.doSave(sh5);
		} catch(SQLException e) {
			
		}
		
		//Videogiochi
		VideogiocoBean vid1 = new VideogiocoBean(894354, "Skyrim", 40, 10, true, Pegi.diciotto, 2011,"Bethesda");
		VideogiocoBean vid2 = new VideogiocoBean(563945, "Fallout 4", 60, 15, true, Pegi.diciotto, 2015, "Bethesda");
		VideogiocoBean vid3 = new VideogiocoBean(660563, "FIFA 22", 55, 45, true, Pegi.tre, 2022, "Ea Sports");
		VideogiocoBean vid4 = new VideogiocoBean(877675, "F1 22", 10, 30, true, Pegi.tre, 2022, "Ea Sports");
		VideogiocoBean vid5 = new VideogiocoBean(266305, "NHL 21", 26, 15, true, Pegi.tre, 2022, "Ea Sports");
		VideogiocoBean vid6 = new VideogiocoBean(139909, "Fortnite", 80, 100, true, Pegi.dodici, 2017, "Epic Games");
		VideogiocoBean vid7 = new VideogiocoBean(749511, "Rocket League", 13, 55, true, Pegi.tre, 2015, "Epic Games");
		VideogiocoBean vid8 = new VideogiocoBean(366781, "Fall Guys", 22, 40, true, Pegi.tre, 2019, "Epic Games");
		VideogiocoBean vid9 = new VideogiocoBean(883936, "Unreal Tournament", 20, 30, false, Pegi.sette, 2017, "Epic Games");
		VideogiocoBean vid10 = new VideogiocoBean(693302, "GTA V",  80, 150, true, Pegi.diciotto, 2013, "Rockstar Games");
		VideogiocoBean vid11 = new VideogiocoBean(199327, "Red Dead Redemption 2", 70, 90, true, Pegi.diciotto, 2018, "Rockstar Games");
		VideogiocoBean vid12 = new VideogiocoBean(962365, "Bully", 15, 5, true, Pegi.diciotto, 2006, "Rockstar Games");
		VideogiocoBean vid13 = new VideogiocoBean(837385,  "Max Payne 3", 30, 3, false, Pegi.diciotto, 2012, "Rockstar Games");
		VideogiocoBean vid14 = new VideogiocoBean(375247,  "The Italian Job", 30, 1, true, Pegi.diciotto, 2001, "Rockstar Games");
		VideogiocoBean vid15 = new VideogiocoBean(898498,  "Rainbow Six Siege", 45, 50, true, Pegi.diciotto, 2015, "Ubisoft");
		VideogiocoBean vid16 = new VideogiocoBean(446002,  "Assassin's Creed: Valhalla", 80, 60, true, Pegi.diciotto, 2020, "Ubisoft");
		VideogiocoBean vid17 = new VideogiocoBean(592956, "Far Cry 6", 60, 60, true, Pegi.diciotto, 2021, "Ubisoft");
		VideogiocoBean vid18 = new VideogiocoBean(195938, "Watch Dogs 2", 50, 35, true, Pegi.sedici, 2016, "Ubisoft");
		VideogiocoBean vid19 = new VideogiocoBean(228491, "The Division 2", 35, 23, true, Pegi.sedici, 2019, "Ubisoft");
		VideogiocoBean vid20 = new VideogiocoBean(222544, "Assassin's Creed: Odyssey", 65, 8, true, Pegi.diciotto, 2018, "Ubisoft");
		
		
		try {
			vidDs.doSave(vid1);
			vidDs.doSave(vid2);
			vidDs.doSave(vid3);
			vidDs.doSave(vid4);
			vidDs.doSave(vid5);
			vidDs.doSave(vid6);
			vidDs.doSave(vid7);
			vidDs.doSave(vid8);
			vidDs.doSave(vid9);
			vidDs.doSave(vid10);
			vidDs.doSave(vid11);
			vidDs.doSave(vid12);
			vidDs.doSave(vid13);
			vidDs.doSave(vid14);
			vidDs.doSave(vid15);
			vidDs.doSave(vid16);
			vidDs.doSave(vid17);
			vidDs.doSave(vid18);
			vidDs.doSave(vid19);
			vidDs.doSave(vid20);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

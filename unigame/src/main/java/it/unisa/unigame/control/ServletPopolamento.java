package it.unisa.unigame.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.*;
import it.unisa.unigame.model.bean.*;
import it.unisa.unigame.model.bean.RecensioneBean.Indice_gradimento;
import it.unisa.unigame.model.bean.TicketBean.Categoria;
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
		AmministratoreDS ammDs = new AmministratoreDS(ds);
		GestoreAssistenzaDS gestDS = new GestoreAssistenzaDS(ds);
		ClienteDS clDS = new ClienteDS(ds);
		TelefonoDS telDS = new TelefonoDS(ds);
		VideogiocoDS vidDs = new VideogiocoDS(ds);
		SoftwareHouseDS shDs = new SoftwareHouseDS(ds);
		ProdottoFisicoDS prodDS = new ProdottoFisicoDS(ds);
		TicketDS tDS = new TicketDS(ds);
		RecensioneDS rDS = new RecensioneDS(ds);
		OrdineDS orDS = new OrdineDS(ds);
		ComprendeOPDS opDS = new ComprendeOPDS(ds);
		ComprendeOVDS ovDS = new ComprendeOVDS(ds);
		
		
		//Amministratori
		AmministratoreBean amm1 = new AmministratoreBean("CSCCHR80A41H703P", "Chiara", "Coscarelli", "chiara_cos", "c.coscarelli@studenti.unisa.it", "Miao", 50000);
		AmministratoreBean amm2 = new AmministratoreBean("MRANLT80A41F138T", "Nicoletta", "Mauro", "nicas", "n.mauro3@studenti.unisa.it", "Bau", 50000);
		AmministratoreBean amm3 = new AmministratoreBean("SNTMRC80A01F138E", "Marco", "Santoriello", "marcus", "m.santoriello37@studenti.unisa.it", "Woof", 50000);
		
		//Gestori Assistenza
		GestoreAssistenzaBean gest1 = new GestoreAssistenzaBean("PRTPQL80A01H501C", "Pasquale", "Pratico", "PasqP", "Pratico09@gmail.com", "habuelo", 1500);
		GestoreAssistenzaBean gest2 = new GestoreAssistenzaBean("MMBNRC80A01F138W", "Enrico", "Mambo", "EnriMam", "Mambo98@gmail.com", "Perke", 1200);
		
		//Clienti
		ClienteBean cl1 = new ClienteBean("RSSMRA03A18D615L", "Mario", "Rossi", "MarioRos", "Mario09@gmail.com", "Mariobros09?", "Strada statale 98 n. 23", LocalDate.of(1999, 9, 15));
		ClienteBean cl2 = new ClienteBean("VRDPPL80D13F138U", "Pierpaolo", "Verdi", "PierpV", "pierfuria@gmail.com", "Piervinci32", "Licinella n. 78", LocalDate.of(2002, 2, 6));
		ClienteBean cl3 = new ClienteBean("CRSBCH80A01H501J", "Cristina", "Bianchi", "CrisBi", "Cricri03@gmail.com", "Karen89", "Campo sportivo n. 65", LocalDate.of(2005, 4, 10));
		ClienteBean cl4 = new ClienteBean("TRRRRT80A01H703E", "Roberto", "Della Torre", "RobDT", "RoberTower98@gmail.com", "Milan23", "Giuseppe Garibaldi n. 19", LocalDate.of(2000, 11, 25));
		ClienteBean cl5 = new ClienteBean("RFFDNC05A54H501O", "Raffaella", "Domenichino", "RaffDom", "Ohraffy90@gmail.com", "MVM87!", "Via Pacchianella n. 76", LocalDate.of(2010, 7, 7));
		
		//Telefono
		TelefonoBean tel1 = new TelefonoBean(3478923561L, "RSSMRA03A18D615L");
		TelefonoBean tel2 = new TelefonoBean(3267810342L, "VRDPPL80D13F138U");
		TelefonoBean tel3 = new TelefonoBean(3792611712L, "CRSBCH80A01H501J");
		TelefonoBean tel4 = new TelefonoBean(3221411583L, "TRRRRT80A01H703E");
		TelefonoBean tel5 = new TelefonoBean(3476791862L, "RFFDNC05A54H501O");
		
		//Software-houses
		SoftwareHouseBean sh1 = new SoftwareHouseBean("Bethesda", "USA", LocalDate.of(1986, 7, 10));
		SoftwareHouseBean sh2 = new SoftwareHouseBean("Ea Sports", "USA", LocalDate.of(1982, 5, 27));
		SoftwareHouseBean sh3 = new SoftwareHouseBean("Epic Games", "USA", LocalDate.of(1991, 1, 15));
		SoftwareHouseBean sh4 = new SoftwareHouseBean("Rockstar Games", "USA", LocalDate.of(1998, 12, 1));
		SoftwareHouseBean sh5 = new SoftwareHouseBean("Ubisoft", "France", LocalDate.of(1986, 3, 28));
		
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
		
		//Prodotti Fisici
		ProdottoFisicoBean prod1 = new ProdottoFisicoBean(238675, "Funko Pop Taz", 16, 3, true);
		ProdottoFisicoBean prod2 = new ProdottoFisicoBean(234978, "Peluche Pokemon Piakchu", 25, 5, true);
		ProdottoFisicoBean prod3 = new ProdottoFisicoBean(177123, "Peluche Pokemon Charmander", 79, 4, true);
		ProdottoFisicoBean prod4 = new ProdottoFisicoBean(145690, "Cable guy Crash", 29, 2, true);
		ProdottoFisicoBean prod5 = new ProdottoFisicoBean(901122, "Astuccio Fortnite", 17, 5, true);
		ProdottoFisicoBean prod6 = new ProdottoFisicoBean(898912, "Xbox Stereo Headset", 49, 0, false);
		ProdottoFisicoBean prod7 = new ProdottoFisicoBean(897246, "Zaino Pokemon", 22,0 , false);
		
		//Tickets
		TicketBean tick1 = new TicketBean(01, LocalDateTime.of(2023, 2, 26,19,23), "RSSMRA03A18D615L", "PRTPQL80A01H501C", Categoria.ordine, "Salve, vorrei sapere a che punto è l’ordine che ho effettuato in data 20/02/23", true);
		TicketBean tick2 = new TicketBean(02, LocalDateTime.of(2023, 12, 26, 22,33), "RSSMRA03A18D615L", "PRTPQL80A01H501C", Categoria.ordine, "Salve, posso sapere l’ordine con id 2376 a che punto è?", false);
		TicketBean tick3 = new TicketBean(03, LocalDateTime.of(2022, 4, 4, 11, 12), "RSSMRA03A18D615L", "PRTPQL80A01H501C", Categoria.ordine, "Buon pomeriggio, mi scuso per il disturbo ma la chiave di attivazione che ho acquistato mi dà un errore", true);
		
		//Ordine
		OrdineBean order1= new OrdineBean(1265,LocalDateTime.of(2023, 02, 23, 22, 45),5635672899376L, 15.98f,"RSSMRA03A18D615L");
		OrdineBean order2= new OrdineBean(2376,LocalDateTime.of(2022, 11, 3, 9, 33),2982435672819L, 90.78f,"VRDPPL80D13F138U");
		OrdineBean order3= new OrdineBean(2341,LocalDateTime.of(2022, 10, 8, 16, 17),1256370982715L, 39.79f,"CRSBCH80A01H501J");
		OrdineBean order4= new OrdineBean(2468,LocalDateTime.of(2023, 01, 13, 23, 55),234516728901L, 129.88f,"TRRRRT80A01H703E");
		OrdineBean order5= new OrdineBean(4211,LocalDateTime.of(2023, 11, 3, 19, 23),2982435672819L, 90.78f,"RSSMRA03A18D615L");
		OrdineBean order6= new OrdineBean(8977,LocalDateTime.of(2023, 04, 2, 12, 56),1115627893098L, 90.78f,"RSSMRA03A18D615L");
		OrdineBean order7= new OrdineBean(4567,LocalDateTime.of(2023, 03, 23, 9, 43),3114255431277L, 90.78f,"CRSBCH80A01H501J");
		
		//ComprendeOP
		ComprendeOPBean cOP0= new ComprendeOPBean(238675,1265);
		ComprendeOPBean cOP1= new ComprendeOPBean(177123,2468);
		ComprendeOPBean cOP2= new ComprendeOPBean(898912,2468);
		ComprendeOPBean cOP3= new ComprendeOPBean(234978,2341);
		ComprendeOPBean cOP4= new ComprendeOPBean(897246,4211);
		ComprendeOPBean cOP5= new ComprendeOPBean(238675,8977);
		ComprendeOPBean cOP6= new ComprendeOPBean(901122,8977);
		ComprendeOPBean cOP7= new ComprendeOPBean(145690,8977);
		
		//ComprendeOV
		ComprendeOVBean cOV0= new ComprendeOVBean(894354,4567);
		ComprendeOVBean cOV1= new ComprendeOVBean(877675,4567);
		ComprendeOVBean cOV2= new ComprendeOVBean(877675,2376);
		ComprendeOVBean cOV3= new ComprendeOVBean(139909,2376);
		ComprendeOVBean cOV4= new ComprendeOVBean(883936,2376);
		ComprendeOVBean cOV5= new ComprendeOVBean(962365,2341);
		ComprendeOVBean cOV6= new ComprendeOVBean(446002,8977);
		
		//Recensione
		RecensioneBean rec1 = new RecensioneBean(1, "VRDPPL80D13F138U", 693302, LocalDateTime.of(2023, 02, 23, 18, 16),"Niente male, non come mi aspettavo però, troppa pubblicità quando poi non è niente di che", Indice_gradimento.tre);
		RecensioneBean rec2 = new RecensioneBean(2, "VRDPPL80D13F138U", 660563, LocalDateTime.of(2023, 03, 13, 12, 15),"Semplicemente, FIFA1", Indice_gradimento.cinque);
		RecensioneBean rec3 = new RecensioneBean(3, "CRSBCH80A01H501J", 446002, LocalDateTime.of(2023, 03, 15, 15, 58),"Favoloso! Lo consiglio!", Indice_gradimento.cinque);
		RecensioneBean rec4 = new RecensioneBean(4, "TRRRRT80A01H703E", 228491, LocalDateTime.of(2023, 04, 10, 10, 33),"Niente male!", Indice_gradimento.quattro);
		RecensioneBean rec5 = new RecensioneBean(5, "RFFDNC05A54H501O", 563945, LocalDateTime.of(2023, 07, 12, 21, 21),"Bene.", Indice_gradimento.cinque);
		RecensioneBean rec6 = new RecensioneBean(6, "RSSMRA03A18D615L", 222544, LocalDateTime.of(2023, 03, 23, 17, 11),"Bel gioco ma troppi bug che andrebbero risolti.", Indice_gradimento.tre);
		try {
			ammDs.doSave(amm1);
			ammDs.doSave(amm2);
			ammDs.doSave(amm3);
			
			gestDS.doSave(gest1);
			gestDS.doSave(gest2);
			
			clDS.doSave(cl1);
			clDS.doSave(cl2);
			clDS.doSave(cl3);
			clDS.doSave(cl4);
			clDS.doSave(cl5);
			
			telDS.doSave(tel1);
			telDS.doSave(tel2);
			telDS.doSave(tel3);
			telDS.doSave(tel4);
			telDS.doSave(tel5);
			
			prodDS.doSave(prod1);
			prodDS.doSave(prod2);
			prodDS.doSave(prod3);
			prodDS.doSave(prod4);
			prodDS.doSave(prod5);
			prodDS.doSave(prod6);
			prodDS.doSave(prod7);
			
			shDs.doSave(sh1);
			shDs.doSave(sh2);
			shDs.doSave(sh3);
			shDs.doSave(sh4);
			shDs.doSave(sh5);
			
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
			
			orDS.doSave(order1);
			orDS.doSave(order2);
			orDS.doSave(order3);
			orDS.doSave(order4);
			orDS.doSave(order5);
			orDS.doSave(order6);
			orDS.doSave(order7);
			
			opDS.doSave(cOP0);
			opDS.doSave(cOP1);
			opDS.doSave(cOP2);
			opDS.doSave(cOP3);
			opDS.doSave(cOP4);
			opDS.doSave(cOP5);
			opDS.doSave(cOP6);
			opDS.doSave(cOP7);
			
			ovDS.doSave(cOV0);
			ovDS.doSave(cOV1);
			ovDS.doSave(cOV2);
			ovDS.doSave(cOV3);
			ovDS.doSave(cOV4);
			ovDS.doSave(cOV5);
			ovDS.doSave(cOV6);
			
			rDS.doSave(rec1);
			rDS.doSave(rec2);
			rDS.doSave(rec3);
			rDS.doSave(rec4);
			rDS.doSave(rec5);
			rDS.doSave(rec6);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

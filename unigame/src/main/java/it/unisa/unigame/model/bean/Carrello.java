package it.unisa.unigame.model.bean;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Objects;

import javax.sql.DataSource;

import it.unisa.unigame.model.DAO.ProdottoFisicoDS;
import it.unisa.unigame.model.DAO.VideogiocoDS;
import it.unisa.unigame.model.interfaceDS.ProdottoFisico;
import it.unisa.unigame.model.interfaceDS.Videogioco;

public class Carrello {

	private Collection<VideogiocoBean> videogames;
	private Collection<ProdottoFisicoBean> prodottiFisici;
	private int totale;
	private Videogioco vidDS;
	private ProdottoFisico prodDS;
	
	
	
	public Carrello(DataSource ds) {
		super();
		this.videogames = new LinkedList<VideogiocoBean>();
		this.prodottiFisici = new LinkedList<ProdottoFisicoBean>();
		this.totale = 0;
		vidDS = new VideogiocoDS(ds);
		prodDS = new ProdottoFisicoDS(ds);
		
	}

	public Collection<VideogiocoBean> getVideogames() {
		return videogames;
	}

	public Collection<ProdottoFisicoBean> getProdottiFisici() {
		return prodottiFisici;
	}

	public int getTotale() {
		return totale;
	}

	public void setTotale(int totale) {
		this.totale = totale;
	}

	@Override
	public String toString() {
		return "Carrello [videogames=" + videogames + ", prodottiFisici=" + prodottiFisici + ", totale=" + totale + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carrello other = (Carrello) obj;
		return Objects.equals(prodottiFisici, other.prodottiFisici) && Objects.equals(videogames, other.videogames)
				&& totale == other.totale;
	}
	
	public void addVideogame(int id) {
		VideogiocoBean vidBean = null;
		try {
			vidBean = vidDS.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		videogames.add(vidBean);
		totale += vidBean.getPrezzo();
	}
	
	public void addProduct(int id) {
		ProdottoFisicoBean prodBean = null;
		try {
			prodBean = prodDS.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		prodottiFisici.add(prodBean);
		totale += prodBean.getPrezzo();
	}
	
	public void removeVideogame(int id) {
		VideogiocoBean vidBean = null;
		try {
			vidBean = vidDS.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		videogames.remove(vidBean);
		totale -= vidBean.getPrezzo();
	}
	
	public void removeProduct(int id) {
		ProdottoFisicoBean prodBean = null;
		try {
			prodBean = prodDS.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		prodottiFisici.remove(prodBean);
		totale -= prodBean.getPrezzo();
	}
	
	public void svuota() {
		videogames = new LinkedList<VideogiocoBean>();;
		prodottiFisici = new LinkedList<ProdottoFisicoBean>();;
		totale = 0;
	}
	
	
}

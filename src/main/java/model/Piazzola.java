package model;

import java.sql.SQLException;

import dao.PiazzolaDao;

public class Piazzola {
	
	int id;
	String tipologia;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipologia() {
		return tipologia;
	}
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	public static boolean registerPrenPiazzola(PrenotazionePiazzola pren) throws ClassNotFoundException {
		return PiazzolaDao.registerPrenPiazzola(pren);
	}
	public static String getTipologiaPiazzola(int id) throws ClassNotFoundException, SQLException {
		return PiazzolaDao.getTipologiaPiazzola(id);
	}

}

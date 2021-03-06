package model;

import java.sql.SQLException;
import dao.CampeggioDao;

public class Campeggio {
	

	public static int searchPiazzolaLibera(String tipologia,String arrivo,String partenza) throws ClassNotFoundException {
		return CampeggioDao.searchPiazzolaLibera(tipologia,arrivo,partenza);
	}
	public static boolean registerUtente(Utente utente) throws ClassNotFoundException {
		return CampeggioDao.registerUtente(utente);
	}
	public static boolean isLogin(String username,String password)  throws ClassNotFoundException, SQLException {
		return CampeggioDao.isLogin(username, password);
	}
	public static boolean usernameUsed(String username) throws ClassNotFoundException, SQLException {
		return CampeggioDao.usernameUsed(username);
	}
	public static boolean verifyCapacitÓEscursione(int id, int numpersone, String giorno) throws ClassNotFoundException {
		return CampeggioDao.verifyCapacitÓEscursione(id, numpersone, giorno);
	}

}

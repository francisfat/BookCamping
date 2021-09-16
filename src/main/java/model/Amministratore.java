package model;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.AmministratoreDao;

public class Amministratore {
	
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public static boolean isLogin(String username,String password)  throws ClassNotFoundException, SQLException {
		return AmministratoreDao.isLogin(username, password);
	}
	public static int monitoraIncassiTotali() throws ClassNotFoundException {
		return AmministratoreDao.monitoraIncassiTotali();
	}
	public static int monitoraIncassiEsc() throws ClassNotFoundException {
		return AmministratoreDao.monitoraIncassiEsc();
	}
	public static int monitoraIncassiCamp() throws ClassNotFoundException {
		return AmministratoreDao.monitoraIncassiCamp();
	}
	public static ArrayList<PrenotazioneEscursione> getDataPrenEsc() throws ClassNotFoundException, SQLException {
		return AmministratoreDao.getDataPrenEsc();		
	}
	public static ArrayList<PrenotazionePiazzola> getDataPrenCamp() throws ClassNotFoundException, SQLException {
		return AmministratoreDao.getDataPrenCamp();
	}
}

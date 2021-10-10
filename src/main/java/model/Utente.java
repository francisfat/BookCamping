package model;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.UtenteDao;

public class Utente {
	
	private int id;
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String nascita;
	private String indirizzo;
	private String città;
	private String paese;
	private String CAP;
	private String cellulare;
	private String email;
	
	public Utente() {
		super();
	}
	
	public Utente(int id, String username, String password, String nome, String cognome, String nascita,
			String indirizzo, String città, String paese, String CAP, String cellulare, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.nascita = nascita;
		this.indirizzo = indirizzo;
		this.città = città;
		this.paese = paese;
		this.CAP = CAP;
		this.cellulare = cellulare;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getNascita() {
		return nascita;
	}
	public void setNascita(String nascita) {
		this.nascita = nascita;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getCittà() {
		return città;
	}
	public void setCittà(String città) {
		this.città = città;
	}
	public String getPaese() {
		return paese;
	}
	public void setPaese(String paese) {
		this.paese = paese;
	}
	public String getCAP() {
		return CAP;
	}
	public void setCAP(String CAP) {
		this.CAP = CAP;
	}
	public String getCellulare() {
		return cellulare;
	}
	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public static ArrayList<Utente> getDataUtente(String username) throws ClassNotFoundException, SQLException {
		return UtenteDao.getDataUtente(username);
	}


}

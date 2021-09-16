package model;

import dao.EscursioneDao;

public class Escursione {
	
	int id;
	String nome;
	String descrizione;
	String guida;
	String oraInizio;
	String oraFine;
	int numPersone;
	int capienzaMax;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getGuida() {
		return guida;
	}
	public void setGuida(String guida) {
		this.guida = guida;
	}
	public String getOraInizio() {
		return oraInizio;
	}
	public void setOraInizio(String oraInizio) {
		this.oraInizio = oraInizio;
	}
	public String getOraFine() {
		return oraFine;
	}
	public void setOraFine(String oraFine) {
		this.oraFine = oraFine;
	}
	public int getNumPersone() {
		return numPersone;
	}
	public void setNumPersone(int numPersone) {
		this.numPersone = numPersone;
	}
	public int getCapienzaMax() {
		return capienzaMax;
	}
	public void setCapienzaMax(int capienzaMax) {
		this.capienzaMax = capienzaMax;
	}

	public static boolean registerPrenEscursione(PrenotazioneEscursione pren) throws ClassNotFoundException {
		return EscursioneDao.registerPrenEscursione(pren);
	}
	
}

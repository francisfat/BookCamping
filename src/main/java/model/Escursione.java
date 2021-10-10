package model;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.EscursioneDao;

public class Escursione {


	private int id;
	private String nome;
	private String descrizione;
	private String guida;
	private String oraInizio;
	private String oraFine;
	private int capienzaMax;
	private int prezzo;
	private String partenza;
	private String durata;

	public Escursione() {
		super();
	}
	
	public Escursione(int id, String nome, String descrizione, String guida, String oraInizio, String oraFine,
			int capienzaMax, int prezzo, String partenza, String durata) {
		super();
		this.id = id;
		this.nome = nome;
		this.descrizione = descrizione;
		this.guida = guida;
		this.oraInizio = oraInizio;
		this.oraFine = oraFine;
		this.capienzaMax = capienzaMax;
		this.prezzo = prezzo;
		this.partenza = partenza;
		this.durata = durata;
	}

	
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

	public int getCapienzaMax() {
		return capienzaMax;
	}

	public void setCapienzaMax(int capienzaMax) {
		this.capienzaMax = capienzaMax;
	}

	public int getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}

	public String getPartenza() {
		return partenza;
	}

	public void setPartenza(String partenza) {
		this.partenza = partenza;
	}

	public String getDurata() {
		return durata;
	}

	public void setDurata(String durata) {
		this.durata = durata;
	}


	public static boolean registerPrenEscursione(PrenotazioneEscursione pren) throws ClassNotFoundException {
		return EscursioneDao.registerPrenEscursione(pren);
	}
	
	public static ArrayList<Escursione> getDataEscursione(int id) throws ClassNotFoundException, SQLException {
		return EscursioneDao.getDataEscursione(id);
	}
	
}

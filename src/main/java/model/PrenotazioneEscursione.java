package model;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.*;
import dao.EscursioneDao;

public class PrenotazioneEscursione {

	private int id;
	private String data;
	private int numPersone;
	private int costoTotale;
	private int id_escursione;
	private int id_utente;
	
	public PrenotazioneEscursione(int id, String data, int numPersone, int costoTotale, int id_escursione,
			int id_utente) {
		super();
		this.id = id;
		this.data = data;
		this.numPersone = numPersone;
		this.costoTotale = costoTotale;
		this.id_escursione = id_escursione;
		this.id_utente = id_utente;
	}
	
	public PrenotazioneEscursione() {
		super();
	}
	
	public int calcolaCosto() throws ParseException {

		int prezzo = 0;
		
		if (id_escursione == 1) {
			ArrayList<Escursione> esc= new ArrayList<Escursione>();	
			try {
				esc.equals(EscursioneDao.getDataEscursione(1));
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			prezzo = esc.get(0).getPrezzo();
		}else {
			ArrayList<Escursione> esc= new ArrayList<Escursione>();	
			try {
				esc.equals(EscursioneDao.getDataEscursione(2));
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			prezzo = esc.get(0).getPrezzo();
		}
		int costo = numPersone*prezzo;
		
		return costo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getNumPersone() {
		return numPersone;
	}
	public void setNumPersone(int numPersone) {
		this.numPersone = numPersone;
	}
	public int getCostoTotale() {
		return costoTotale;
	}
	public void setCostoTotale(int costoTotale) {
		this.costoTotale = costoTotale;
	}
	public int getId_escursione() {
		return id_escursione;
	}
	public void setId_escursione(int id_escursione) {
		this.id_escursione = id_escursione;
	}
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}
}

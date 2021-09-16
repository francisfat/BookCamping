package model;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PrenotazionePiazzola {
	
	int id;
	String partenza;
	String arrivo;
	String numAdulti;
	String numBambini;
	String corrente;
	String postoAuto;
	String postoMoto;
	String note;
	int costoTotale;
	int id_utente;
	int id_piazzola;
	
	public PrenotazionePiazzola() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PrenotazionePiazzola(int id, String arrivo, String partenza, String numAdulti, String numBambini,
			String corrente, String postoAuto, String postoMoto, String note, int costoTotale, int id_utente,
			int id_piazzola) {
		super();
		this.id = id;
		this.partenza = partenza;
		this.arrivo = arrivo;
		this.numAdulti = numAdulti;
		this.numBambini = numBambini;
		this.corrente = corrente;
		this.postoAuto = postoAuto;
		this.postoMoto = postoMoto;
		this.note = note;
		this.costoTotale = costoTotale;
		this.id_utente = id_utente;
		this.id_piazzola = id_piazzola;
	}
	
	public int calcolaCosto() throws ParseException {

		LocalDate startDate = LocalDate.parse(arrivo);
		LocalDate endDate = LocalDate.parse(partenza);
		long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);	// Giorni compresi
		int adulti = Integer.parseInt(numAdulti);
		int bambini = Integer.parseInt(numBambini);
		
		// Costo per persona
		int costo = (int) (bambini*10*daysBetween+adulti*13*daysBetween);
		
		// 	Costo per optional
		if (corrente.equals("si"))
			costo = (int) (costo + 3*daysBetween);
		if (postoAuto.equals("si"))
			costo = (int) (costo + 5*daysBetween);
		if (postoMoto.equals("si"))
			costo = (int) (costo + 3*daysBetween);	
		
		// 	Costo per piazzola
		if (1 <= id_piazzola && id_piazzola <= 3) 
			costo = (int) (costo + 11*daysBetween);
		else if (4 <= id_piazzola && id_piazzola <= 6) 
			costo = (int) (costo + 18*daysBetween);
		else if (7 <= id_piazzola && id_piazzola <= 8) 
			costo = (int) (costo + 22*daysBetween);
		else if (9 <= id_piazzola && id_piazzola <= 10) 
			costo = (int) (costo + 24*daysBetween);	
		
		return costo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPartenza() {
		return partenza;
	}
	public void setPartenza(String partenza) {
		this.partenza = partenza;
	}
	public String getArrivo() {
		return arrivo;
	}
	public void setArrivo(String arrivo) {
		this.arrivo = arrivo;
	}
	public String getNumAdulti() {
		return numAdulti;
	}
	public void setNumAdulti(String numAdulti) {
		this.numAdulti = numAdulti;
	}
	public String getNumBambini() {
		return numBambini;
	}
	public void setNumBambini(String numBambini) {
		this.numBambini = numBambini;
	}
	public String getCorrente() {
		return corrente;
	}
	public void setCorrente(String corrente) {
		this.corrente = corrente;
	}
	public String getPostoMoto() {
		return postoMoto;
	}
	public void setPostoMoto(String postoMoto) {
		this.postoMoto = postoMoto;
	}
	public String getPostoAuto() {
		return postoAuto;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public void setPostoAuto(String postoAuto) {
		this.postoAuto = postoAuto;
	}
	public int getCostoTotale() {
		return costoTotale;
	}
	public void setCostoTotale(int costoTotale) {
		this.costoTotale = costoTotale;
	}
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}
	public int getId_piazzola() {
		return id_piazzola;
	}
	public void setId_piazzola(int id_piazzola) {
		this.id_piazzola = id_piazzola;
	}

}
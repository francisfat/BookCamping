package model;

import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import dao.ListinoDao;

public class PrenotazionePiazzola {
	
	private int id;
	private String checkin;
	private String checkout;
	private String numAdulti;
	private String numBambini;
	private String corrente;
	private String postoAuto;
	private String postoMoto;
	private String note;
	private int costoTotale;
	private int id_utente;
	private int id_piazzola;
	
	public PrenotazionePiazzola() {
		super();
	}

	public PrenotazionePiazzola(int id, String checkin, String checkout, String numAdulti, String numBambini,
			String corrente, String postoAuto, String postoMoto, String note, int costoTotale, int id_utente,
			int id_piazzola) {
		super();
		this.id = id;
		this.checkin = checkin;
		this.checkout = checkout;
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

		LocalDate startDate = LocalDate.parse(checkin);
		LocalDate endDate = LocalDate.parse(checkout);
		long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);	// Giorni compresi
		int adulti = Integer.parseInt(numAdulti);
		int bambini = Integer.parseInt(numBambini);
		
		//----------------------
		// Costo per persona
		//----------------------
		int array[]= {0,0,0,0,0,0,0,0,0};
		try {
			ListinoDao.getListino(array);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		int costo = (int) (bambini*array[5]*daysBetween*+adulti*array[4]*daysBetween);
		//----------------------
		// 	Costo per optional
		//----------------------
		if (corrente.equals("si"))
			costo = (int) (costo + array[6]*daysBetween);
		if (postoAuto.equals("si"))
			costo = (int) (costo + array[8]*daysBetween);
		if (postoMoto.equals("si"))
			costo = (int) (costo + array[7]*daysBetween);	
		//----------------------
		// 	Costo per piazzola
		//----------------------
		if (1 <= id_piazzola && id_piazzola <= 3) 
			costo = (int) (costo + array[0]*daysBetween);
		else if (4 <= id_piazzola && id_piazzola <= 6) 
			costo = (int) (costo + array[1]*daysBetween);
		else if (7 <= id_piazzola && id_piazzola <= 8) 
			costo = (int) (costo + array[2]*daysBetween);
		else if (9 <= id_piazzola && id_piazzola <= 10) 
			costo = (int) (costo + array[3]*daysBetween);	
		
		return costo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
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

	public String getPostoAuto() {
		return postoAuto;
	}

	public void setPostoAuto(String postoAuto) {
		this.postoAuto = postoAuto;
	}

	public String getPostoMoto() {
		return postoMoto;
	}

	public void setPostoMoto(String postoMoto) {
		this.postoMoto = postoMoto;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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
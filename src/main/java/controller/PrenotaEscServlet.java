package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Campeggio;
import model.PrenotazioneEscursione;
import model.Utente;

/**
 * Servlet implementation class PrenotaEscuServlet
 */
@WebServlet("/prenotaesc")
public class PrenotaEscServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
			
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		String alert= "0";						//avviso di allarme
		//------------------Possibili inconvenienti------------------
		// alert = 0 -> no errori
		// alert = 1 -> La data dell'escursione deve essere successiva alla data odierna! 
		// alert = 3 -> Campi obligatori non inseriti!
		// alert = 4 -> Limite massimo di persone raggiunto.
		//--------------------------------------
		
		boolean ok=true;						//variabile locale per verificare la correttezza degli input
		
		// Recupero i dati inseriti dall'utente
		String user = (String) request.getParameter("username");
		String tipo = (String) request.getParameter("tipo_esc");
		String giorno = (String) request.getParameter("giorno");
		String persone = (String) request.getParameter("numeropersone");
		
		SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");

	
		//------------------------------------
		// Check sui campi obbligatori
		//------------------------------------
		if ( ok == true && (giorno.isEmpty() || persone.isEmpty())) {					
			ok = false;
			alert="3";
		}
		//------------------------------------
		// Check sulla data di arrivo e di partenza
		//------------------------------------
		
		try {
			 Date escu = dateParser.parse(giorno);
 	         Calendar calendar = Calendar.getInstance();
 	         Date oggi = calendar.getTime();
 	        boolean verify = escu.before(oggi);
             if (verify == true && ok == true) {	
            	 ok = false;
            	 alert="1";
             }
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//------------------------------------
		// Check disponibilit‡ escursione
		//------------------------------------
		try {
			int npers = Integer.parseInt(persone);
			if (!(Campeggio.verifyCapacit‡Escursione(1,npers, giorno)) && ok == true) {
				ok = false;
				alert = "4";
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		HttpSession currentsession = request.getSession();
			
		if ( ok == true) {
			//------------------------------------
			// ESITO POSITIVO: necessito di salvare i dati nel database
			//------------------------------------
			alert = "0";
			//------------------------------------
			// Creo un'istanza PrenotazioneEscursione.
			//------------------------------------
			PrenotazioneEscursione pren1 = new PrenotazioneEscursione();
			pren1.setId(0);
			int tipo_esc = Integer.parseInt(tipo);
			pren1.setId_escursione(tipo_esc);
			int npersone = Integer.parseInt(persone);
			pren1.setNumPersone(npersone);
			pren1.setData(giorno);
			//------------------------------------
			// Necessito dell'id dell'utente.
			//------------------------------------
			try {
				ArrayList<Utente> listut = Utente.getDataUtente(user);
				int id = listut.get(0).getId();
				pren1.setId_utente(id);
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			try {
				pren1.setCostoTotale(pren1.calcolaCosto());
			} catch (ParseException e2) {
				e2.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//------------------------------------
			// Invio i dati per il riepilogo tra cui:
			//------------------------------------
			// le informazioni dell'utente.
			try {
				ArrayList<Utente> ut = Utente.getDataUtente(user);
				currentsession.setAttribute("ut", ut);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			//------------------------------------
			// le informazioni della prenotazione dell'escursione (pre1)
			//------------------------------------
			currentsession.setAttribute("pren", null);			// Prenotazione piazzola nulla
			currentsession.setAttribute("pren1", pren1);		// Prenotazione escursione non nulla
																// In tal modo il riepilogo capisce
																// che si tratta di una prenotazione di una escursione
			//------------------------------------
			response.sendRedirect("riepilogo.jsp");
		
		} else {
			//------------------------------------
			// ESITO NEGATIVO: ritorno sulla pagina di prenotazione.
			//------------------------------------
			currentsession.setAttribute("alert", alert);
			int tipo_esc = Integer.parseInt(tipo);
			if (tipo_esc == 1)									// Reinderizzo l'utente:
				response.sendRedirect("prenotacaval.jsp");		// sulla view del cavallo se tipo_esc=1
			else												//------------------------------------
				response.sendRedirect("prenotatrek.jsp");		// sulla view del trekking se tipo_esc=2
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


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
import model.PrenotazionePiazzola;
import model.Utente;

/**
 * Servlet implementation class PrenotaCampServlet
 */
@WebServlet("/prenotacamp")
public class PrenotaCampServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String alert = "0";		//avviso di allarme
		//------------------Possibili inconvenienti------------------
		// alert = 0 -> Ok, no errori.
		// alert = 1 -> La data di arrivo deve essere successiva alla data odierna! 
		// alert = 2 -> La partenza deve essere successiva all'arrivo! Deve verificarsi che: [oggi]<[arrivo]<[partenza].
		// alert = 3 -> Campi obligatori non inseriti!
		// alert = 4 -> Non ci sono piazzole libere
		// alert = 5 -> Bisogna includere almeno una notte.
		//------------------------------------------
		
		boolean ok = true;		//variabile locale per verificare la correttezza degli input
		
		//------------------------------------
		// Recupero i dati inseriti dall'utente
		//------------------------------------
		String user = (String) request.getParameter("username");
		String partenza = (String) request.getParameter("giornopartenza");
		String arrivo = (String) request.getParameter("giornoarrivo");
		String adulti = (String) request.getParameter("numeroadulti");
		String bambini = (String) request.getParameter("numerobambini");
		String piazzola = (String) request.getParameter("piazzola");
		String corrente = (String) request.getParameter("corrente");
		String moto = (String) request.getParameter("moto");
		String auto = (String) request.getParameter("auto");
		String note = (String) request.getParameter("note");
		SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
		
		//------------------------------------
		// Check sui campi obbligatori.
		//------------------------------------
		if ((arrivo.isEmpty() || partenza.isEmpty() || adulti.isEmpty() || bambini.isEmpty() || piazzola.isEmpty())) {
			ok = false;
			System.out.println("Campi obligatori non inseriti!");											//ok
			alert="3";
		}
		//------------------------------------------
		// Check sulla data di arrivo e di partenza.
		//------------------------------------------
		try {
			Date arr = dateParser.parse(arrivo);

			Date part = dateParser.parse(partenza);
 	        Calendar calendar = Calendar.getInstance();
 	        Date oggi = calendar.getTime();
 	        boolean verify = arr.before(oggi);
             if (verify == true && ok == true) {
            	 System.out.println("La data di arrivo deve essere successiva alla data odierna!");		
            	 ok = false;
            	 alert="1";
             }
             boolean verify1 = part.before(arr);
             if (verify1 == true && ok == true) {
            	 System.out.println("La partenza deve essere successiva all'arrivo");		
            	 ok = false;
            	 alert="2";
             }
             if (arr.equals(part)) {
            	 System.out.println("Bisogna includere almeno una notte.");		
            	 ok = false;
            	 alert="5";
             }
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//------------------------------------
		// Check per una piazzola libera della tipologia specificata.
		//------------------------------------
		int id_piazzola = 0;
		try {
			id_piazzola = Campeggio.searchPiazzolaLibera(piazzola,arrivo,partenza);
		} catch (ClassNotFoundException e3) {
			e3.printStackTrace();
		}
		if (id_piazzola == 0 && ok == true) {
			System.out.println("Non ci sono piazzole libere della tipologia specificata.");
			alert = "4";
			ok = false;
		}
	
		if ( ok == true) {
			// ESITO POSITIVO: necessito di salvare i dati nel database
			alert = "0";
			// Creo un'istanza PrenotazionePiazzola.
			PrenotazionePiazzola pren= new PrenotazionePiazzola();
			pren.setId(0);
			pren.setArrivo(arrivo);
			pren.setPartenza(partenza);
			pren.setNumAdulti(adulti);
			pren.setNumBambini(bambini);
			pren.setId_piazzola(id_piazzola);
			if (corrente==null) corrente = "no";
			else corrente = "si";
			if (auto==null) auto = "no";
			else auto = "si";
			if (moto==null) moto = "no";
			else moto = "si";
			pren.setCorrente(corrente);
			pren.setPostoAuto(auto);
			pren.setPostoMoto(moto);
			try {
				pren.setCostoTotale(pren.calcolaCosto());
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			pren.setNote(note);
			// Necessito dell'id dell'utente.
			try {
				ArrayList<Utente> listut = Utente.getDataUtente(user);
				int id = listut.get(0).getId();
				pren.setId_utente(id);
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			// Invio i dati per il riepilogo.
			HttpSession currentsession = request.getSession();
			// Necessito delle informazioni dell'utente.
			try {
				ArrayList<Utente> ut = Utente.getDataUtente(user);
				currentsession.setAttribute("ut", ut);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			currentsession.setAttribute("alert", alert);
			currentsession.setAttribute("pren", pren);
			currentsession.setAttribute("pren1", null);
			response.sendRedirect("riepilogo.jsp");
		} else {
			// ESITO NEGATIVO: ritorno sulla pagina di prenotazione.
			HttpSession currentsession = request.getSession();
			currentsession.setAttribute("alert", alert);
			response.sendRedirect("prenotacamp.jsp");	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
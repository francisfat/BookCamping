 package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Escursione;
import model.Piazzola;
import model.PrenotazioneEscursione;
import model.PrenotazionePiazzola;
/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String alert = "0";		//avviso di allarme
		
		//------------------Possibili inconvenienti------------------
		// alert = 0 -> Ok, no errori.
		// alert = 1 -> Campi *obligatori*! 
		// alert = 2 -> CVV e Card Number sono costituiti da sole cifre!
		// alert = 3 -> CVV e Card Number non hanno un formato corretto!
		// alert = 4 -> Circuito di credito non riconosciuto.
		// alert = 5 -> Carta di Credito scaduta.
		//------------------------------------------
		
		boolean ok = true;		//variabile locale per verificare la correttezza degli input
		
		//------------------------------------
		// Prelevo l'input dalla View.
		//------------------------------------
		String cardholder = (String) request.getParameter("cardholder");
		String cd1 = (String) request.getParameter("cd1");
		String cd2 = (String) request.getParameter("cd2");
		String cd3 = (String) request.getParameter("cd3");
		String cd4 = (String) request.getParameter("cd4");
		String mouth = (String) request.getParameter("mouth");
		String year = (String) request.getParameter("year");
		String cvv = (String) request.getParameter("CVV");	
		String tipologia = (String) request.getParameter("tipo");	// Escursione o Piazzola
		
		//------------------------------------
		// Check campi obligatori
		//------------------------------------
		if (cardholder.isEmpty() || cd1.isEmpty() || cd2.isEmpty() || cd3.isEmpty() || 
				cd4.isEmpty() || mouth.isEmpty() || year.isEmpty() || cvv.isEmpty()) {
			ok = false;
			alert="1";
		}else {
			
			//------------------------------------
			// Check affinchè CVV e Card Number siano costituiti da sole cifre.
			//------------------------------------
			char c;
			int count1 = 0;
			int count2 = 0;
			int count3 = 0;
			int count4 = 0;
			int count5 = 0;
			for (int i = 0; i < cd1.length() ; i++) {  
	        	c = cd1.charAt(i);  
	        	if (!Character.isDigit(c)) { 
					ok = false;
					alert="2";
	            }
	        	count1 ++;
	        }
			for (int i = 0;ok == true && i < cd2.length() ; i++) {  
	        	c = cd2.charAt(i);  
	        	if (!Character.isDigit(c)) { 
					ok = false;
					alert="2";
	            }
	        	count2 ++;
	        }
			for (int i = 0;ok == true && i < cd3.length() ; i++) {  
	        	c = cd3.charAt(i);  
	        	if (!Character.isDigit(c)) { 
					ok = false;
					alert="2";
	            }
	        	count3 ++;
	        }
			for (int i = 0;ok == true && i < cd4.length() ; i++) {  
	        	c = cd4.charAt(i);  
	        	if (!Character.isDigit(c)) { 
					ok = false;
					alert="2";
	            }
	        	count4 ++;
	        }
			for (int i = 0;ok == true && i < cvv.length() ; i++) {  
	        	c = cvv.charAt(i);  
	        	if (!Character.isDigit(c)) { 
					ok = false;
					alert="2";
	            }
	        	count5 ++;
	        }
			
			if ( ok == true) {
				
				//------------------------------------
				// Check affinchè CVV e Card Number abbiano un formato corretto.
				//------------------------------------
				if(count1 != 4 || count2 != 4 ||count3 != 4 ||count4 != 4 || count5 != 3) {
					ok = false;
					alert="3";
				}
				//------------------------------------
				// Check affinchè il circuito di credito sia riconosciuto:
				// le carte di credito VISA iniziano con il numero 4
				// le carte di credito MasterCard iniziano con il numero 5 oppure il 2
				// le carte di credito Diners Club iniziano con il numero 3
				// le carte di credito American Express iniziano con il numero 3
				// le carte di credito Discover Card iniziano con il numero 6
				//------------------------------------
				
				int card1 = Integer.parseInt(cd1);
				int mese = Integer.parseInt(mouth);
				int anno = Integer.parseInt(year);
				if ( ok == true && (card1<2000 || card1>6999)) {
					ok = false;
					alert="4";
				}
				//------------------------------------
				// Check affinchè la card non sia scaduta.
				//------------------------------------
				try {
					SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
					String data = new String(anno+"-"+mese+"-01");
					Date scad = dateParser.parse(data);
					Calendar calendar = Calendar.getInstance();
		 	        Date oggi = calendar.getTime();
		 	        if ( ok == true && (oggi.after(scad))) {
						ok = false;
						alert = "5";
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				
		 	}
		}
			
		if (ok == true) {
			
			//SUCESSO. Pagamento corretto. Posso registrare la PRENOTAZIONE.
			
			alert = "10";
			if (tipologia.equals("si")) {
				
				// ESCURSIONE
				//------------------------------------
				// Prelevo l'input dalla View per registrare la prenotazione.
				//------------------------------------
				String giorno = (String) request.getParameter("data");
				String persone = (String) request.getParameter("numpers");
				String costo = (String) request.getParameter("costo");
				String id_escursione = (String) request.getParameter("id_esc");
				String id_utente = (String) request.getParameter("id_ut");

				PrenotazioneEscursione pren1 = new PrenotazioneEscursione();
				pren1.setId(0);
				int id_esc = Integer.parseInt(id_escursione);
				pren1.setId_escursione(id_esc);
				int npersone = Integer.parseInt(persone);
				pren1.setNumPersone(npersone);
				pren1.setData(giorno);
				int id_ut = Integer.parseInt(id_utente);
				pren1.setId_utente(id_ut);
				int costoTot = Integer.parseInt(costo);
				pren1.setCostoTotale(costoTot);
				try {
					Escursione.registerPrenEscursione(pren1);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}else {
				
				// PIAZZOLA
				//------------------------------------
				// Prelevo l'input dalla View per registrare la prenotazione.
				//------------------------------------
				String arrivo = (String) request.getParameter("arr");
				String partenza = (String) request.getParameter("part");
				String adulti = (String) request.getParameter("ad");
				String bambini = (String) request.getParameter("bamb");
				String corrente = (String) request.getParameter("cor");
				String moto = (String) request.getParameter("moto");
				String auto = (String) request.getParameter("auto");
				String note = (String) request.getParameter("note");
				String costo = (String) request.getParameter("costo");
				String id_piazzola = (String) request.getParameter("id_piaz");
				String id_utente = (String) request.getParameter("id_ut");
				
				PrenotazionePiazzola pren= new PrenotazionePiazzola();
				pren.setId(0);
				pren.setArrivo(arrivo);
				pren.setPartenza(partenza);
				pren.setNumAdulti(adulti);
				pren.setNumBambini(bambini);
				int id_piaz = Integer.parseInt(id_piazzola);
				pren.setId_piazzola(id_piaz);
				pren.setCorrente(corrente);
				pren.setPostoAuto(auto);
				pren.setPostoMoto(moto);
				int costoTot = Integer.parseInt(costo);
				pren.setCostoTotale(costoTot);
				pren.setNote(note);
				int id_ut = Integer.parseInt(id_utente);
				pren.setId_utente(id_ut);
				try {
					Piazzola.registerPrenPiazzola(pren);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			HttpSession currentsession = request.getSession();
			currentsession.setAttribute("alert", alert);
			// Reindirizzo alla Home.
			response.sendRedirect("home.jsp");
		}else {
			
			// FALLIMENTO: pagamento non valido
			
			HttpSession currentsession = request.getSession();
			// invio l'errore (alert) da dover mostrare alla View
			currentsession.setAttribute("alert", alert);
			// Reindirizzo alla pagina di successo.
			response.sendRedirect("pagamento.jsp");
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

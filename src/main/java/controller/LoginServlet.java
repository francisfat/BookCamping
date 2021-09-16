package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Amministratore;
import model.Campeggio;
import model.PrenotazioneEscursione;
import model.PrenotazionePiazzola;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean ok = true;		//variabile locale per verificare la correttezza degli input
		String alert = "0";		//avviso di allarme
		
		//------------------Possibili inconvenienti------------------
		// alert = 0 -> Ok, no errori.
		// alert = 1 -> Campi obligatori non inseriti! 
		// alert = 2 -> Username o Password non esistenti!
		//------------------------------------------
		
		//------------------------------------
		// Prelevo l'input dalla View.
		//------------------------------------
		String paramusername = (String) request.getParameter("username");
		String parampassword = (String) request.getParameter("password");
		String tipo 		 = (String) request.getParameter("tipo"); // Utente o Amministratore.	
		
		//------------------------------------
		// Check campi obligatori
		//------------------------------------
		if(paramusername.isEmpty() || parampassword.isEmpty()) {
			alert = "1";
			ok = false;
		}else {
			
			//------------------------------------
			// Check su Username o Password
			//------------------------------------
			if (tipo.equals("Utente")) {
				// ----------Lato Utente-----------------------
				try {
					if ( Campeggio.isLogin(paramusername,parampassword)==true ) {
						//Autenticazione corretta	
						//Invalido la sessione precedente se esiste
						HttpSession oldsession = request.getSession(false);
						if ( oldsession != null) { 
							oldsession.invalidate();
						}
						HttpSession currentsession = request.getSession();
						currentsession.setAttribute("user", paramusername);
						currentsession.setMaxInactiveInterval(60*3);
						// Reindirizzo alla Home dell'utente.
						response.sendRedirect("home.jsp");
					}else {
						//Autenticazione non corretta
						alert = "2";
						ok = false;
					}
				} catch (ClassNotFoundException | SQLException | IOException e) {
					e.printStackTrace();
				}
				
			}
			if (tipo.equals("Amministratore")) {
				// --------Lato Amministratore-------------------
				try {
					if ( Amministratore.isLogin(paramusername,parampassword)==true ) {
						//Autenticazione corretta	
						//Invalido la sessione precedente se esiste
						HttpSession oldsession = request.getSession(false);
						if ( oldsession != null)
							oldsession.invalidate();
						HttpSession currentsession = request.getSession();
						// Invio alla view i dati da mostrare tra cui:
						// le prenotazione delle piazzole,
						try {
							ArrayList<PrenotazionePiazzola> listut = Amministratore.getDataPrenCamp();
							currentsession.setAttribute("listut", listut);
							
						} catch (ClassNotFoundException | SQLException e) {
							e.printStackTrace();
						}
						// le prenotazioni delle escursioni,
						try {
							ArrayList<PrenotazioneEscursione> listesc = Amministratore.getDataPrenEsc();
							currentsession.setAttribute("listesc", listesc);
							
						} catch (ClassNotFoundException | SQLException e) {
							e.printStackTrace();
						}
						// gli incassi,
						int costoTot = Amministratore.monitoraIncassiTotali();
						int costoCamp = Amministratore.monitoraIncassiCamp();
						int costoEsc = Amministratore.monitoraIncassiEsc();
						currentsession.setAttribute("costoTot", costoTot);
						currentsession.setAttribute("costoCamp", costoCamp);
						currentsession.setAttribute("costoEsc", costoEsc);
						// e lo username dell'amministratore.
						currentsession.setAttribute("user", paramusername);
						currentsession.setMaxInactiveInterval(60*3);
						// Reindirizzo alla Home dell'amministratore.
						response.sendRedirect("home_administrator.jsp");
					}else {
						//Autenticazione non corretta
						alert = "2";
						ok = false;
					}
				} catch (ClassNotFoundException | SQLException | IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		if (ok == false) {
			HttpSession currentsession = request.getSession();
			// invio l'errore (alert) da dover mostrare alla View
			currentsession.setAttribute("alert", alert);
			response.sendRedirect("login.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

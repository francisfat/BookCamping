package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Campeggio;
import model.Utente;
import java.lang.String;
import java.sql.SQLException;
import java.lang.Character;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Calendar;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	String alert = "11";		//avviso di allarme
	//------------------Possibili inconvenienti------------------
	// alert = 1 -> Data di nascita impossibile.
	// alert = 2 -> Campi obligatori non inseriti!
	// alert = 3 -> Le due password non combaciano.
	// alert = 4 -> Lo username non è univoco.
	// alert = 5 -> La password non ha almeno 9 caratteri.
	// alert = 6 -> La password non ha soli caratteri o cifre.
	// alert = 7 -> La password non ha almeno 2 cifre.
	// alert = 8 -> Cellulare non valido.
	// alert = 9 -> E-mail non valida.
	// alert = 10 -> Bisogna essere maggiorenni
	// alert = 11 -> Ok, no errori.
	//------------------------------------------
	
	boolean ok = true;		//variabile locale per verificare la correttezza degli input
	
	// Funzioni per la correttezza del cellulare e dell'email.
	
	private boolean mailSyntaxCheck(String email){		
	        // Create the Pattern using the regex
	        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
	 
	        // Match the given string with the pattern
	        Matcher m = p.matcher(email);
	 
	        // check whether match is found
	        boolean matchFound = m.matches();
	 
	        StringTokenizer st = new StringTokenizer(email, ".");
	        String lastToken = null;
	        while (st.hasMoreTokens()) {
	            lastToken = st.nextToken();
	        }
	 
	    // validate the country code
	        if (matchFound && lastToken.length() >= 2
	                && email.length() - 1 != lastToken.length()) {
	 
	            return true;
	        } else {
	            return false;
	        }
	 
	    }
	private boolean validateTelFaxNumber(String number){
		if (number == null){
			return false;
		}
	
		String patternSpace = "\\s+";
		String replaceStr = "";
		Pattern pattern = Pattern.compile(patternSpace);
		Matcher matcher = pattern.matcher(number);
		number = matcher.replaceAll(replaceStr);
	
		patternSpace = "\\-+";
		replaceStr = "";
		pattern = Pattern.compile(patternSpace);
		matcher = pattern.matcher(number);
		number = matcher.replaceAll(replaceStr);   
	
		//i caratteri / non vengono presi in considerazione
		patternSpace = "\\/+";
		replaceStr = "";
		pattern = Pattern.compile(patternSpace);
		matcher = pattern.matcher(number);
		number = matcher.replaceAll(replaceStr);
	
		Pattern p = Pattern.compile("^(\\+)?[0-9]+$");
		Matcher m = p.matcher(number);
		boolean matchFound = m.matches();
		return matchFound;
	}
	
	// Funzioni GET e POST
	
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		alert= "0";
		ok=true;
		
		//------------------------------------------
		// Recupero i dati inseriti dall'utente
		//------------------------------------------
		String nome = (String) request.getParameter("nome");
		String cognome = (String) request.getParameter("cognome");
		String nascita = (String) request.getParameter("nascita");
		String indirizzo = (String) request.getParameter("indirizzo");
		String città = (String) request.getParameter("citta");
		String paese = (String) request.getParameter("nazione");
		String cap = (String) request.getParameter("cap");
		String cellulare = (String) request.getParameter("cellulare");
		String email = (String) request.getParameter("e-mail");
		String user = (String) request.getParameter("username");
		String passw = (String) request.getParameter("password");
		String passw1 = (String) request.getParameter("password1");
			
		//------------------------------------
		// Check sui campi obbligatori, password ed username;
		// Verifico che le due password inserite siano uguali, che l'utente non sia già registrato (nel DB),
		// che la password sia di almeno 9 caratteri con sole lettere e cifre, e con almeno 2 cifre.
		// Inoltre verifico che lo USERNAME sia unico.
		//------------------------------------
			
			if ( ok == true && (nome.isEmpty() || cognome.isEmpty() || nascita.isEmpty() || indirizzo.isEmpty() || email.isEmpty() || 
				città.isEmpty() || paese.isEmpty() || cap.isEmpty() ||user.isEmpty() || passw.isEmpty() || passw1.isEmpty() )) {
				ok = false;
				alert="2";
			} else {
				if (!(passw.equals(passw1))) {
					ok = false;
					alert="3";
				}else {
					try {
						if (Campeggio.usernameUsed(user)== false) {
							ok = false;
							alert="4";							
						}else {
							if (passw.length()<9) {			
								ok = false;
								alert="5";
							} else {      
						        char c;  
						        int count = 1;   
						        for (int i = 0; i < passw.length() ; i++) {  
						        	c = passw.charAt(i);  
						        	if (!Character.isLetterOrDigit(c)) {          
										ok = false;
										alert="6";
						            } else if (Character.isDigit(c)) { 
						                count++;
						            }
						        }
						    	if (count < 2){
									ok = false;
									alert="7";
						        }
							}
						}
					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			//------------------------------------
			// Check sulla data di nascita: verifico che sia precedente alla data odierna e
			// che l'utente abbia almeno 18 anni.
			//------------------------------------
			
			SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
			
			if (ok ==true) {
					try {
							 Date date = dateParser.parse(nascita);
				 	         Calendar calendar = Calendar.getInstance();
				 	         Date oggi = calendar.getTime();
				 	         int annomagg = oggi.getYear() - 18;
				 	         Date magg = calendar.getTime();
				 	         magg.setYear(annomagg);
				             boolean verify = date.after(oggi);
				             if (verify == true) {		
				            	 ok = false;
				            	 alert="1";
				             }
				             if(date.after(magg)){		
				            	 ok = false;
				            	 alert="10";
				             }
			             
					} catch (ParseException e) {
						e.printStackTrace();
					}
			}
		//------------------------------------
		// Check sul cellulare e sull' email
		//------------------------------------
			
			if (ok == true && !validateTelFaxNumber(cellulare)) {
					ok = false;
					alert="8";
			}
			
			if(ok == true && !mailSyntaxCheck(email)) {
				ok = false;
				alert="9";
			}
		
		if ( ok == true) {
			
			// ESITO POSITIVO: necessito di salvare i dati nel database, reinderizzo l'utente al login
			
			alert = "11";
			Utente utente= new Utente();
			utente.setId(0);
			utente.setUsername(user);
			utente.setPassword(passw1);
			utente.setNascita(nascita);
			utente.setNome(nome);
			utente.setCognome(cognome);
			utente.setIndirizzo(indirizzo);
			utente.setCellulare(cellulare);
			utente.setEmail(email);
			utente.setCAP(cap);
			utente.setPaese(paese);
			utente.setCittà(città);
			
			try {
				Campeggio.registerUtente(utente);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			HttpSession currentsession = request.getSession();
			currentsession.setAttribute("alert", alert);
			response.sendRedirect("login.jsp");
			
		} else {
		
			// ESITO NEGATIVO: ritorno alla pagina di registrazione + msg di errore
			
			HttpSession currentsession = request.getSession();
			currentsession.setAttribute("alert", alert);
			response.sendRedirect("register.jsp");	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

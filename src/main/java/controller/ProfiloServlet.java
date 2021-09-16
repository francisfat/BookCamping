package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;

@WebServlet("/profile")
public class ProfiloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramusername = (String) request.getParameter("username");
		HttpSession currentsession = request.getSession();
		currentsession.setAttribute("user", paramusername);
		
		try {
			
			// Grazie allo username (univoco), ricevo i dati dell'utente dal model.
			
			ArrayList<Utente> listut = Utente.getDataUtente(paramusername);
			String nome = listut.get(0).getNome();
			String cognome = listut.get(0).getCognome();
			String nascita = listut.get(0).getNascita();
			String indirizzo = listut.get(0).getIndirizzo();
			String città = listut.get(0).getCittà();
			String paese = listut.get(0).getPaese();
			String cap = listut.get(0).getCAP();
			String cellulare = listut.get(0).getCellulare();
			String email = listut.get(0).getEmail();
			
			// Invio i dati alla View.
			
			currentsession.setAttribute("email", email);
			currentsession.setAttribute("cellulare", cellulare);
			currentsession.setAttribute("cap", cap);
			currentsession.setAttribute("paese", paese);
			currentsession.setAttribute("città", città);
			currentsession.setAttribute("indirizzo", indirizzo);
			currentsession.setAttribute("nascita", nascita);
			currentsession.setAttribute("cognome", cognome);
			currentsession.setAttribute("nome", nome);
			currentsession.setAttribute("user", paramusername);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("profilo.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

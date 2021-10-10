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
			//------------------------------------
			// Grazie allo username (univoco), ricevo i dati dell'utente dal model.	
			//------------------------------------
			ArrayList<Utente> listut = Utente.getDataUtente(paramusername);			
			//------------------------------------
			// Invio i dati alla View.
			currentsession.setAttribute("listut", listut);
			//------------------------------------
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		//------------------------------------
		// Reindirizzo al profilo.
		//------------------------------------
		response.sendRedirect("profilo.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

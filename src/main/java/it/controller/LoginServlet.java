package it.controller;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	// prova: questi sono dati che dovrebbero essere nel database
	private final String us="Francesco";
	private final String pa="qwerty";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramusername = (String) request.getParameter("username");
		String parampassword = (String) request.getParameter("password");
		
		
		if (us.equals(paramusername) && pa.equals(parampassword)) {
			//Autenticazione corretta	
			//Invalido la sessione precedente se esiste
			HttpSession oldsession = request.getSession(false);
			if ( oldsession != null) { 
				oldsession.invalidate();
			}
			
			HttpSession currentsession = request.getSession();
			currentsession.setAttribute("user", us);
			currentsession.setMaxInactiveInterval(60*3);

			response.sendRedirect("home.jsp");
			
		} else {
			//Autenticazione non corretta
			response.sendRedirect("login.jsp");
		}
		
		//request.setAttribute("user", us);
		//request.setAttribute("pass", pa);
		//RequestDispatcher dis = request.getRequestDispatcher("prova.jsp");
		//dis.forward(request, response);
		
		//response.getWriter().append("Hello");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

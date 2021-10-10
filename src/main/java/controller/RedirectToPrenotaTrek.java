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

import model.Escursione;

/**
 * Servlet implementation class RedirectToPrenotaTrek
 */
@WebServlet("/redprenotatrek")
public class RedirectToPrenotaTrek extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String alert = "0";
		HttpSession currentsession = request.getSession();
		currentsession.setAttribute("alert", alert);
		try {
			ArrayList<Escursione> list = Escursione.getDataEscursione(2);
			currentsession.setAttribute("list", list);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("prenotacaval.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

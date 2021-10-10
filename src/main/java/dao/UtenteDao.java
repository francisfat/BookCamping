package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Utente;

public class UtenteDao {

	public static ArrayList<Utente> getDataUtente(String username) throws ClassNotFoundException, SQLException {
		
		ArrayList<Utente> listut = new ArrayList<Utente>();
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery="SELECT id,username,password,nome,cognome,nascita,indirizzo,città,paese,cap,cellulare,email FROM utenti WHERE username ='"+ username + "'";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			rs= statement.executeQuery(SQLquery);
			
			while (rs.next() == true) {
				Utente ut = new Utente(rs.getInt("id"),rs.getString("username"),rs.getString("password"),
									   rs.getString("nome"),rs.getString("cognome"),rs.getString("nascita"),
									   rs.getString("indirizzo"),rs.getString("città"),rs.getString("paese"),
									   rs.getString("cap"),rs.getString("cellulare"),rs.getString("email"));
				listut.add(ut);
			}
			
			
			return listut;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
		
	}
}

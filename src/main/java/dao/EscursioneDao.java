package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Escursione;
import model.PrenotazioneEscursione;

public class EscursioneDao {

	public static boolean registerPrenEscursione(PrenotazioneEscursione pren) throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery_insert = "INSERT INTO prenotazioni_escursioni "+ "(id,data,numPersone,costoTotale,id_escursione,id_utente)"
									+ "VALUES" + " "+"(?,?,?,?,?,?);";
		
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
		     PreparedStatement preparedStatement = connection.prepareStatement(SQLquery_insert);) {
			
			preparedStatement.setInt(1,pren.getId());
			preparedStatement.setString(2, pren.getData());
			preparedStatement.setInt(3, pren.getNumPersone());
			preparedStatement.setInt(4, pren.getCostoTotale());
			preparedStatement.setInt(5, pren.getId_escursione());
			preparedStatement.setInt(6, pren.getId_utente());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public static ArrayList<Escursione> getDataEscursione(int id) throws ClassNotFoundException, SQLException {
		
		ArrayList<Escursione> list = new ArrayList<Escursione>();
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery="SELECT * FROM escursioni WHERE id ='"+ id + "'";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			rs= statement.executeQuery(SQLquery);
			
			while (rs.next() == true) {
				Escursione ut = new Escursione(rs.getInt("id"),rs.getString("nome"),rs.getString("descrizione"),
									   rs.getString("guida"),rs.getString("oraInizio"),rs.getString("oraFine"),
									   rs.getInt("capienzaMax"), rs.getInt("prezzo"),
									   rs.getString("partenza"),rs.getString("durata"));
				list.add(ut);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
		
	}
	
}

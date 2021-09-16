package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	
}

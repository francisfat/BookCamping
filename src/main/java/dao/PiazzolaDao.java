package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.PrenotazionePiazzola;

public class PiazzolaDao {

	public static boolean registerPrenPiazzola(PrenotazionePiazzola pren) throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery_insert = "INSERT INTO prenotazioni_piazzole "+ "(id,checkin,checkout,numAdulti,numBambini,corrente,postoAuto,postoMoto,note,costoTotale,id_utente,id_piazzola) "
									+ "VALUES" + " "+"(?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
		     PreparedStatement preparedStatement = connection.prepareStatement(SQLquery_insert);) {
			
			preparedStatement.setInt(1,pren.getId());
			preparedStatement.setString(2, pren.getCheckin());
			preparedStatement.setString(3, pren.getCheckout());	
			preparedStatement.setString(4, pren.getNumAdulti());
			preparedStatement.setString(5, pren.getNumBambini());
			preparedStatement.setString(6, pren.getCorrente());
			preparedStatement.setString(7, pren.getPostoAuto());
			preparedStatement.setString(8, pren.getPostoMoto());
			preparedStatement.setString(9, pren.getNote());
			preparedStatement.setInt(10, pren.getCostoTotale());
			preparedStatement.setInt(11, pren.getId_utente());
			preparedStatement.setInt(12, pren.getId_piazzola());
			preparedStatement.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	public static String getTipologiaPiazzola(int id) throws ClassNotFoundException, SQLException {
		
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery="SELECT * FROM piazzole WHERE id ='"+ id + "'";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			rs= statement.executeQuery(SQLquery);
			
			while (rs.next() == true)
				return rs.getString("tipologia");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
		
	}
}

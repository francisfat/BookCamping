package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.PrenotazioneEscursione;
import model.PrenotazionePiazzola;

public class AmministratoreDao {
	
	public static boolean isLogin(String username,String password)  throws ClassNotFoundException, SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery="SELECT * FROM amministratori WHERE username ='"+
						username+"' AND password ='"+ 
						password+ 
						"'";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);) {
				
				ResultSet resultSet= preparedStatement.executeQuery();
				while(resultSet.next()) {
					if ( username.equals(resultSet.getString("username")) && password.equals(resultSet.getString("password"))) {
						return true;
					}
				}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static int monitoraIncassiTotali() throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery ="SELECT * FROM prenotazioni_escursioni";
		String SQLquery2="SELECT * FROM prenotazioni_piazzole";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);
			PreparedStatement preparedStatement2 = connection.prepareStatement(SQLquery2);) {
			
			ResultSet resultSet= preparedStatement.executeQuery();				
			ResultSet resultSet2= preparedStatement2.executeQuery();
			
			int costoCamp = 0;
			int costoEsc = 0;
			while(resultSet.next()) {
				costoEsc = costoEsc + resultSet.getInt("costoTotale");
			}
			while(resultSet2.next()) {
				costoCamp = costoCamp + resultSet2.getInt("costoTotale");
			}
			int costoTot = costoCamp + costoEsc;

			return costoTot;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return 0;
	}
	public static int monitoraIncassiEsc() throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery ="SELECT * FROM prenotazioni_escursioni";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);) {
			
			ResultSet resultSet= preparedStatement.executeQuery();
			
			int costoEsc = 0;
			while(resultSet.next()) {
				costoEsc = costoEsc + resultSet.getInt("costoTotale");
			}
			
			return costoEsc;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return 0;
	}
	public static int monitoraIncassiCamp() throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery ="SELECT * FROM prenotazioni_piazzole";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);) {
			
			ResultSet resultSet= preparedStatement.executeQuery();
			
			int costoCamp = 0;
			while(resultSet.next()) {
				costoCamp = costoCamp + resultSet.getInt("costoTotale");
			}
			
			return costoCamp;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return 0;
	}
	
	public static ArrayList<PrenotazioneEscursione> getDataPrenEsc() throws ClassNotFoundException, SQLException {
		
		ArrayList<PrenotazioneEscursione> listut = new ArrayList<PrenotazioneEscursione>();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		} 


		
		String SQLquery="SELECT id,data,numPersone,costoTotale,id_escursione,id_utente FROM prenotazioni_escursioni";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			ResultSet rs = statement.executeQuery(SQLquery);
			
			while (rs.next() == true) {
				PrenotazioneEscursione pren = new PrenotazioneEscursione(rs.getInt("id"),rs.getString("data"),rs.getInt("numPersone"),
									   rs.getInt("costoTotale"),rs.getInt("id_escursione"),rs.getInt("id_utente"));
				listut.add(pren);
			}
			
			return listut;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
		
	}
	public static ArrayList<PrenotazionePiazzola> getDataPrenCamp() throws ClassNotFoundException, SQLException {
		
		ArrayList<PrenotazionePiazzola> listut = new ArrayList<PrenotazionePiazzola>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		} 

		
		String SQLquery="SELECT id,checkin,checkout,numAdulti,numBambini,corrente,postoAuto,postoMoto,note,costoTotale,id_utente,id_piazzola FROM prenotazioni_piazzole";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			ResultSet rs= statement.executeQuery(SQLquery);
			
			while (rs.next() == true) {
				PrenotazionePiazzola pren = new PrenotazionePiazzola(rs.getInt("id"),rs.getString("checkin"),rs.getString("checkout"),
									   rs.getString("numAdulti"),rs.getString("numBambini"),rs.getString("corrente"),
									   rs.getString("postoAuto"),rs.getString("postoMoto"),rs.getString("note"),
									   rs.getInt("costoTotale"),rs.getInt("id_utente"),rs.getInt("id_piazzola"));
				listut.add(pren);
			}
			
			return listut;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
		
	}

}

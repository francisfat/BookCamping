package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Utente;

public class CampeggioDao {
	
	public static int searchPiazzolaLibera(String tipologia, String checkin, String checkout) throws ClassNotFoundException {
			
			boolean ok = true;
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
			} catch (ClassNotFoundException e) {
				System.out.println("ClassNotFoundException: ");
				System.err.println(e.getMessage());
			}
			
			String SQLquery ="SELECT * FROM piazzole WHERE tipologia ='"+ tipologia + "'";
			String SQLquery2="SELECT * FROM prenotazioni_piazzole";
		
			try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
				PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);
				PreparedStatement preparedStatement2 = connection.prepareStatement(SQLquery2);) {
				
				ResultSet resultSet= preparedStatement.executeQuery();				
				ResultSet resultSet2= preparedStatement2.executeQuery();
				
				while(resultSet.next()) {
					ok = true;
					while( ok == true && resultSet2.next()) {
						if (resultSet2.getInt("id_piazzola")==resultSet.getInt("id")) {
							String arriv = resultSet2.getString("checkin");
							String partenz = resultSet2.getString("checkout");
							SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
							try {
								Date arr = dateParser.parse(checkin);
								Date part = dateParser.parse(checkout);
								Date arr2 = dateParser.parse(arriv);
								Date part2 = dateParser.parse(partenz);
								if( (part.before(arr2)) || (arr.after(part2)) ) {
									ok = true;
								}else{
									ok = false;
								}
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}	
					}
					if (ok == true) {
						return resultSet.getInt("id");
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return 0;
	}
	public static boolean verifyCapacitàEscursione(int id, int numpersone, String giorno) throws ClassNotFoundException {
		
		int qta = 0;
		int capMax = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery ="SELECT * FROM escursioni WHERE id ='"+ id +"'";
		String SQLquery2 ="SELECT * FROM prenotazioni_escursioni WHERE data ='"+ giorno +"'";

		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);
			PreparedStatement preparedStatement2 = connection.prepareStatement(SQLquery2);) {

			ResultSet resultSet= preparedStatement.executeQuery();				
			ResultSet resultSet2= preparedStatement2.executeQuery();
			
			while(resultSet.next())
				capMax = resultSet.getInt("capienzaMax");

			while(resultSet2.next()) {
				if (resultSet2.getInt("id_escursione")==id )
					qta = qta + resultSet2.getInt("numPersone");
			}

			if ((capMax-qta-numpersone) >= 0) {
				return true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return false;
	}
	
	public static boolean registerUtente(Utente utente) throws ClassNotFoundException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery_insert = "INSERT INTO utenti"+ "(id,username,password,nome,cognome,nascita,indirizzo,città,paese,CAP,cellulare,email) "
									+ "VALUES" + " "+"(?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
		     PreparedStatement preparedStatement = connection.prepareStatement(SQLquery_insert);) {
			
			preparedStatement.setInt(1,utente.getId());
			preparedStatement.setString(2, utente.getUsername());
			preparedStatement.setString(3, utente.getPassword());	
			preparedStatement.setString(4, utente.getNome());	
			preparedStatement.setString(5, utente.getCognome());	
			preparedStatement.setString(6, utente.getNascita());	
			preparedStatement.setString(7, utente.getIndirizzo());	
			preparedStatement.setString(8, utente.getCittà());	
			preparedStatement.setString(9, utente.getPaese());
			preparedStatement.setString(10, utente.getCAP());
			preparedStatement.setString(11, utente.getCellulare());
			preparedStatement.setString(12, utente.getEmail());
		
			preparedStatement.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	public static boolean isLogin(String username,String password)  throws ClassNotFoundException, SQLException {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
			} catch (ClassNotFoundException e) {
				System.out.println("ClassNotFoundException: ");
				System.err.println(e.getMessage());
			}
			
			String SQLquery="SELECT * FROM utenti WHERE username ='"+
							username+"' AND password ='"+ 
							password+ 
							"'";
		
			try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
				     PreparedStatement preparedStatement = connection.prepareStatement(SQLquery);) {
					
					ResultSet resultSet= preparedStatement.executeQuery();
					while(resultSet.next()) {
						if ( username.equals(resultSet.getString("username")) && 
								password.equals(resultSet.getString("password"))) {
							return true;
						}
					}
	
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		return false;
	}
	public static boolean usernameUsed(String username) throws ClassNotFoundException, SQLException {
			
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
			} catch (ClassNotFoundException e) {
				System.out.println("ClassNotFoundException: ");
				System.err.println(e.getMessage());
			}
			
			String SQLquery="SELECT * FROM utenti WHERE username ='"+username+"'";
		
			try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
				     Statement statement = connection.createStatement();) {
					
				ResultSet rs= statement.executeQuery(SQLquery);
				
				while (rs.next() == true) {
					if (rs.getString("username").equals(username))
						return false;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	
			return true;
		}
	
}

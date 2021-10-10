package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ListinoDao {

public static void getListino(int[] array) throws ClassNotFoundException, SQLException {
		
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		//libreria che permette la connessione
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		
		String SQLquery="SELECT * FROM tariffa_giornaliera";
	
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcamping","root","");
			     Statement statement = connection.createStatement();) {
				
			rs= statement.executeQuery(SQLquery);
			
			while (rs.next() == true) {
				array[0]=rs.getInt("tenda_small");
				array[1]=rs.getInt("tenda_large");
				array[2]=rs.getInt("roulotte");
				array[3]=rs.getInt("camper");
				array[4]=rs.getInt("adulto");
				array[5]=rs.getInt("bambino");
				array[6]=rs.getInt("corrente");
				array[7]=rs.getInt("posto_moto");
				array[8]=rs.getInt("posto_auto");	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}

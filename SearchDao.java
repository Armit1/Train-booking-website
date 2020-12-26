package com.databaseCon.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.beans.pkg.SearchBean;
import com.establishCon.pkg.AppDB;


public class SearchDao {

	
	public ResultSet query(SearchBean searchBean, int sortNum) throws ClassNotFoundException {
		ResultSet rs = null;
		String command = "";
		java.util.Date utilDate = new java.util.Date();
		long date = utilDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(date);
		
		
		
		if(sortNum == 1) {
			command = "r.arrival";
		}
		else if(sortNum == 2){
			command = "r.departure";
		}
		else {
			command = "r.fixed_fare";
		}
		
		
		
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();
			
			
			String statement = "SELECT r.transit_line, "
							 + "r.trainID, "
							 + "r.origin,"
							 + "r.destination, "
							 + "r.arrival, "
							 + "r.departure,"
							 + "if(r.is_roundTrip = 1, \"Round Trip\", \"One way\") as trip_type,"
							 + "r.fixed_fare as fare "
							 + "FROM run_on r"
							 + " WHERE r.origin = ?"
							 + " AND r.destination = ?"
							 + " AND datediff(r.arrival, ?) = 0 "
							 + "AND datediff(r.arrival, ?) > -1 "
							 + "ORDER BY " + command;
							 
			
			
			
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement(statement);
								
			preparedStatement.setString(1, searchBean.getOrigin());
			preparedStatement.setString(2, searchBean.getDestination());
			preparedStatement.setString(3, searchBean.getDateOfTravel());
			preparedStatement.setDate(4, sqlDate);

			
			rs = preparedStatement.executeQuery();
			
		
			
			
			

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		
		
		return rs;
	}
	
	public ResultSet queryStops(SearchBean searchBean, int sortNum) throws ClassNotFoundException {
		ResultSet rs = null;
		
		
		java.util.Date utilDate = new java.util.Date();
		long date = utilDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(date);
		String command = "";
		
		
		if(sortNum == 1) {
			command = "s.arrive_stop";
		}
		else if(sortNum == 2){
			command = "s.depart_stop";
		}
		else {
			command = "s.fare";
		}
		
				
		
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();
			
			
			String statement = "SELECT distinct "
							 + "st.name, "
							 + "r.transit_line, "
							 + "s.trainID, "
							 + "r.origin,"
							 + "r.destination, "
							 + "s.arrive_stop, "
							 + "s.depart_stop, "
							 + "s.stopNum,"
							 + "s.fare "
							 + "FROM run_on r, stops s, stations st "
							 + "WHERE s.trainID = r.trainID "
							 + "AND s.stationID = st.stationID "
							 + "AND r.origin = ? "
							 + "AND r.destination = ? "
							 + "AND datediff(s.arrive_stop, ?) = 0 "
							 + "AND datediff(s.arrive_stop, ?) > -1 "
							 + "ORDER BY "+ command;
							 
			
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement(statement);
								
			preparedStatement.setString(1, searchBean.getOrigin());
			preparedStatement.setString(2, searchBean.getDestination());
			preparedStatement.setString(3, searchBean.getDateOfTravel());
			preparedStatement.setDate(4, sqlDate);


			rs = preparedStatement.executeQuery();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		
		
		return rs;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}

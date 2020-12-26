package com.databaseCon.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beans.pkg.ReserveBean;
import com.establishCon.pkg.AppDB;

import java.util.Calendar;
import java.util.Random;
import java.util.stream.IntStream;
import java.sql.Types;
import java.sql.Date;


public class ReserveDao {

	
	public String get_discount_type(ReserveBean reserveBean) throws ClassNotFoundException {
		
		String discount_type = "";
		
	
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select discount_type from user_info where username = ?");
			preparedStatement.setString(1, reserveBean.getUsername());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {	
				discount_type = rs.getString("discount_type");
			}
			
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		
		return discount_type;
	}
	

	public boolean insert(ReserveBean reserveBean) throws ClassNotFoundException {
		
		
		Random rand = new Random(); 
	    int upperbound = 9999;
	    int res_num = rand.nextInt(upperbound); 
		
		boolean status = false;
		java.util.Date utilDate = new java.util.Date();
		long date = utilDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(date);

		
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into reservations(res_num, username, fare, trainID, is_RoundTrip, stopStation, date_made, travel_dateTime)"
								+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
				
			preparedStatement.setInt(1, res_num);
			preparedStatement.setString(2, reserveBean.getUsername());
			preparedStatement.setInt(3, reserveBean.getFare());
			preparedStatement.setInt(4, reserveBean.getTrainID());
			preparedStatement.setInt(5, reserveBean.getIs_roundTrip());
			preparedStatement.setString(6, reserveBean.getStopSt());
			preparedStatement.setDate(7, sqlDate);
			preparedStatement.setString(8, reserveBean.getTravel_dateTime());

			System.out.println(preparedStatement);
			int result  = preparedStatement.executeUpdate();

			/*Execute update returns number of elements updated, so if insert was successful one value is updated*/
			if(result > 0) {
				status = true;
			}

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		
		return status;
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

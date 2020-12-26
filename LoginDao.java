package com.databaseCon.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.beans.pkg.LoginBean;
import com.establishCon.pkg.AppDB;


public class LoginDao {

	
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;
		
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from user_info where username = ? and password = ? ");
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}
	
	
	public String get_affiliation(LoginBean loginBean) {
		
		String affil = "";
		
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select affil from user_info where username = ?");
			preparedStatement.setString(1, loginBean.getUsername());

			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				affil = rs.getString("affil");
			}
			
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return affil;
		
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

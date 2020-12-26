package com.databaseCon.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.beans.pkg.RegisterBean;
import com.establishCon.pkg.AppDB;

/*Possibly add validation for duplicate users or blank fields*/
public class RegisterDao {
	
	public boolean validate(RegisterBean registerBean) throws ClassNotFoundException {
		boolean status = false;

	
		try {
			
			AppDB db = new AppDB();	
			Connection connection = db.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into user_info(username, email, password, first_name, last_name, ssn, affil, discount_type)"
								+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, registerBean.getUsername());
			preparedStatement.setString(2, registerBean.getEmail());
			preparedStatement.setString(3, registerBean.getPassword());
			preparedStatement.setString(4, registerBean.getFirst_Name());
			preparedStatement.setString(5, registerBean.getLast_Name());
			preparedStatement.setNull(6, Types.NULL);
			preparedStatement.setString(7, "customer");
			preparedStatement.setString(8, registerBean.getDiscount_type());

			System.out.println(preparedStatement);
			int result  = preparedStatement.executeUpdate();
			//status = rs.next();
			
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

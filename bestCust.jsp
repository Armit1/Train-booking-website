<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.establishCon.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			AppDB db = new AppDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String tempTbl = "create temporary table revenueByCust " + 
		            "select u.username, sum(r.fare) as revenue " +
		            "from user_info u, reservations r " +
		            "where u.username = r.username and u.affil = 'customer' " +
		            "group by u.username ";

			//Run the query against the database.
			stmt.execute(tempTbl);
			
			String tempTbl2 = "create temporary table revenueByCust2 " + 
		            "select * " +
		            "from revenueByCust ";

			//Run the query against the database.
			stmt.execute(tempTbl2);
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "select r.username " + 
					"from revenueByCust r " + 
					"where r.revenue = (select max(revenue) from revenueByCust2) ";			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		
			out.print("Username of Best Customer: ");

			while (result.next()) { %>
			<tr>    
				<td><%= result.getString("username") %></td>   
			</tr>
		<% }
			
		//close the connection.
		db.closeConnection(con);
			
		} catch (Exception e) {
			out.print(e);
		}%>

	</body>
</html>
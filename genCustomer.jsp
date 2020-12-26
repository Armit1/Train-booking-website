<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.establishCon.pkg.*"%>
<!--Import some libraries that have classes that we need -->
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
			//Get the selected radio button from the index.jsp
			String transit = request.getParameter("transit_line");
			String date = request.getParameter("arrival");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT distinct res.username " 
					+"FROM reservations res, run_on r "
					+"WHERE r.transit_line = ? "
					+"AND datediff(res.travel_dateTime, ?) = 0 "
					+"AND r.trainID = res.trainID "
					+"AND datediff(res.travel_dateTime, r.arrival) = 0";
			//Run the query against the database.
			
			
			PreparedStatement preparedStatement = con.prepareStatement(str);
			
			preparedStatement.setString(1, transit);
			preparedStatement.setString(2, date);
			
			ResultSet result = preparedStatement.executeQuery();
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h2 align="center"><font><strong>Users</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>    
		<tr bgcolor="#DC143C">
			<td>Username</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
				<tr bgcolor="#E0FFFF">
					<td><%= result.getString("username") %></td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
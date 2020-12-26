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
			String station = request.getParameter("station");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "select distinct r.transit_line, s.trainID, r.origin, r.destination, r.departure, r.arrival, " +  
			"r.fixed_fare as fare " + 
					"from run_on r, stops s " + 
					"where s.trainID = r.trainID " + 
					"and r.origin = '" + station + 
					"' or r.destination = '" + station + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h2 align="center"><font><strong>Schedules</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>    
		<tr bgcolor="#7FFFD4">
			<td>Transit Line</td>
			<td>Train ID</td>
			<td>Origin</td>
			<td>Destination</td>
			<td>Departure</td>
			<td>Arrival</td>
			<td>Fare</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
				<tr bgcolor="#E0FFFF">
					<td><%= result.getString("transit_line") %></td>   
					<td><%= result.getString("trainID") %></td> 
					<td><%= result.getString("origin") %></td>   
					<td><%= result.getString("destination") %></td> 
					<td><%= result.getString("departure") %></td>   
					<td><%= result.getString("arrival") %></td>    
					<td><%= result.getString("fare") %></td>
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
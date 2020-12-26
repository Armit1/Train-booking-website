<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="com.establishCon.pkg.AppDB"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		AppDB db = new AppDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String command = request.getParameter("command");
		String trainID = request.getParameter("train");
		String check;


		//Make an insert statement for the Sells table:
		if (command.equals("origin"))
		{
		check = "update run_on set origin = null where trainID = ?";
		}
		else if (command.equals("destination"))
		{
		check = "update run_on set destination= null where trainID = ?";
		}
		else if (command.equals("transit"))
		{
		check = "update run_on set transit_line = null where trainID = ?";
		}
		else if (command.equals("travel"))
		{
		check = "update run_on set travel_time = null where trainID = ?";
		}
		else if (command.equals("arrive"))
		{
		check = "update run_on set arrival = null where trainID = ?";
		}
		else
		{
		check = "update run_on set destination = null where trainID = ?";
		}
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(check);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//ps.setString(1, command);
		ps.setString(1, trainID);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Deletion succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Deletion failed :()");
	}
%>
</body>
</html>
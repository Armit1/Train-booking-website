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
	<%
	    
		try {
	
			//Get the database connection
			AppDB db = new AppDB();	
			Connection con = db.getConnection();			

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			
			if(entity.equals("transitLine")){
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "select r.transit_line, sum(res.fare) as revenue " +
						"from run_on r, reservations res " +
						"where r.trainID = res.trainID " +
						"group by r.transit_line";
				//Run the query against the database
				ResultSet result = stmt.executeQuery(str);
				
				//Make an HTML table to show the results in:
				out.print("<table>");
	
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//print out column header
				out.print("Transit Line");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print("Revenue");
				out.print("</td>");
				
				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out month:
					out.print(result.getString("transit_line"));
					out.print("</td>");
					out.print("<td>");
					//Print out revenue:
					out.print(result.getString("revenue"));
					out.print("</td>");
					out.print("</tr>");

				}
				out.print("</table>");
			}
			else{
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "select u.username, sum(r.fare) as revenue " + 
						"from user_info u, reservations r " + 
						"where u.username = r.username " +
							"and u.affil = 'customer' " +
						"group by u.username";
				//Run the query against the database
				ResultSet result = stmt.executeQuery(str);
				
				//Make an HTML table to show the results in:
				out.print("<table>");
	
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//print out column header
				out.print("Customer");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print("Revenue");
				out.print("</td>");
				
				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out month:
					out.print(result.getString("username"));
					out.print("</td>");
					out.print("<td>");
					//Print out revenue:
					out.print(result.getString("revenue"));
					out.print("</td>");
					out.print("</tr>");

				}
				out.print("</table>");
			}

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>
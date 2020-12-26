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
			//Get the selected radio button from the index.jsp
			String station = request.getParameter("station");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String tempTbl = "create temporary table resNums " + 
					"select r.transit_line, sum(res.res_num) as custRes " + 
					"from run_on r, reservations res " + 
					"where r.trainID = res.trainID " +
					"group by r.transit_line " +
					"order by custRes desc; ";

			//Run the query against the database.
			stmt.execute(tempTbl);
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String tempTbl2 = "create temporary table resNums2 " + 
		            "select * " +
		            "from resNums ";

			//Run the query against the database.
			stmt.execute(tempTbl2);
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "select transit_line " +
					"from resNums " + 
					"limit 0, 5 ";			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		
			out.print("5 Most Active Transit Lines: ");

			while (result.next()) { %>
				<br>
				<tr>    
					<td><%= result.getString("transit_line") %></td>  
				</tr>
			<% }
			
		//close the connection.
		db.closeConnection(con);
			
		} catch (Exception e) {
			out.print(e);
		}%>

	</body>
</html>
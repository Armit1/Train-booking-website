<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://armit336db.cjceb6bpkqj3.us-east-2.rds.amazonaws.com:3306/train_station";
String userId = "armit1";
String password = "thearmit";

try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>All Available tickets</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<div align="center">
<a href = "newRes.jsp"> Make Reservation</a>
</div>
<tr bgcolor="#A52A2A">
<td><b>departure</b></td>
<td><b>arrival</b></td>
<td><b>transit_line</b></td>
<td><b>travel_time</b></td>
<td><b>origin</b></td>
<td><b>destination</b></td>
<td><b>trainID</b></td>
<td><b>fare</b></td>

</tr>
<%
try{ 

connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM run_on";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
			
<td><%=resultSet.getString("departure") %></td>
<td><%=resultSet.getString("arrival") %></td>
<td><%=resultSet.getString("transit_line") %></td>
<td><%=resultSet.getString("travel_time") %></td>
<td><%=resultSet.getString("origin") %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("trainID") %></td>
<td><%=resultSet.getString("fixed_fare") %></td>
</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
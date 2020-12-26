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
<h2 align="center"><font><strong>Reservation Portfolio</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<a href = "deleteForm.jsp"> Cancel Reservation</a>
</tr>
<tr bgcolor="#A52A2A">
<td><b>ssn</b></td>
<td><b>res_num</b></td>
<td><b>username</b></td>
<td><b>date_made</b></td>
<td><b>fare</b></td>
<td><b>trainID</b></td>
<td><b>is_roundTrip</b></td>
<td><b>is_oneWay</b></td>


</tr>
<%
try{ 

connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String user = (String) session.getAttribute("username");
String sql ="SELECT * FROM reservations WHERE username =" + "'" + user + "'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("ssn") %></td>
<td><%=resultSet.getString("res_num") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("date_made") %></td>
<td><%=resultSet.getString("fare") %></td>
<td><%=resultSet.getString("trainID") %></td>
<td><%=resultSet.getString("is_roundTrip") %></td>
<td><%=resultSet.getString("is_oneWay") %></td>

</tr>

<% 
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
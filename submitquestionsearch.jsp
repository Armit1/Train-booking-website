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
<h2 align="center"><font><strong>Search Results</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<div align="center">
<a href = "allQuestions.jsp"> Return to main page</a>
</div>
<tr bgcolor="#A52A2A">
<td><b>questions</b></td>
<td><b>answers</b></td>
</tr>
<%
try{ 

connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String keyword = request.getParameter("keyword");
String sql ="SELECT * FROM faq WHERE questions LIKE '%" + keyword + "%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("questions") %></td>
<td><%=resultSet.getString("answers") %></td>


</tr>

<% 
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
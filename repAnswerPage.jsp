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
<h2 align="center"><font><strong>Forum</strong></font></h2>

<tr>
<div align="center">
<a href = "allQuestions.jsp"> View forum</a>
<br>
<a href = "searchQuestions.jsp"> Search for a question</a>
<br>
<a href = "representative.jsp"> Return to home page</a>
</div>
</tr>


</tr>
<%
try{ 

connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
//String user = (String) session.getAttribute("username");
String sql ="SELECT * FROM faq";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<td><%=resultSet.getString("questions") %></td>
<br>
<td><%=resultSet.getString("answers") %></td>
<form method="post" action="RepAnswerQuestions.jsp">
  
  <input name="question" type="hidden" value="<%=resultSet.getString("questions")%>">
  <br>
  <td><input type="text" name="answer" /></td>
  <input type="submit" value="Add/Edit Answer" />
</form>

<% 
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
//String id = request.getParameter("userId");
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

try{ 

connection = DriverManager.getConnection(connectionUrl, userId, password);

String sql ="UPDATE faq set answers = ? where questions = ?";
Statement stmt = connection.createStatement();

String question = request.getParameter("question");
String answer = request.getParameter("answer");
System.out.println(question);
System.out.println(answer);

PreparedStatement ps = connection.prepareStatement(sql);

ps.setString(1, answer);
ps.setString(2, question);
ps.executeUpdate();

connection.close();
System.out.println("update succeeded");
} catch (Exception e) {
e.printStackTrace();
System.out.println("update failed");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
Answer posted
<br>
<a href = "allQuestions.jsp"> Return to Forum</a>
<br>
<a href = "representative.jsp"> Return to home page</a>
</div>
</body>
</html>
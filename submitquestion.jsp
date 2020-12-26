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

String sql ="INSERT into faq(questions,answers) values(?,null)";
Statement stmt = connection.createStatement();

String question = request.getParameter("question");

PreparedStatement ps = connection.prepareStatement(sql);

ps.setString(1, question);
ps.executeUpdate();

connection.close();
System.out.println("insert succeeded");
} catch (Exception e) {
e.printStackTrace();
System.out.println("insert failed");
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
Question submitted
<br>
<a href = "allQuestions.jsp"> Return to Forum</a>
</div>
</body>
</html>
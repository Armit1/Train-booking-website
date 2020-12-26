<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Rep</title>
	</head>
<body>

Hello Customer Representative!<!-- the usual HTML way -->
									  
<br>
<form method="post" action="editTrain.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
	TrainId: <input type="text" name="train">
	<br>
	Edit <input type="text" name="edit">
	<br>
	<select name="command" size=1>
		<option value="depart">Depart Time</option>
		<option value="arrive">Arrival Time</option>
		<option value="travel">Travel Time</option>
		<option value="transit">Transit Line</option>
		<option value="origin">Origin</option>
		<option value="destination">Destination</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit" />
</form>
<br>

<br>
<form method="post" action="deleteTrain.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
	Delete from Train: <input type="text" name="train">
	<br>
	<select name="command" size=1>
		<!-- <option value="depart">Depart Time</option>
		<option value="arrive">Arrival Time</option>
		<option value="transit">Transit Line</option> -->
		<option value="travel">Travel Time</option>
		<option value="origin">Origin</option>
		<option value="destination">Destination</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit" />
</form>
<br>

<form method="get" action="genCustomer.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
	Find customers with reservations for: 
	<br>
	Transit Line:<input type="text" name="transit_line">
	<br>
	Date:<input type="text" name="arrival">
	<br>
	<input type="submit" value="submit" />
</form>
<br>

<form method="get" action="genSchedule.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
	Find schedules with this station as an origin/destination: 
	<br>
	Station:<input type="text" name="station">
	<br>
	<input type="submit" value="submit" />
</form>
<br>


<br>

<a href = "repAnswerPage.jsp"> Answer Customer Questions</a>

<br>


<br>

<a href = "logout.jsp"> Logout</a>

<br>

</body>
</html>
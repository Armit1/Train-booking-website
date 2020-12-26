<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Admin</title>
    </head>
<body>

Hello Admin!<!-- the usual HTML way -->
<br>                                   


<br>
<form method="post" action="editTrain.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
    Edit Train Information:
    <br>
	TrainId: <input type="text" name="train">
	<br>
	Edit <input type="text" name="edit">
	<br>
	<select name="command" size=1>
		<option value="travel">Travel Time</option>
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
	Delete Train Information:
	<br>
	TrainID: <input type="text" name="train">
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
<form method="post" action="addCust.jsp">
	<!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
	Add Info to Customer Representative:
	<br>
	SSN: <input type="text" name="ssn">
	<br>
	Add to Customer Representative: <input type="text" name="add">
	<br>
	<select name="command" size=1>
		<option value="firstName">First Name</option>
		<option value="lastName">Last Name</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit" />
</form>
<br>

<br>
<form method="post" action="editCust.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
	Edit Customer Representative Information:
	<br>
	SSN: <input type="text" name="ssn">
	<br>
	Edit in Customer Representative: <input type="text" name="edit">
	<br>
	<select name="command" size=1>
		<option value="firstName">First Name</option>
		<option value="lastName">Last Name</option>
	</select>&nbsp;<br>
 	<input type="submit" value="submit" />
</form>
<br>

<br>
<form method="post" action="deleteCust.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
    <!-- The next lines give HTML for radio buttons being displayed -->
    Delete Customer Representative Information:
	<br>
    SSN of Customer Representative: <input type="text" name="ssn">
	<br>
	<select name="command" size=1>
		<option value="firstName">First Name</option>
		<option value="lastName">Last Name</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit" />
</form>
<br>

Obtain Sales Reports per Month:
<br>
	<form method="get" action="salesPerMonth.jsp">
	<input type="submit" value="submit">
	</form>
<br>

Produce a List of Reservations:
<br>
	<form method="get" action="reservationsList.jsp">
	<select name="command" size=1>
		<option value="transitLine">Transit Line</option>
		<option value="cust">Customer Name</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit">
	</form>
<br>

Produce a List of Revenues:
<br>
	<form method="get" action="revenuesList.jsp">
	<select name="command" size=1>
		<option value="transitLine">Transit Line</option>
		<option value="cust">Customer Name</option>
	</select>&nbsp;<br>
	<input type="submit" value="submit">
	</form>
<br>

Determine the Best Customer:


	<form method="get" action="bestCust.jsp">
	<input type="submit" value="submit">
	</form>
<br>

Determine the 5 Most Active Transit Lines:
<br>
	<form method="get" action="activeLines.jsp">
	<input type="submit" value="submit">
	</form>
<br>

</body>
</html>



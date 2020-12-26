<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Search for train schedules and reserve tickets. </h1>
<p> Note: Please insert date in "YYYY-MM-DD" format </p>
<form action="searchSubmit.jsp" method="post">
  	<label for="origin">Origin:</label>
  	<input type="text" id="origin" name="origin">
  	
  	<label for="destination">Destination:</label>
  	<input type="text" id="destination" name="destination">
  	
  	<label for="dateOfTravel">Date of Travel:</label>
  	<input type="text" id="dateOfTravel" name="dateOfTravel">
  	<br>
  	<br>
  	<p>Sorting Options in Ascending Order:</p>
  	<input type="radio" name="sort" value = "1">
	<label for="arrival">Arrival</label>
	<input type="radio" name="sort" value = "2">
	<label for="departure">Departure</label>
	<input type="radio" name="sort" value = "3"/>
	<label for="fare">Fare</label>
	<br>
  	
  	
  	<input type="submit" value="Submit">
</form>

<br>




</body>
</html>
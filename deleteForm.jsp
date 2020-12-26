<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Cancel Reservation</h1>
		<form action="../deleteres" method="post">
			<table style="with: 100%">
				<tr>
					<td>Enter reservation number</td>
					<td><input type="text" name="res_num" /></td>
				</tr>
		
			</table>
			<input type="submit" value="Submit" />
		</form>
		<a href = "allTrains.jsp"> View all available trains</a>
		<a href = "reservationHistory.jsp"> View reservation portfolio</a>
	</div>
</body>
</html>
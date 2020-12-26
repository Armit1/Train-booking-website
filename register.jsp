<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>
</head>
<body>
	<div align="center">

		<h1>Register Account</h1>
		<form action="<%=request.getContextPath()%>/register" method="post">
		<table style="with: 100%">
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="password" /></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="first_name" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="last_name" /></td>
				</tr>
				
				
				
				
		</table>
		
		<p>Fill in any of that apply:</p>
			
			<input type="radio" name="discount_type" value = "child">
			<label for="child">Child</label>
			<input type="radio" name="discount_type" value = "senior">
			<label for="senior">Senior</label>
			<input type="radio" name="discount_type" value = "disabled"/>
			<label for="disabled">Disabled</label>
			<br>
			<br>
					
		<input type="submit" value="Submit" />
		</form>
	</div>
</body>
</html>
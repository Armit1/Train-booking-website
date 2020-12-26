<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%


	if(request.getParameter("buttonChk") != null) {
	
	 
    	System.out.println("GAMER!");
   
    	
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
		<h1>Customer Login</h1>
		<form action="<%=request.getContextPath()%>/login" method="post">
			<table style="with: 100%">
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" />
		</form>
		<a href = "register.jsp"> Don't have an account? Register here!</a> <!--  Might want to use servlet redirect instead. Idk lets see if it causes problems -->
	</div>
</body>
</html>



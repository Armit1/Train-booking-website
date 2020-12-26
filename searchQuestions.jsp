<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search questions</title>
</head>
<body>
	<div align="center">
		<h1>Search for a question</h1>
		<form action="submitquestionsearch.jsp" method="post">
			<table style="with: 100%">
				<tr>
					<td>Enter keyword(s)</td>
					<td><input type="text" name="keyword" /></td>
				</tr>
			</table>
			<input type="submit" value="Submit" />
		</form>
	</div>
</body>
</html>
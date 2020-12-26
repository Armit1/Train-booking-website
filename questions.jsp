<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

   <head>
      <title>Submit new question</title>
   </head>

   <body>
       <form action="submitquestion.jsp" method="post">
         Ask a question: 
         <br>
         <textarea rows = "5" cols = "50" name = "question">
           
         </textarea>
         
         <input type = "submit" value = "submit" />
     	</form>
   </body>

</html>


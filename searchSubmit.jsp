<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>   
<%@page import="java.sql.SQLException"%>  
<%@page import="java.util.ArrayList"%> 
<%@page import="com.databaseCon.pkg.SearchDao"%> 
<%@page import="com.beans.pkg.SearchBean"%> 
<%@page import="com.beans.pkg.ReserveBean"%> 
<%@page import="java.io.*,java.util.*,java.sql.*"%>
   
<%
	
	
	if(request.getParameter("submitNum") != null) {
	
		ArrayList<ReserveBean> reservations = (ArrayList<ReserveBean>) session.getAttribute("array");
				
		int submitNum =  Integer.parseInt(request.getParameter("submitNum"));
		request.setAttribute("reservation", reservations.get(submitNum));
        RequestDispatcher rd = request.getRequestDispatcher("reserve");
        rd.forward(request,response);
        
		
	}


	

%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Train Schedules</title>
</head>
<body>



<%

	SearchDao searchDao = new SearchDao();
	SearchBean searchBean = new SearchBean();

	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	String dateOfTravel = request.getParameter("dateOfTravel");
	int counter = 0; 
	int sortNum;
	
	searchBean.setOrigin(origin);
	searchBean.setDestination(destination);
	searchBean.setDateOfTravel(dateOfTravel);

	if(!(request.getParameter("sort") == null)){
		sortNum = Integer.parseInt(request.getParameter("sort"));
	}
	else{
		sortNum = 0;
	}
	
	
	
	try { 
		ResultSet rs = searchDao.query(searchBean, sortNum);
		ResultSet rs2 = searchDao.queryStops(searchBean, sortNum);
		
		
		/*Keep track of list of possible reserves in case customer reserves*/
		ArrayList<ReserveBean> reservations = new ArrayList<ReserveBean>();
%>

<h1> Train Schedules </h1>
<br>
<br>
<h2> Full Transit Line Reservations </h2>
<table border=1 width=70% height=20%>
<tr>

	<th>Selection Number</th>
	<th>Transit Line Name</th>
    <th>Train ID</th>
    <th>Origin Station</th>
    <th>Destination Station</th>
    <th>Arrival Datetime</th>
    <th>Departure Datetime</th>
    <th>Trip Type</th>
    <th>Total Fare</th>
</tr> 
            
<%
while (rs.next()) 
{        	
    
	String transit_line = rs.getString("transit_line");  
	int trainID = Integer.parseInt(rs.getString("trainID"));  
	String originSt = rs.getString("origin");  
	String destSt = rs.getString("destination");   
	String arrival = rs.getString("arrival");
	String departure = rs.getString("departure");
	String trip_type = rs.getString("trip_type");
	int fare = Integer.parseInt(rs.getString("fare"));
	String username = (String)session.getAttribute("username");
	
	
	ReserveBean reserve = new ReserveBean();
	
	reserve.setUsername(username);
	reserve.setTrainID(trainID);
	reserve.setStopSt(originSt);
	reserve.setFare(fare);
	reserve.setTravel_dateTime(arrival);
	
	if(trip_type.equals("Round Trip")) {
		reserve.setIs_roundTrip(1);
	}
	else {
		reserve.setIs_roundTrip(0);
	}
	
	reservations.add(reserve);
%>

<tr>
	<td><%= counter %></td>
	<td><%= transit_line %></td>
	<td><%= trainID %></td>
	<td><%= originSt %></td>
	<td><%= destSt %></td>
	<td><%= arrival %></td>
	<td><%= departure %></td>
	<td><%= trip_type %></td>
	<td><%= fare %></td>
</tr>
	
<%
	counter++;
}
%>

</table>

<br>
<br>

<h3> Partial Transit Line Reservations </h3>

<table border=1 width=70% height=20%>


<tr>

	<th>Selection Number</th>
	<th>Stop Station</th>
	<th>Transit Line Name</th>
    <th>Train ID</th>
    <th>Origin Station</th>
    <th>Destination Station</th>
    <th>Arrival Datetime</th>
    <th>Departure Datetime</th>
    <th>Stop Number</th>
    <th>Fare</th>
</tr> 


<%
	while (rs2.next()) 
	{
		String transit_line = rs2.getString("transit_line");  
		int trainID = Integer.parseInt(rs2.getString("trainID"));  
		String originSt = rs2.getString("origin");  
		String destSt = rs2.getString("destination");   
		String arrival = rs2.getString("arrive_stop");
		String departure = rs2.getString("depart_stop");
		String stopSt = rs2.getString("name");
		int stopNum = Integer.parseInt(rs2.getString("stopNum"));
		int fare = Integer.parseInt(rs2.getString("fare"));
		String username = (String)session.getAttribute("username");

		ReserveBean reserve = new ReserveBean();

		reserve.setUsername(username);
		reserve.setTrainID(trainID);
		reserve.setStopSt(stopSt);
		reserve.setFare(fare);
		reserve.setIs_roundTrip(0);
		reserve.setTravel_dateTime(arrival);

		reservations.add(reserve);
%>


<tr>
	<td><%= counter %></td>
	<td><%= stopSt %></td>
	<td><%= transit_line %></td>
	<td><%= trainID %></td>
	<td><%= originSt %></td>
	<td><%= destSt %></td>
	<td><%= arrival %></td>
	<td><%= departure %></td>
	<td><%= stopNum %></td>
	<td><%= fare %></td>
</tr>

<%
		counter++;
	}

	//System.out.println(reservations.get(0).getFare());
	session.setAttribute("array", reservations);

%>

</table>
<br>

<p> Choose your selection number to make reservation </p>

<form method="post">
  	<input type="text" id="submitNum" name="submitNum">
  	<input type="submit" value="Submit">
</form>
<%}catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
%>







</body>
</html>
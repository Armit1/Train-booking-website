<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
String id = request.getParameter("userId");
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
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Past Reservation Portfolio</strong></font></h2>
<a href = "customer.jsp"> Return to portal</a>
<h3>Full Transit Line Reservations</h3>
<table align="center" cellpadding="7" cellspacing="7" border="1">

<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Reservation #</b></td>
<td><b>Date Made</b></td>
<td><b>Transit Line</b></td>
<td><b>Train ID</b></td>
<td><b>Origin</b></td>
<td><b>Destination</b></td>
<td><b>Arrival Datetime</b></td>
<td><b>Departure Datetime</b></td>
<td><b>Trip Type</b></td>
<td><b>Fare</b></td>
</tr>
<%
try{ 

String username = (String)session.getAttribute("username");
java.util.Date utilDate = new java.util.Date();
long date = utilDate.getTime();
java.sql.Date sqlDate = new java.sql.Date(date);
	
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();



PreparedStatement preparedStatement = connection
.prepareStatement("SELECT res.res_num,"
		   +"res.trainID,"
	       +"res.is_RoundTrip,"
	       +"res.date_made,"
	       +"res.stopStation,"
	       +"res.fare,"
	       +"r.origin,"
	       +"r.destination,"
	       +"r.arrival,"
	       +"r.departure,"
	       +"r.transit_line "
		   +"FROM reservations res, run_on r "
		   +"WHERE res.trainID = r.trainID " 
		   +"AND res.username = ?"
		   +"AND datediff(r.arrival, ?) < 0 "
		   +"AND datediff(res.travel_dateTime, r.arrival) = 0");
		

preparedStatement.setString(1, username);
preparedStatement.setDate(2, sqlDate);
resultSet = preparedStatement.executeQuery();


while(resultSet.next()){
	
	String origin = resultSet.getString("origin");	
	String stopStation = resultSet.getString("stopStation");	
	String trip_type = resultSet.getString("is_roundTrip");
	
	
	if(!origin.equals(stopStation)){
		continue;
	}
	
	
	
	if(trip_type.equals("1")){
		trip_type = "Round Trip";
	}
	else{
		trip_type = "One Way";
	}
	
	
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("res_num") %></td>
<td><%=resultSet.getString("date_made") %></td>
<td><%=resultSet.getString("transit_line") %></td>
<td><%=resultSet.getString("trainID") %></td>
<td><%=origin %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("arrival")%></td>
<td><%=resultSet.getString("departure")%></td>
<td><%= trip_type %></td>
<td><%=resultSet.getString("fare") %></td>
</tr>


<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<br>

<h4>Partial Transit Line Reservations</h4>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>Reservation #</b></td>
<td><b>Date Made</b></td>
<td><b>Transit Line</b></td>
<td><b>Train ID</b></td>
<td><b>Origin</b></td>
<td><b>Destination</b></td>
<td><b>Stop Number</b></td>
<td><b>Stop Station</b></td>
<td><b>Arrival Datetime</b></td>
<td><b>Departure Datetime</b></td>
<td><b>Trip Type</b></td>
<td><b>Fare</b></td>
</tr>

<%
try{ 

String username = (String)session.getAttribute("username");
	
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();

java.util.Date utilDate = new java.util.Date();
long date = utilDate.getTime();
java.sql.Date sqlDate = new java.sql.Date(date);

PreparedStatement preparedStatement = connection
.prepareStatement("SELECT res.res_num,"
		   +"res.trainID,"
	       +"res.is_RoundTrip,"
	       +"res.date_made,"
	       +"res.stopStation,"
	       +"res.fare,"
	       +"r.origin,"
	       +"r.destination,"
	       +"r.transit_line,"
	       +"s.arrive_stop,"
	       +"s.depart_stop,"
	       +"s.stopNum "
		   +"FROM reservations res, run_on r, stops s, stations st "
		   +"WHERE res.trainID = r.trainID "
		   +"AND r.trainID = s.trainID "
		   +"AND res.stopStation = st.name "
		   +"AND s.stationID = st.stationID "
		   +"AND res.username = ?"
		   +"AND datediff(r.arrival, ?) < 0 "
		   +"AND datediff(s.arrive_stop, r.arrival) = 0 "
		   +"AND datediff(res.travel_dateTime, s.arrive_stop) = 0");
		

preparedStatement.setString(1, username);
preparedStatement.setDate(2, sqlDate);
resultSet = preparedStatement.executeQuery();

while(resultSet.next()){
	
	String origin = resultSet.getString("origin");	
	String stopStation = resultSet.getString("stopStation");	
	String trip_type = resultSet.getString("is_roundTrip");
	
	
	if(origin.equals(stopStation)){
		continue;
	}
	
	
	
	if(trip_type.equals("1")){
		trip_type = "Round Trip";
	}
	else{
		trip_type = "One Way";
	}
	
	
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("res_num") %></td>
<td><%=resultSet.getString("date_made") %></td>
<td><%=resultSet.getString("transit_line") %></td>
<td><%=resultSet.getString("trainID") %></td>
<td><%=origin %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("stopNum") %></td>
<td><%=resultSet.getString("stopStation") %></td>
<td><%=resultSet.getString("arrive_stop")%></td>
<td><%=resultSet.getString("depart_stop")%></td>
<td><%= trip_type %></td>
<td><%=resultSet.getString("fare") %></td>
</tr>



<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

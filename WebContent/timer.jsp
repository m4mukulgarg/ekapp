<%@page import="ekapp.UserCategory"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<p id="timer"></p>
<% SimpleDateFormat sdf = new SimpleDateFormat ("MMM dd, yyyy HH:mm:ss");
Date dateStart = (Date)application.getAttribute("Election_Start_Date");
Date dateStop = (Date)application.getAttribute("Election_Stop_Date");


if (dateStop == null){
	dateStop =new Date();
}
if (dateStart == null){
	dateStart  =new Date();
	
}
%>
<script>

// Set the date we're counting down to
var countDownDate = new Date("<%out.write(sdf.format(dateStop));%>").getTime();
var countStartDate = new Date("<%out.write(sdf.format(dateStart));%>").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("timer").innerHTML = "Time Left:<br>" + days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (now < countStartDate) {
        clearInterval(x);
        document.getElementById("timer").innerHTML = "POLLING HAS NOT STARTED YET";
    }
    else
    if (distance < 0 ) {
        clearInterval(x);
        document.getElementById("timer").innerHTML = "POLLING HAS CONCLUDED";
    }
    
}, 1000);
</script>
<%@page import="ekapp.UserCategory"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%><%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<p id="timer2"></p>

<script>

<% SimpleDateFormat sdfs = new SimpleDateFormat ("MMM dd, yyyy HH:mm:ss");
String dates = getServletContext().getInitParameter("Election_Stop_Date");

if (dates == null){
	Date ds =new Date();
	dates = sdfs.format(ds);
}
%>

// Set the date we're counting down to
var countDownDates = new Date("<%out.write(dates);%>").getTime();

// Update the count down every 1 second
var xs = setInterval(function() {

    // Get todays date and time
    var nows = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distances = countDownDates - nows;
    
    // Time calculations for days, hours, minutes and seconds
    var dayss = Math.floor(distances / (1000 * 60 * 60 * 24));
    var hourss = Math.floor((distances % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutess = Math.floor((distances % (1000 * 60 * 60)) / (1000 * 60));
    var secondss = Math.floor((distances % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("timer2").innerHTML = "Time Left:<br>" + dayss + "d " + hourss + "h "
    + minutess + "m " + secondss + "s ";
    
    // If the count down is over, write some text 
    if (distances < 0) {
        clearInterval(xs);
        document.getElementById("timer2").innerHTML = "NO POLL IS RUNNING";
    }
}, 1000);
</script>
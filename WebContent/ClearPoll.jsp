<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Thread start = (Thread) application.getAttribute("StartPollThread");
Thread stop = (Thread) application.getAttribute("StopPollThread");
if(start != null && start.isAlive())
	start.stop();
if(stop != null && stop.isAlive())
	stop.stop();
application.setAttribute("Election_Stopped",Boolean.parseBoolean("true"));
application.setAttribute("Election_Start_Date", null);
application.setAttribute("Election_Stop_Date", null);
%>
<p>Cleared the schedule!</p>
</body>
</html>
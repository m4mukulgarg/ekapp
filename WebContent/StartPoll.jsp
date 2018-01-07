<%@page import="ekapp.UserCategory"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Date dateStart = (Date)application.getAttribute("Election_Start_Date");
Date dateStop = (Date)application.getAttribute("Election_End_Date");
if(dateStart !=null && dateStop != null){
	out.write("<p>An election is already scheduled!</p>");
}else{
try{
	
	
	
	//take input from form
	SimpleDateFormat sdfsIn = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
	String startDate = request.getParameter("start_date") +" "+ request.getParameter("start_time");
	String endDate = request.getParameter("end_date") + " " + request.getParameter("end_time");
	
	Date start = sdfsIn.parse(startDate);
	Date end = sdfsIn.parse(endDate);
	
	//set output in ServletContext
	application.setAttribute("Election_Start_Date",start);
	application.setAttribute("Election_End_Date",end);
	//TODO
	//application.setAttribute("Election_Started",Boolean.parseBoolean("true"));
		//application.setAttribute("Election_Started",Boolean.parseBoolean("true"));

	


}catch(Exception e){
	e.printStackTrace();
}

final Thread stopElection = new Thread(){
	Date endDate = (Date) application.getAttribute("Election_end_Date");
	@Override
	public void run(){
		
		while(true){
			Date d = new Date();
			
			if(d.getTime() == endDate.getTime()){
				application.setAttribute("Election_Stopped",Boolean.parseBoolean("true"));
				break;
			}
		}
	}
};


final Thread startElection = new Thread(){
	Date startDate = (Date) application.getAttribute("Election_Start_Date");
	@Override
	public void run(){
		
		while(true){
			Date d = new Date();
			
			if(d.getTime() == startDate.getTime()){
				application.setAttribute("Election_Started",Boolean.parseBoolean("true"));
				break;
			}
		}
		stopElection.setDaemon(true);
		stopElection.start();
	}
};
application.setAttribute("StartPollThread", startElection);
application.setAttribute("StopPollThread", stopElection);
startElection.setDaemon(true);
startElection.start();

}%>
</body>
</html>
<%@page import="ekapp.UserCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="ekapp.Party"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%>


<%
try{
Long id = Long.parseLong(request.getParameter("party_id"));
if (Party.removeParty(id))
	out.write("success");
else
	out.write("An error occured");
}catch(Exception e){
	e.printStackTrace();
	out.write("An error occured");
}

%>
</body>
</html>
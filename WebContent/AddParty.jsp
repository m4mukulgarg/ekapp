<%@page import="ekapp.Party"%>
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
	try{
		Long id = Long.parseLong(request.getParameter("party_id"));
		String name =request.getParameter("party_name");
		Party p = new Party();
		p.setParty_id(id);
		p.setName(name);
		
		if(p.addParty()){
			out.write("success");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		out.write("An error occurred!");
	}
	

%>
</body>
</html>
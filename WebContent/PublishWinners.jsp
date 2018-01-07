<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%try{
Boolean isWinnersPublished;
String pub = request.getParameter("pub");
if(pub != null &&  pub.equalsIgnoreCase("publish")){
	isWinnersPublished = true;
}
else{ 
	isWinnersPublished = false;
}
application.setAttribute("isWinnersPublished",isWinnersPublished);
out.write("success");
}catch(Exception e){
	e.printStackTrace();
	out.write("An error occurred!");
}
%>
</body>
</html>
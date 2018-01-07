<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String referer="default.jsp";
	session.removeAttribute("user_id");
	session.removeAttribute("user");
	session.setAttribute("type","Guest");
	response.sendRedirect(referer);
%>
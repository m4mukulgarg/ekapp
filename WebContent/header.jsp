
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.*,java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "com.mysql.jdbc.*" %>


<!-- Set up hitCount -->
<%
	Integer hits = 0;
	if(null != (getServletContext().getAttribute("hits"))){
		hits = (Integer) getServletContext().getAttribute("hits");
	}
	getServletContext().setAttribute("hits", ++hits);
	
%>



<!-- //hitCount set up -->

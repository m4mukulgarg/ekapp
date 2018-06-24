<%@ page import = "ekapp.*" %>
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
  <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
      <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand" href="Dashboard.jsp">Dashboard</a>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="default.jsp">Home <span class="sr-only">(current)</span></a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="profile/profile.jsp">Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Dashboard.jsp?p=Election">Election</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Dashboard.jsp?p=Users">Users</a>
          </li>
        </ul>
        <A class="navbar-brand" href="profile.jsp">Hello, <%if(null!=session.getAttribute("user")) out.write(((Users)session.getAttribute("user")).getName()); %>!</A>
        <FORM class="navbar-form navbar-right" action="logout.jsp" method="post">
				<BUTTON type="submit" class="btn btn-success">Logout</BUTTON>
			</FORM>
      </div>
    </nav>
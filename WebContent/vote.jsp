<%@page import="java.awt.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList, ekapp.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%
	ArrayList<Users> ps = Users.getUsersByPost(Post.PRESIDENT);
	ArrayList<Users> vps = Users.getUsersByPost(Post.V_PRESIDENT);
	ArrayList<Users> secs = Users.getUsersByPost(Post.SECRETARY);
	ArrayList<Users> j_secs = Users.getUsersByPost(Post.J_SECRETARY);
	ArrayList<Users> ts = Users.getUsersByPost(Post.TREASURER);
	session.removeAttribute("referer");
	session.setAttribute("referer", "/vote.jsp");
	Users usr = (Users) session.getAttribute("user");
	if (null == usr) {
		response.sendRedirect("/login.jsp");
	} else if (usr.hasVoted()) {
		out.write("Already Voted");
	} else if (!(usr.hasVoted())) {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--A Design by the_professor
Author: The Professor
Author URL: http://the_professor.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<html>
<head>
<title>Vote | Shyamlal College</title>
<!-- Bootstrap core CSS -->
<LINK href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<LINK href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<link href="css/vote-form-style.css" rel="stylesheet" type="text/css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Easy Contact Form  Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--web-fonts-->
<link
	href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic'
	rel='stylesheet' type='text/css'>

<!--web-fonts-->
</head>
<body>
	<jsp:include page="/navbar.jsp" />

	<!---header--->
	<div class="clear"></div>
	<div class="header">
		<h1>Voting Form</h1>
	</div>
	<!---header--->
	<!---main--->
	<div class="main">
		<div class="main-section">
			<div class="login-form">
				<h2>Choose your candidates...</h2>
				<form action="registerVote.jsp" method="get">
					<ul>
						<li class="text-info">President</li>
						<li><select class="form-control" name="president">
								<%
									for (Users u : ps) {
								%>
								<option value="<%out.write(u.getEmail());%>">
									<%
										out.write(u.getName() + ", Party: " + u.getParty_id() + u.getName());
									%>
								</option>
								<%
									}
								%>
						</select></li>
						<!-- <div class="clear"></div> -->


					</ul>
					<ul>
						<li class="text-info">V. President</li>
						<li><select class="form-control" name="v_president">
								<%
									for (Users u : vps) {
								%>
								<option value="<%out.write(u.getEmail());%>">
									<%
										out.write(u.getName() + ", Party: " + u.getParty_id());
									%>
								</option>
								<%
									}
								%>
						</select></li>
						<!-- <div class="clear"></div> -->
					</ul>
					<ul>
						<li class="text-info">Secretary</li>
						<li><select class="form-control" name="secretary">
								<%
									for (Users u : secs) {
								%>
								<option value="<%out.write(u.getEmail());%>">
									<%
										out.write(u.getName() + ", Party: " + u.getParty_id());
									%>
								</option>
								<%
									}
								%>
						</select></li>
						<!-- <div class="clear"></div> -->
					</ul>
					<ul>
						<li class="text-info">J. Secretray</li>
						<li><select class="form-control" name="j_secretary">
								<%
									for (Users u : j_secs) {
								%>
								<option value="<%out.write(u.getEmail());%>">
									<%
										out.write(u.getName() + ", Party: " + u.getParty_id());
									%>
								</option>
								<%
									}
								%>
						</select></li>
						<!-- <div class="clear"></div> -->
					</ul>
					<ul>
						<li class="text-info">Treasurer</li>
						<li><select class="form-control" name="treasurer">
								<%
									for (Users u : ts) {
								%>
								<option value="<%out.write(u.getEmail());%>">
									<%
										out.write(u.getName() + ", Party: " + u.getParty_id());
									%>
								</option>
								<%
									}
								%>
						</select></li>
						<!-- <div class="clear"></div> -->
					</ul>
					<input type="submit" value="Submit Vote">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
	<!---main--->
</body>
</html>
<%
	}
%>
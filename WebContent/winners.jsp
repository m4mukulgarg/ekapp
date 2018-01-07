<%	Boolean isWinnersPublished = (Boolean) application.getAttribute("isWinnersPublished");
	if(isWinnersPublished==null || !isWinnersPublished){
		if (null == session.getAttribute("user") || null == session.getAttribute("category")){
			response.sendRedirect("login.jsp");
		}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
	}

%>

<%@page import="java.util.*, java.*, ekapp.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"/>
<%
HashMap<Post,Users> winners = Users.getWinners();
ArrayList<Post> posts = new ArrayList<Post>();
posts.add(Post.PRESIDENT);
posts.add(Post.V_PRESIDENT);
posts.add(Post.SECRETARY);
posts.add(Post.J_SECRETARY);
posts.add(Post.TREASURER);
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
<LINK
	href="css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<LINK
	href="css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="css/vote-form-style.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Easy Contact Form  Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>

<!--web-fonts-->
</head>
<body>
<jsp:include page="navbar.jsp"/>

		<!---header--->
		<div class="header">
			<h1><em>Congratulations!!</em></h1>
		</div>
		<!---header--->
		<!---main--->
			<div class="main">
				<div class="main-section">
					<div class="login-form">
						<form >
								<%for(Post p : posts){%>
									
									<ul>
									 <h1 class="text-info text-info-left"><%out.write(p.getPostString());%></h1>
									 <h2 class="text-info text-info-right"><%out.write(((Users)winners.get(p)).getName()); %></h2>
									 <div class="clear"></div>
									</ul>
									
								<%}%>

	
						</form>
					</div>
				</div>
			</div>
<jsp:include page="footer.jsp"/>
		<!---main--->
</body>
</html>
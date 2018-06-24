<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<jsp:include page="header.jsp"></jsp:include>

<%@page import="java.util.ArrayList"%>
<%@page import="ekapp.*"%>
<%
	if (null != session.getAttribute("user")) {
		response.sendRedirect("/ekapp/default.jsp");
	}

	session.setAttribute("referer", "Register.jsp");
	ArrayList<Party> parties = new ArrayList<Party>();
	parties = Party.getPartiesFromDB(0);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Register | Shyamlal College</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Medical Appointment Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs Sign up Web Templates, 
 Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="css/bootstrap-reg.css" rel="stylesheet" type="text/css" />
<link href="css/wickedpicker.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="css/style_register.css" rel='stylesheet' type='text/css' />
<!--fonts-->
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet">

<!--//fonts-->
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<!--background-->
	<h1>----------------------------------------</h1>
	<div class="bg-agile">
		<div class="book-appointment">
			<h2>Register</h2>
			<form action="DoRegister.jsp" method="get">
				<div class="left-agileits-w3layouts same">
					<div class="gaps">
						<p>Name</p>

						<%
							Users u = null;
							if (null != session.getAttribute("user")) {

								u = Users.getUserFromDB((String) session.getAttribute("user_id"));
								out.write("<p>" + u.getName() + "</p><br>");
							} else {
						%>

						<input type="text" name="user_name" placeholder="" required />
						<%
							}
						%>
					</div>
					<div class="gaps">
						<p>Password</p>
						<input type="password" name="password" placeholder="" required />
					</div>

					<div class="gaps">
						<p>Category</p>
						<select name="cat" class="form-control" required>
							<option value="ADMIN">Admin</option>
							<option value="MANAGEMENT">Management</option>
							<option value="STAFF">Staff</option>
							<option value="CANDIDATE">Candidate</option>
							<option value="STUDENT">Student</option>
						</select>
					</div>

					<div class="gaps">
						<p>Party ID</p>
						<select name="party_id" class="form-control">
							<option value="" />
							<%
								for (Party p : parties) {
							%>
							<option value="<%out.write((p.getParty_id()).toString());%>">
								<%
									out.write((p.getName()) + ", " + (p.getParty_id()).toString());
								%>
							</option>
							<%
								}
							%>

						</select>
					</div>

				</div>
				<div class="right-agileinfo same">
					<div class="gaps">
						<p>Email</p>
						<%
							if (null != session.getAttribute("user")) {
								u = Users.getUserFromDB((String) session.getAttribute("user_id"));
								out.write("<p>" + u.getEmail() + "</p><br>");
							} else {
						%>

						<input type="email" name="user_email" placeholder="" required />
						<%
							}
						%>


					</div>
					<div class="gaps">
						<p>Gender</p>
						<select name="gender" class="form-control">
							<option value="female">Female</option>
							<option value="male">Male</option>
							<option value="others">Others</option>
						</select>

					</div>
					<div class="gaps">
						<p>Address</p>
						<textarea name="address" placeholder="" required></textarea>
					</div>
					<div class="gaps">
						<p>Post Applied</p>
						<select name="post_applied" class="form-control">
							<option value="" />
							<option value="president">President</option>
							<option value="v_president">Vice President</option>
							<option value="secretary">Secretary</option>
							<option value="j_secretary">Joint Secretary</option>
							<option value="treasurer">Treasurer</option>
						</select>
					</div>
				</div>

				<div class="clear">
					<%
						if (null != session.getAttribute("user")) {
					%>
					<input type="submit" value="Update" />
					<%
						} else {
					%>
					<input type="submit" value="Register" />
					<%
						}
					%>
				</div>
				<br>

			</form>

			<div class="copy w3ls">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<!--copyright-->

	<!--//copyright-->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker').wickedpicker({
			twentyFour : false
		});
	</script>
	<!-- Calendar -->

	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>


	<!-- //Calendar -->

</body>
</html>
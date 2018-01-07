<%@page import="ekapp.*"%>
<jsp:include page="header.jsp" />
<%

	Users u = new Users();
try {
	u.setName(request.getParameter("user_name"));
	u.setEmail(request.getParameter("user_email"));
	u.setP(request.getParameter("password"));
	u.setAddress(request.getParameter("address"));
	u.setGender(Gender.parseGender(request.getParameter("gender")));
	
	String category = request.getParameter("cat");
	u.setCategory(UserCategory.parseCategory(category));
	System.out.println(u.getCategory().getCategoryString());
	if (category.equalsIgnoreCase("candidate")){
		
		u.setParty_id(Long.parseLong(request.getParameter("party_id")));
 		u.setPostApplied(Post.parsePost(request.getParameter("post_applied")));
		
 	}
 	else{
		u.setParty_id(0);
 		u.setPostApplied(Post.parsePost("NONE"));
	}
	
	

} catch (Exception e) {
	
	e.printStackTrace();

}
%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Medical Appointment Form a Responsive Widget Template ::
	w3layouts</title>
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
<link href = "css/footer.css" type = 'text/css'/>
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
			<%
					try {
				
						if(!(null == session.getAttribute("user"))){
							u.setEmail((String)session.getAttribute("user_id"));
							u.setName(((Users)session.getAttribute("user")).getName());
							
							u.updateUser();
			%>
							<h2>Updated Successfully!</h2>
			<% 
							
						}
						else{
						u.putUserIntoDb();
						out.write("<h2>Registered Successfully!</h2>");
						}
			%>
						
						<form action="Appointment.jsp" method="get">
							<div class="clear"></div>
							<input type="submit" value="Go to Appointment page">
						</form>
			<%
					} catch (Exception e) {
						out.write("Some error occurred! Please try again later!");
						e.printStackTrace();
					}
			%>
				<div class = "clear"> </div>
				
				
		</div>
		<div align="center"> <jsp:include page="footer.jsp" /></div>
	</div>
	<!--copyright-->
	<div class="copy w3ls">
		<p>
		
		</p>
	</div>
	<!--//copyright-->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker').wickedpicker({
			twentyFour : false
		});
	</script>
	<!-- Calendar -->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>
	<!-- //Calendar -->

</body>
</html>
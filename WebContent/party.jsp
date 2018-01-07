<%@page import="java.util.HashMap"%>
<%@page import="ekapp.*"%>

<jsp:include page="header.jsp"/>

<%
Party p=new Party();
session.setAttribute("referer", "party.jsp");
String party_id = (String) request.getParameter("party_id");
if (null==party_id){
	out.write("No party selected");
}
else{
	p = Party.getPartyFromDB(party_id);
	HashMap<Post,Users> c= p.getCandidates();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><%out.write(p.getName()); %></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Creative Resume Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="p/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="p/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/footer.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="p/css/owl.carousel.css" type="text/css" media="all">
<LINK rel="icon" href="images/favicon_32px.png">
<link href="p/css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="p/css/cm-overlay.css" />
<!-- font-awesome icons -->
<link href="p/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="p/js/jquery-1.11.1.min.js"></script>
<script src="p/js/bootstrap.js"></script>
<!-- menu -->
<link rel="stylesheet" href="p/css/main.css">
<script type="text/javascript" src="p/js/main.js"></script>
<!-- //menu --> 
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({
 
		autoPlay: 3000, //Set AutoPlay to 3 seconds
		autoPlay:true,
		items : 3,
		itemsDesktop : [640,5],
		itemsDesktopSmall : [414,4]
 
	});
	
}); 
</script>
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>
	<!-- banner -->
	<div class="banner" id="home">

		<div class="container">
			
			<div class="w3l-banner-grids">
				<div class="col-md-8 w3ls-banner-right">
					
					<div class="banner-right-info">
						<h1 color="WHITE" ><%out.write(p.getName()); %></h1>
						<h2><%out.write(p.getAgenda_short()); %></h2>
						<p><h2><%out.write(p.getAgenda()); %></h2></p>
					</div>
					<div class="clearfix"> </div>
					<div class="w3-button">
						<div class="w3-button-info m_nav_item">
							<a class="hvr-sweep-to-bottom" href="#contact">Contact Me</a>
						</div>
					</div>
					<div class="social-grids">
						<div class="social-info">
							<h4>Follow : </h4>
						</div>
						<div class="agileinfo-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
								<li><a href="#"><i class="fa fa-vk"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="col-md-4 w3ls-banner-left">
					<div class="w3ls-banner-left-info">
						<h4>PRESIDENT</h4>
						<p><%out.write(c.get(Post.PRESIDENT).getName()); %></p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>VICE PRESIDENT</h4>
						<p><%out.write(c.get(Post.V_PRESIDENT).getName()); %></p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>SECRETARY</h4>
						<p><%out.write(c.get(Post.SECRETARY).getName()); %></p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>JOINT SECRETARY</h4>
						<p><%out.write(c.get(Post.J_SECRETARY).getName()); %></p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>TREASURER</h4>
						<p><%out.write(c.get(Post.TREASURER).getName()); %></p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<jsp:include page="footer.jsp"/>
	
	<script src="p/js/bars.js"></script>
	<script src="p/js/owl.carousel.js"></script> 
</body>	
</html>
<%}%>
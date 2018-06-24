<%@ page import="ekapp.*"%>
<%
	session.setAttribute("referer", "/ekapp/Dashboard.jsp");
%>

<%
	String referer = (String) session.getAttribute("referer");
	if (referer == null) {
		referer = "/ekapp/default.jsp";
	}

	Users u = (Users) session.getAttribute("user");
	if (null == u) {
		response.sendRedirect("/ekapp/login.jsp");
	} else {
%>

<jsp:include page="../header.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Creative Resume a Personal Category Flat Bootstrap
	responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords"
	content="Creative Resume Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<!--// css -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css"
	media="all">
<link href="css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/cm-overlay.css">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- font -->
<link
	href="//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300"
	rel="stylesheet" type="text/css">
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- menu -->
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/main.js"></script>
<!-- //menu -->
<script>
	$(document).ready(function() {
		$("#owl-demo").owlCarousel({

			autoPlay : 3000, //Set AutoPlay to 3 seconds
			autoPlay : true,
			items : 3,
			itemsDesktop : [ 640, 5 ],
			itemsDesktopSmall : [ 414, 4 ]

		});

	});
</script>
<style type="text/css" id="jarallax-clip-0">
#jarallax-container-0 {
	clip: rect(0px, 1009px, 416px, 0);
	clip: rect(0px, 1009px, 416px, 0);
}
</style>
<style type="text/css" id="jarallax-clip-1">
#jarallax-container-1 {
	clip: rect(0px, 1009px, 416px, 0);
	clip: rect(0px, 1009px, 416px, 0);
}
</style>
<style type="text/css" id="jarallax-clip-2">
#jarallax-container-2 {
	clip: rect(0px, 1009px, 443px, 0);
	clip: rect(0px, 1009px, 443px, 0);
}
</style>
</head>
<body>
	<jsp:include page="/navbar.jsp" />
	<div class="banner" id="home">





		<div class="container">

			<div class="w3l-banner-grids">
				<div class="col-md-8 w3ls-banner-right">
					<div class="banner-right-img">
						<img src="images/1.jpg" alt="">
					</div>
					<div class="banner-right-info">
						<h2>
							<%
								out.write(u.getQuote());
							%>
						</h2>
						<p>
							<%
								out.write(u.getAbout());
							%>
						</p>
					</div>
					<div class="clearfix"></div>
					<div class="w3-button">
						<div class="w3-button-info m_nav_item">
							<a class="hvr-sweep-to-bottom" href="#contact">Contact Me</a>
						</div>
					</div>
					<div class="social-grids">
						<div class="social-info">
							<h4>Follow :</h4>
						</div>
						<div class="agileinfo-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
								<li><a href="#"><i class="fa fa-vk"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-banner-left">
					<div class="w3ls-banner-left-info">
						<h4>Job Title</h4>

						<%
							if (u.getCategory() == UserCategory.CANDIDATE) {
						%>
						<p>
							<%
								out.write(u.getPostApplied().getPostString());
							%>
						</p>
						<%
							} else {
						%>
						<p>
							<%
								out.write(u.getCategory().getCategoryString());
									}
							%>
						</p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>Name</h4>
						<p>
							<%
								out.write(u.getName());
							%>
						</p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>Gender</h4>
						<p>
							<%
								out.write(u.getGender().toString());
							%>
						</p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>Address</h4>
						<p>
							<%
								out.write(u.getAddress());
							%>
						</p>
					</div>
					<div class="w3ls-banner-left-info">
						<h4>Email Address</h4>
						<p>
							<a href="mailto:<%out.write(u.getEmail());%>">
								<%
									out.write(u.getEmail());
								%>
							</a>
						</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>




	<%
		}
	%>

</body>
</html>
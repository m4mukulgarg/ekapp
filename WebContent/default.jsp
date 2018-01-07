<%@page import="ekapp.*"%>
<%session.setAttribute("referer", "default.jsp");%>

<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML lang="en">
<HEAD>
<TITLE>Home | EkApp Voting portal</TITLE>
<META charset="utf-8" content="">
<META http-equiv="X-UA-Compatible" content="IE=edge">
<META name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<META name="description" content="">
<META name="author" content="">
<LINK rel="icon" href="images/favicon_32px.png">


<!-- Bootstrap core CSS -->
<LINK
	href="css/bootstrap.min.css"
	rel="stylesheet"/>

<LINK
	href="css/footer.css"
	rel="stylesheet"/>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<LINK
	href="/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet"/>

<!-- Custom styles for this template -->
<LINK
	href="<c:url value="/css/jumbotron.css"/>"
	rel="stylesheet"/>
	<link rel="stylesheet" href="css/sample.css">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<SCRIPT
	src="js/ie-emulation-modes-warning.js"
	type="text/javascript"></SCRIPT>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</HEAD>

<BODY>
<jsp:include page="navbar.jsp"/>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<DIV class="jumbotron">
		<DIV class="container">
			<H1>EkApp Voting portal</H1>
			<P>
				<A class="btn btn-primary btn-lg" href="vote.jsp" role="button">Vote
					&raquo;</A>
			</P>
		</DIV>
	</DIV>

	<DIV class="container">
		<!-- Example row of columns -->
		<DIV class="row">
			<DIV class="col-md-4">
				<H2>MyParty</H2>
				<P>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</P>
				<P>
					<A class="btn btn-default" href="party.jsp?party_id=641791"
						method="GET" role="button">View details &raquo;</A>
				</P>


			</DIV>
			<DIV class="col-md-4">
				<H2>YourParty</H2>
				<P>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</P>
				<P>
					<A class="btn btn-default" href="party.jsp?party_id=641800"
						method="POST" role="button">View details &raquo;</A>
				</P>
			</DIV>
			<DIV class="col-md-4">
				<H2>OurParty</H2>
				<P>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</P>
				<P>
					<A class="btn btn-default" href="party.jsp?party_id=641819"
						method="GET" role="button">View details &raquo;</A>
				</P>
			</DIV>
		</DIV>

		<HR>

	</DIV>
	<!-- /container -->
<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<SCRIPT
		src="js/jquery.min.js"
		type="text/javascript"></SCRIPT>
	<SCRIPT type="text/javascript">
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</SCRIPT>
	<SCRIPT
		src="js/bootstrap.min.js"
		type="text/javascript"></SCRIPT>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<SCRIPT
		src="js/ie10-viewport-bug-workaround.js"
		type="text/javascript"></SCRIPT>
</BODY>
</HTML>

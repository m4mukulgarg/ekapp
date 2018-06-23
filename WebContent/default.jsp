<%@page import="java.util.ArrayList"%>
<%@page import="ekapp.*"%>
<%
	session.setAttribute("referer", "default.jsp");
	ArrayList<Party> parties = new ArrayList<Party>();
	parties = Party.getPartiesFromDB(3);
%>

<jsp:include page="header.jsp" />
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
<LINK href="css/bootstrap.min.css" rel="stylesheet" />

<LINK href="css/footer.css" rel="stylesheet" />

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<LINK href="/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<LINK href="<c:url value="/css/jumbotron.css"/>" rel="stylesheet" />
<link rel="stylesheet" href="css/sample.css">

<SCRIPT src="js/ie-emulation-modes-warning.js" type="text/javascript"></SCRIPT>

</HEAD>

<BODY>
	<jsp:include page="navbar.jsp" />
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

			<%
				for (Party p : parties) {
			%>

			<DIV class="col-md-4">
				<H2><%=p.getName()%>
				</H2>
				<P><%=p.getAgenda_short() + p.getAgenda()%></P>
				<P>
					<A class="btn btn-default"
						href="party.jsp?party_id=<%=p.getParty_id()%>" method="GET"
						role="button">View details &raquo;</A>
				</P>


			</DIV>

			<%
				}
			%>

		</DIV>

		<HR>

	</DIV>
	<!-- /container -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<SCRIPT src="js/jquery.min.js" type="text/javascript"></SCRIPT>
	<SCRIPT type="text/javascript">
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</SCRIPT>
	<SCRIPT src="js/bootstrap.min.js" type="text/javascript"></SCRIPT>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<SCRIPT src="js/ie10-viewport-bug-workaround.js" type="text/javascript"></SCRIPT>
</BODY>
</HTML>

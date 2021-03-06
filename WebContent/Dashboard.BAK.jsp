<%-- <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="ekapp.*"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/favicon_32px.png" />

<title>Dashboard</title>

<!-- Bootstrap core CSS -->
<link href="./Dashboard_files/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./Dashboard_files/dashboard.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="DashNav.jsp" />


	<script type="text/javascript">
		function activate(a) {

			navlinks = document.getElementsByClassName("nav-link");
			for (i = 0; i < navlinks.length; i++) {
				navlinks[i].className = navlinks[i].className.replace(
						" active", "");
			}

			var el = document.getElementById(a).className += " active";

		}
	</script>






	<div margin-top="" class="container-fluid">
		<div class="row">
			<nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar tab">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a onclick="activate('start')" id="start"
					class="nav-link active" href="Dashboard.jsp#1">Start<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a onclick="activate('stop')" id="stop"
					class="nav-link" href="Dashboard.jsp#2">Stop</a></li>
				<li class="nav-item"><a onclick="activate('party')" id="party"
					class="nav-link" href="Dashboard.jsp#3">Party</a></li>
				<li class="nav-item"><a onclick="activate('candidates')"
					id="candidates" class="nav-link" href="Dashboard.jsp#4">Candidates</a>
				</li>
				<li class="nav-item"><a onclick="activate('users')" id="users"
					class="nav-link" href="Dashboard.jsp#5">Users</a></li>
				<li class="nav-item"><a onclick="activate('winners')"
					id="winners" class="nav-link" href="Dashboard.jsp#5">Winners</a></li>
			</ul>

			<div class="nav-item"><jsp:include page="timer.jsp" /></div>

			</nav>

			<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">



			<form action="ClearPoll.jsp" method="get">

				<h2 id="0" align="center">Schedule</h2>
				<h4>Current Schedule</h4>
				<%SimpleDateFormat sdf = new SimpleDateFormat ("MMM dd, yyyy HH:mm:ss");
Date startDate =(Date) application.getAttribute("Election_Start_Date");
Date endDate =(Date) application.getAttribute("Election_End_Date");
%>


				<div class="table-responsive">
					<table class="table table-striped">
						<%	if (null == startDate || null == endDate){ %>

						<thead>
							<tr>
								<td>No Polls Scheduled!</td>
							</tr>

						</thead>

						<%} else {%>
						<thead>
							<tr>
								<th>Starts at</th>
								<th>Ends at</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<% out.write(sdf.format(startDate)); %>
								</td>
								<td>
									<% out.write(sdf.format(endDate)); %>
								</td>
								<td><input value="Clear!" type="submit"></td>
							</tr>
						</tbody>
						<%} %>
					</table>
				</div>
			</form>




			<form action="StartPoll.jsp" method="get">

				<h2 align="center" id="1">Start</h2>
				<h4>Schedule a new Poll</h4>



				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Start</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Time:</td>
								<td><input name="start_time" required="" type="time"></td>

								<td>Date:</td>
								<td><input name="start_date" required="" type="date"></td>
							</tr>

						</tbody>

						<thead>
							<tr>
								<th>End</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Time:</td>
								<td><input name="end_time" type="time" required=""></td>

								<td>Date:</td>
								<td><input name="end_date" type="date" required=""></td>
							</tr>


							<tr>
								<th></th>
								<th></th>
								<th></th>

								<th><input value="Schedule!" type="submit"></th>

							</tr>
						</tbody>

					</table>
				</div>
			</form>

			<h2 align="center" id="2">Stop</h2>
			<h4>Stop the current poll early.</h4>
			<div class="nav-item"></div>

			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th><jsp:include page="timer2.jsp" /></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>

			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./Dashboard_files/jquery-3.1.1.slim.min.js.download"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous" type="text/javascript"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write('<script src="https://v4-alpha.getbootstrap.com/assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="./Dashboard_files/tether.min.js.download"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous" type="text/javascript"></script>
	<script src="./Dashboard_files/bootstrap.min.js.download"
		type="text/javascript"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="./Dashboard_files/ie10-viewport-bug-workaround.js.download"
		type="text/javascript"></script>

</body>
</html>
 --%>
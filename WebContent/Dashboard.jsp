<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="ekapp.*"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")) {
		response.sendRedirect("login.jsp");
	} else if ((UserCategory) session.getAttribute("category") != UserCategory.ADMIN) {
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

				<li class="nav-item"><a onclick="activate('party')" id="party"
					class="nav-link active" href="Dashboard.jsp#0">Party</a></li>


				<li class="nav-item"><a onclick="activate('users')" id="users"
					class="nav-link" href="Dashboard.jsp#1">Users</a></li>

				<li class="nav-item"><a onclick="activate('winners')"
					id="winners" class="nav-link" href="Dashboard.jsp#2">Winners</a></li>
			</ul>

			<div class="nav-item"><jsp:include page="timer.jsp" /></div>

			</nav>

			<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">




			<h2 id="0" align="center">Party</h2>
			<h4>Parties involved in the election.</h4>
			<%
				ArrayList<Party> parties = Party.getPartiesFromDB(0);
			%>

			<div class="table-responsive">
				<table class="table table-striped">


					<thead>
						<tr>
							<th>#</th>
							<th>Name</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Party p : parties) {
						%>
						<tr>
							<td>
								<%
									out.write(p.getParty_id().toString());
								%>
							</td>
							<td>
								<%
									out.write(p.getName());
								%>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>

				</table>
			</div>
			<form action="RemoveParty.jsp">

				<h4>Remove a party</h4>

				<div class="table-responsive">
					<table class="table table-striped">


						<thead>
							<tr>
								<th>Party id:</th>
								<th><input type="number" name="party_id"></th>
								<th><input type="submit" value="Remove"></th>
							</tr>
						</thead>
					</table>
				</div>
			</form>
			<form action="AddParty.jsp">
				<h4>Add a party</h4>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Party id:</th>
								<th><input type="number" name="party_id"></th>
								<th>Name</th>
								<th><input type="text" name="party_name"></th>
								<th><input type="submit" value="Add"></th>
							</tr>
						</thead>
					</table>
				</div>
			</form>


			<h2 id="1" align="center">Users</h2>
			<h4>Pending user registrations.</h4>
			<%
				ArrayList<Users> pendingUsers = Users.getPendingUsers();
			%>

			<div class="table-responsive">
				<table class="table table-striped">


					<thead>
						<tr>
							<th>Email</th>
							<th>Name</th>
							<th>Category</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Users u : pendingUsers) {
						%>
						<tr>
							<td>
								<%
									out.write(u.getEmail());
								%>
							</td>
							<td>
								<%
									out.write(u.getName());
								%>
							</td>
							<td>
								<%
									out.write(u.getCategory().getCategoryString());
								%>
							</td>
							<td><a
								href="ApproveUser.jsp?id=<%out.write(u.getEmail());%>">Approve</a></td>
						</tr>
						<%
							}
						%>
					</tbody>

				</table>
			</div>






			<h2 id="2" align="center">Winners</h2>
			<form action="PublishWinners.jsp">

				<h4>Publish Winners</h4>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th><select name="pub">
										<option value="" />
										<option value="publish">Publish</option>
										<option value="hide">hide</option>
								</select></th>
								<th><input type="submit" value="Publish"></th>
							</tr>
						</thead>
					</table>
				</div>
			</form>

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

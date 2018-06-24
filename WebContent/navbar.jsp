<%@page import="ekapp.*"%>
<!-- nav bar  -->
<NAV class="navbar navbar-inverse navbar-fixed-top">
	<DIV class="container">
		<DIV class="navbar-header">
			<BUTTON type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<SPAN class="sr-only">Toggle navigation</SPAN> <SPAN
					class="icon-bar"></SPAN> <SPAN class="icon-bar"></SPAN> <SPAN
					class="icon-bar"></SPAN>
			</BUTTON>
			<A class="navbar-brand" href="/default.jsp">Home</A>
			<%
				if (null == session.getAttribute("user")) {
			%>

			<A class="navbar-brand" href="/Register.jsp">Register</A>
			<div class="navbar-brand">
				Demo[<a href="/login.jsp?email=admin1010@localohost&pass=abcd@1234">Admin</a>|
				<a
					href="/login.jsp?email=dswanger9@altervista.org&pass=ZrZCD0Mzm8sa">User</a>|<a
					href="/login.jsp?email=candidate4@localohost&pass=abcd@1234">Candidate</a>]
			</div>
			<%
				}
			%>
			<A class="navbar-brand" href="/vote.jsp">Vote</A> <A
				class="navbar-brand" href="/winners.jsp">Winners</A>
			<%
				if (null != session.getAttribute("user")
						&& (UserCategory) session.getAttribute("category") == UserCategory.ADMIN) {
			%>
			<A class="navbar-brand" href="/Dashboard.jsp">Dashboard</A>
			<%
				}
			%>
		</DIV>
		<%
			if (session.getAttribute("type") == null
					|| !(((String) session.getAttribute("type")).equalsIgnoreCase("user"))) {
		%>
		<DIV id="navbar" class="navbar-collapse collapse">
			<FORM class="navbar-form navbar-right" action="/login.jsp"
				method="post">
				<DIV class="form-group">
					<INPUT type="text" placeholder="User id" name="email"
						class="form-control">
				</DIV>
				<DIV class="form-group">
					<INPUT type="password" placeholder="Password" name="pass"
						class="form-control">
				</DIV>
				<BUTTON type="submit" class="btn btn-success">Sign in</BUTTON>
			</FORM>
		</DIV>
		<%
			} else {
		%>
		<DIV id="navbar" class="navbar-collapse collapse">
			<DIV class="navbar-header navbar-right">
				<A class="navbar-brand" href="/profile.jsp">Hello, <%
					out.write(((Users) session.getAttribute("user")).getName());
				%>!
				</A>
				<FORM class="navbar-form navbar-right" action="/logout.jsp"
					method="post">
					<BUTTON type="submit" class="btn btn-success">Logout</BUTTON>
				</FORM>
			</DIV>
		</DIV>
		<%
			}
		%>
		<!--/.navbar-collapse -->
	</DIV>
</NAV>


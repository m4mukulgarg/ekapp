<%@ page import="ekapp.*"%>
<jsp:include page="header.jsp" />

<!-- session logic -->
<%
	String referer = "default.jsp";
%>

<!-- //session logic -->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/favicon_32px.png">
<LINK href="css/footer.css" rel="stylesheet" />
<title>Signin | Shyamlal College</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">

		<%
			if (null != session.getAttribute("user")) {
				response.sendRedirect(referer);
			}

			else if (null == session.getAttribute("user")) {
				try {
					String email = (String) request.getParameter("email");
					if (email != null) {
						Users user = Users.getUserFromDB(email);

						String pass = (String) request.getParameter("pass");
						System.out.println(user);
						System.out.println(user.getP() + " == " + (String) request.getParameter("pass"));

						if (user.equalsPassword(pass)) {
							if (user.isApproved()) {
								session.setAttribute("type", "user");
								session.setAttribute("user_id", email);
								session.setAttribute("user", user);
								session.setAttribute("category", user.getCategory());
								response.sendRedirect(referer);
								System.out.println(email);
								System.out.println(user);
							} else {
								out.write(
										"<p class=\"form-signin\">Your account is under process! Please wait till your account is approved by an admin.</p>");
							}
						} else {
							System.out.println("try again");
						}
					} else {
						System.out.println("user_id is NULL");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>


		<form class="form-signin" action="login.jsp" method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">User_Id</label> <input
				type="email" id="inputUserId" name="email" class="form-control"
				placeholder="User Id" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" name="pass" class="form-control"
				placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" name="saveCookies"
					value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>

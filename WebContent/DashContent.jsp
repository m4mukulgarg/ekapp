<%@page import="ekapp.UserCategory"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "./Dashboard_files/tabview.css">
<script src="./Dashboard_files/tabview.js"></script>
</head>
<body>

<p>Click on the buttons inside the tabbed menu:</p>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">London</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
</div>

<div id="London" class="tabcontent">
  <h3>London</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

     
</body>
</html> 

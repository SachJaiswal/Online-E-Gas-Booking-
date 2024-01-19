<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
HttpSession currentSession = request.getSession(false);
int userId = -1;
String username = "";
String password = "";
String mobile = "";
String email = "";
String address = "";
String aadhaar = "";

if (currentSession != null) {
	userId = (int) currentSession.getAttribute("userId");
	username = (String) currentSession.getAttribute("username");
	password = (String) currentSession.getAttribute("password");
	mobile = (String) currentSession.getAttribute("mobile");
	email = (String) currentSession.getAttribute("email");
	address = (String) currentSession.getAttribute("address");
	aadhaar = (String) currentSession.getAttribute("aadhaar");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Online E Gas</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

.navbar {
	background-color: #333;
}

.navbar a {
	color: white;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

.home-container {
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	margin-top: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.profile-icon i {
	font-size: 18px;
	margin-right: 5px;
}

.navbar-logout i {
	font-size: 18px;
	margin-right: 5px;
}

.footer {
	margin-top: 20px;
	text-align: center;
	color: #777;
}
</style>
</head>
<body>
	<div id="homepg">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Online E Gas</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/home.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/ordergas.jsp">Book Gas
								Cylinder</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/bookingHistory">Booking
								History</a></li>
					</ul>
					<ul class="navbar-nav ml-auto" style="margin-left: 65%;">
						<li class="nav-item"><a class="nav-link profile-icon"
							href="profile2.jsp"> <i class="fas fa-user"></i> Profile
						</a></li>
						<li class="nav-item"><a class="nav-link navbar-logout"
							href="login.jsp"> <i class="fas fa-sign-out-alt"></i> Logout
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container home-container">
		<h1>Welcome to Online E Gas</h1>
		<p>Experience the convenience of booking gas cylinders online with
			Online E Gas. Easily book your gas cylinder, track your booking
			history, and manage your profile all in one place.</p>
		<p>Enjoy the efficiency and simplicity of our platform. Book now
			and have your gas cylinder delivered to your doorstep!</p>
	</div>

	<div class="container footer">
		<p>&copy; 2024 Online E Gas. All rights reserved.</p>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>

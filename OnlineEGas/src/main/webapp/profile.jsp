<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.onlineegas.logReg.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Home Page</title>
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

.form-container {
	padding: 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	margin-top: 20px;
}

.hidden {
	display: none;
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
							href="inprocessorder.jsp" onclick="showSection('orderinprocess')">Home</a></li>

						<li class="nav-item"><a class="nav-link"
							href="completedorder.jsp" >Completed
								Orders</a></li>
						<li class="nav-item"><a
							class="nav-link"
							href="<%= request.getContextPath() %>/userlist"
							>Manage Users </a></li>
						<li class="nav-item"><a class="nav-link"
							href="inprocessorder.jsp"
							>In-Process
								Orders</a></li>
					</ul>
					<ul class="navbar-nav ml-auto" style="margin-left: 57%;">
						<li class="nav-item"><a class="nav-link profile-icon"
							href="profile.jsp"> <i
								class="fas fa-user"></i> Profile
						</a></li>
						<li class="nav-item"><a class="nav-link navbar-logout"
							href="login.jsp"> <i class="fas fa-sign-out-alt"></i> Logout
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container" style="padding: 20px;">
		<h1 class="mt-5">Welcome to the Online E Gas Application</h1>
		<div id="profile" class="form-container ">
			<h2>Profile</h2>
			<form action="profileUpdate" method="post"
				onsubmit="return confirmUpdate()">
				<div class="mb-3" style="display:none;">
					<label for="userId" class="form-label">User ID:</label> <input
						type="text" class="form-control" id="userId" name="userId"
						value="<%=userId%>" readonly>
				</div>
				<div class="mb-3">
					<label for="username" class="form-label">User Name:</label> <input
						type="text" class="form-control" id="username" name="username"
						value="<%=username%>" readonly>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password:</label> <input
						type="password" class="form-control" id="password" name="password"
						value="<%=password%>">
				</div>
				<div class="mb-3">
					<label for="mobile" class="form-label">Mobile:</label> <input
						type="text" class="form-control" id="mobile" name="mobile"
						value="<%=mobile%>">
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email:</label> <input
						type="email" class="form-control" id="email" name="email"
						value="<%=email%>">
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">Address:</label> <input
						type="text" class="form-control" id="address" name="address"
						value="<%=address%>">
				</div>
				<div class="mb-3">
					<label for="aadhaar" class="form-label">Aadhaar:</label> <input
						type="text" class="form-control" id="aadhaar" name="aadhaar"
						value="<%=aadhaar%>">
				</div>
				<button type="submit" class="btn btn-primary">Update</button>
			</form>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>

	<script>
		
		function deleteUser(userId) {
			alert("Delete user with ID: " + userId);
		}
		function confirmUpdate() {
			var confirmed = confirm("Update the data that you have given?");
			return confirmed;
		}
	</script>



</body>
</html>

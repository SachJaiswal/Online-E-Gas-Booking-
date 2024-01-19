<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
HttpSession currentSession = request.getSession(false);
int userId = -1;

if (currentSession != null) {
	userId = (int) currentSession.getAttribute("userId");
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
	<div class="container" style="padding: 20px;">
		<h1 class="mt-5">Welcome to the Online E Gas Application</h1>

		<div id="ordergas" class="form-container ">
			<h2>
				<i class="fas fa-book"></i> Book Gas Cylinder
			</h2>
			<form action="bookGas" method="post" onsubmit="return confirmOrder();">
				<!-- Add form fields as needed -->
				<div class="mb-3" style="display:none;">
					<label for="userId" class="form-label">User ID:</label> <input
						type="text" class="form-control" id="userId" name="userId"
						value="<%=userId%>" readonly>
				</div>
				<div class="mb-3">
					<label for="gasProvider" class="form-label">Select Gas
						Provider:</label> <select class="form-select" id="gasProvider"
						name="gasProvider" required>
						<option value="" selected disabled>Select Gas Provider</option>
						<option value="HP Gas">HP Gas</option>
						<option value="Bharat Gas">Bharat Gas</option>
						<option value="Indane Gas">Indane Gas</option>
						<option value="Reliance Gas">Reliance Gas</option>
						<!-- Add more options for other gas providers -->
					</select>
				</div>
				<div class="mb-3">
					<label for="gasType" class="form-label">Gas Type:</label> <select
						type="text" class="form-control" id="gasType" name="gasType"
						required>
						<option value="" selected disabled>Select Gas Type</option>
						<option value="LPG">LPG Gas Cylinder</option>
						<option value="Diesel">Diesel</option>
						<option value="Petrol">Petrol</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="quantity" class="form-label">Quantity:</label> <input
						type="number" class="form-control" id="quantity" name="quantity"
						required min="1" max="120" readonly>
				</div>
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-check"></i> Book Now
				</button>

				<script>
				function confirmOrder() {
		            var gasType = document.getElementById('gasType').value;
		            var quantity = document.getElementById('quantity').value;

		            // Customize the confirmation message based on the selected gas type and quantity
		            var confirmationMessage = "Are you sure you want to book " + quantity + " ";

		            if (gasType === 'LPG') {
		                confirmationMessage += "LPG Gas Cylinder?";
		            } else {
		                confirmationMessage += gasType + "(s)?";
		            }

		            // Show the confirmation dialog and return the result
		            return confirm(confirmationMessage);
		        }
					var quantityField = document.getElementById('quantity');

					// Add event listener to gasType select
					document.getElementById('gasType').addEventListener(
							'change',
							function() {
								var gasType = this.value;

								// Set default values
								quantityField.removeAttribute('readonly');
								quantityField.value = '';

								// Check the selected gas type and adjust the quantity field accordingly
								if (gasType === 'LPG Gas Cylinder') {
									quantityField.value = '1';
									quantityField.setAttribute('readonly',
											'readonly');
								}
							});

					// Add event listener to quantity input
					quantityField.addEventListener('blur', function() {
						var maxQuantity = 120;
						var enteredQuantity = parseInt(this.value);

						// Check if the entered quantity is above the maximum allowed
						if (enteredQuantity > maxQuantity) {
							alert("You cannot order more than 120 liters.");
							this.value = maxQuantity;
						}
					});
				</script>
			</form>

		</div>



	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script>
		function confirmUpdate() {
			var confirmed = confirm("Update the data that you have given?");
			return confirmed;
		}
	</script>
</body>
</html>

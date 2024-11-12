<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: black; /* Sets the background color to black */
	color: white; /* Sets text color to white for contrast */
}

.form-container {
	max-width: 500px;
	margin: 50px auto; /* Center the form */
	background-color: #333; /* Dark gray background for the form */
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

.error-message {
	color: #f00; /* Red color for error messages */
}
</style>
</head>
<body>
	<%
	String DataNotFound = (String) request.getAttribute("DataNotFound");
	%>
	<div class="container">
		<div class="form-container">
			<h1 class="text-center mb-4">Login Form</h1>
			<form action="loginServlet" method="post">
				<div class="mb-3">
					<div class="error-message"><%=DataNotFound == null ? "" : DataNotFound%></div>
					<label for="email" class="form-label">Email:</label> <input
						type="email" class="form-control" id="email" name="email"
						value="<%=request.getAttribute("email") == null ? "" : request.getAttribute("email")%>"
						required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password:</label> <input
						type="password" class="form-control" id="password" name="password"
						value="<%=request.getAttribute("password") == null ? "" : request.getAttribute("password")%>"
						required>
				</div>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
		</div>
	</div>
</body>
</html>

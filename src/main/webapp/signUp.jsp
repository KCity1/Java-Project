<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Signup</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #121212; /* Darker background for reduced eye strain */
	color: white; /* White text for better contrast */
	font-family: Arial, sans-serif; /* Cleaner font */
}

.card {
	background-color: #1e1e1e; /* Softer dark gray for the card */
	color: white;
	border-radius: 10px; /* Smooth edges */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for focus */
}

label {
	font-weight: bold; /* Emphasize labels */
}

.error-message {
	color: #ff4d4d; /* Eye-catching red for error messages */
	font-size: 0.9rem;
	margin-top: 5px;
}

.links {
	margin-top: 20px;
	text-align: center;
}

.links a {
	color: #0d6efd; /* Bootstrap blue */
	text-decoration: none;
}

.links a:hover {
	text-decoration: underline; /* Underline on hover */
}

button {
	margin-top: 15px;
}

textarea {
	resize: none; /* Prevent manual resizing for consistent layout */
}

@media (max-width: 768px) {
	.card {
		padding: 15px; /* Better spacing for smaller screens */
	}
}
</style>
</head>
<body>
	<%
	String phoneError = (String) request.getAttribute("phoneError");
	String AadharError = (String) request.getAttribute("AadharError");
	String emailError = (String) request.getAttribute("emailError");
	String passwordError = (String) request.getAttribute("passwordError");
	String gender = (String) request.getAttribute("gender");
	%>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8 col-sm-10">
				<div class="card p-4">
					<div class="card-header text-center mb-3">
						<h2>Signup Form</h2>
					</div>
					<div class="card-body">
						<form action="signupServlet" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">Name:</label>
								<input type="text" class="form-control" id="name" name="name"
									value="<%=request.getAttribute("name") == null ? "" : request.getAttribute("name")%>"
									required aria-label="Name">
							</div>

							<div class="mb-3">
								<label for="phone" class="form-label">Phone Number:</label>
								<input type="text" class="form-control" id="phone" name="phone"
									value="<%=request.getAttribute("phone") == null ? "" : request.getAttribute("phone")%>"
									required aria-label="Phone Number">
								<div class="error-message"><%=phoneError == null ? "" : phoneError%></div>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email:</label>
								<input type="email" class="form-control" id="email" name="email"
									value="<%=request.getAttribute("email") == null ? "" : request.getAttribute("email")%>"
									required aria-label="Email">
								<div class="error-message"><%=emailError == null ? "" : emailError%></div>
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password:</label>
								<input type="password" class="form-control" id="password" name="password"
									value="<%=request.getAttribute("password") == null ? "" : request.getAttribute("password")%>"
									required aria-label="Password">
								<div class="error-message"><%=passwordError == null ? "" : passwordError%></div>
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label">Gender:</label>
								<select class="form-select" id="gender" name="gender" required aria-label="Gender">
									<option value="">Please Select</option>
									<option value="Male"
										<%=(gender != null && gender.equals("Male")) ? "selected" : ""%>>Male</option>
									<option value="Female"
										<%=(gender != null && gender.equals("Female")) ? "selected" : ""%>>Female</option>
									<option value="Other"
										<%=(gender != null && gender.equals("Other")) ? "selected" : ""%>>Other</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="aadhar" class="form-label">Aadhar Number:</label>
								<input type="text" class="form-control" id="aadhar" name="aadhar"
									value="<%=request.getAttribute("aadhar") == null ? "" : request.getAttribute("aadhar")%>"
									required aria-label="Aadhar Number">
								<div class="error-message"><%=AadharError == null ? "" : AadharError%></div>
							</div>

							<div class="mb-3">
								<label for="address" class="form-label">Address:</label>
								<textarea class="form-control" id="address" name="address" rows="3" required aria-label="Address">
									<%=request.getAttribute("address") == null ? "" : request.getAttribute("address")%>
								</textarea>
							</div>

							<div class="mb-3">
								<label for="birthdate" class="form-label">Birthdate:</label>
								<input type="date" class="form-control" id="birthdate" name="birthdate"
									value="<%=request.getAttribute("birthdate") == null ? "" : request.getAttribute("birthdate")%>"
									required aria-label="Birthdate">
							</div>

							<button type="submit" class="btn btn-primary w-100">Sign Up</button>
						</form>
						<div class="links mt-3">
							<a href="Login.jsp">Already have an account? Login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

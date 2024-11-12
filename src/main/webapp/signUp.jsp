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
	background-color: black; /* Sets the background color to black */
	color: white;
	/* Optional: Sets the text color to white for better contrast */
}

.card {
	background-color: #333; /* Sets a dark gray background for the card */
	color: white; /* Sets the text color for the card */
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
			<div class="col-md-8">
				<div class="card">
					<div class="card-header text-center">
						<h1>Signup Form</h1>
					</div>
					<div class="card-body">
						<form action="signupServlet" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">Name:</label> <input
									type="text" class="form-control" id="name" name="name"
									value="<%=request.getAttribute("name") == null ? "" : request.getAttribute("name")%>"
									required>
							</div>

							<div class="mb-3">
								<label for="phone" class="form-label">Phone Number:</label> <input
									type="text" class="form-control" id="phone" name="phone"
									value="<%=request.getAttribute("phone") == null ? "" : request.getAttribute("phone")%>"
									required>
								<div class="text-danger"><%=phoneError == null ? "" : phoneError%></div>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email:</label> <input
									type="email" class="form-control" id="email" name="email"
									value="<%=request.getAttribute("email") == null ? "" : request.getAttribute("email")%>"
									required>
								<div class="text-danger"><%=emailError == null ? "" : emailError%></div>
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password:</label> <input
									type="password" class="form-control" id="password"
									name="password"
									value="<%=request.getAttribute("password") == null ? "" : request.getAttribute("password")%>"
									required>
								<div class="text-danger"><%=passwordError == null ? "" : passwordError%></div>
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label">Gender:</label> <select
									class="form-select" id="gender" name="gender" required>
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
								<label for="aadhar" class="form-label">Aadhar Number:</label> <input
									type="text" class="form-control" id="aadhar" name="aadhar"
									value="<%=request.getAttribute("aadhar") == null ? "" : request.getAttribute("aadhar")%>"
									required>
								<div class="text-danger"><%=AadharError == null ? "" : AadharError%></div>
							</div>

							<div class="mb-3">
								<label for="address" class="form-label">Address:</label>
								<textarea class="form-control" id="address" name="address"
									required><%=request.getAttribute("address") == null ? "" : request.getAttribute("address")%></textarea>
							</div>

							<div class="mb-3">
								<label for="birthdate" class="form-label">Birthdate:</label> <input
									type="date" class="form-control" id="birthdate"
									name="birthdate"
									value="<%=request.getAttribute("birthdate") == null ? "" : request.getAttribute("birthdate")%>"
									required>
							</div>

							<button type="submit" class="btn btn-primary w-100">Sign
								Up</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
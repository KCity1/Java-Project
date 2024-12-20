<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Reset</title>
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
	height: auto; /* Auto height to adapt to dynamic content */
}

.error-message {
	color: #f00; /* Red color for error messages */
	font-size: 0.9rem;
	text-align: center;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<%
	String DataNotFound = (String) request.getAttribute("DataNotFound");
	%>
	<div class="container">
		<div class="form-container">
			<form action="EmailServlet" method="post">
				<div class="card text-center mb-3" style="width: 100%;">
					<div class="card-header h5 text-white bg-primary py-2">
						Password Reset</div>
				</div>
				<div class="card-body px-5">
					<p class="card-text py-3 text-center">Enter your email address
						and we'll send you an email with an OTP.</p>
					<%
					String Email = (String)request.getAttribute("Email");
					if (DataNotFound != null) {
					%>
					<div class="error-message">
						<%=DataNotFound%>
					</div>
					<%
					}
					%>

					<div data-mdb-input-init class="form-outline">
						<input type="email" id="typeEmail" class="form-control my-3"
							name="Email" placeholder="Enter Email" value="<%=Email!=null?Email:""%>" required/>
					</div>
					<button type="submit" data-mdb-ripple-init
						class="btn btn-primary w-100 my-3">Reset Password</button>
					<div class="d-flex justify-content-between mt-4">
						<a href="Login.jsp" class="text-white">Login</a> <a
							href="signUp.jsp" class="text-white">Sign Up</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

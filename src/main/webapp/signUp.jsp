<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Signup</title>
<link rel="stylesheet" type="text/css" href="SignUp.css">
</head>
<body>
	<div class="container">
		<div class="imgDiv"></div>
		<div class="mainDiv">
			<h1>Signup Form</h1>
			<form action="signupServlet" method="post">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" required><br>
				<br> <label for="email">Email:</label> <input type="email"
					id="email" name="email" required><br>
				<br> <label for="phone">Phone Number:</label> <input
					type="text" id="phone" name="phone" required><br>
				<br> <label for="gender">Gender:</label> <select id="gender"
					name="gender" required>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select><br>
				<br> <label for="aadhar">Aadhar Number:</label> <input
					type="text" id="aadhar" name="aadhar" required><br>
				<br> <label for="address">Address:</label>
				<textarea id="address" name="address" required></textarea>
				<br>
				<br> <label for="birthdate">Birthdate:</label> <input
					type="date" id="birthdate" name="birthdate" required><br>
				<br> <input type="submit" value="Sign Up">
			</form>
		</div>
	</div>
</body>
</html>

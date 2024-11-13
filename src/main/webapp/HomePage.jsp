<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Student Portal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #f8f9fa;
}

.hero-section {
	background-image: url('your-background-image.jpg');
	/* Add a relevant background image */
	background-size: cover;
	background-position: center;
	color: white;
	padding: 100px 0;
	text-align: center;
}

.content-section {
	padding: 50px 0;
}
</style>
</head>
<body>
	<%
	String name = null;
	Cookie cookie[] = request.getCookies();
	String email = null;
	String password = null;
	if (cookie != null) {
		for (Cookie c : cookie) {
			if (c.getName().equals("Email")) {
				email = c.getValue();
			}
			if (c.getName().equals("Password")) {
				password = c.getValue();
			}
			
			if(c.getName().equals("Name")) {
				name = c.getValue();
			}
		}
	} else {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	if (email == null) {
		request.setAttribute("DataNotFound", "Not logged into the website");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	%>
	<div class="hero-section text-black">
		<div class="container">
			<h1 class="display-4">
				Welcome to the Student Portal
				<%=name == null ? "Guest" : name%></h1>
			<p class="lead">Your one-stop platform for managing student
				activities and resources.</p>
			<a href="profile.jsp" class="btn btn-primary btn-lg">Go to Your
				Profile</a>
		</div>
	</div>

	<div class="content-section container">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">View Courses</h5>
						<p class="card-text">Explore and enroll in various courses to
							boost your skills and knowledge.</p>
						<a href="courses.jsp" class="btn btn-outline-primary">View
							Courses</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Assignments</h5>
						<p class="card-text">Check your assignments and submit your
							work on time.</p>
						<a href="assignments.jsp" class="btn btn-outline-primary">Go
							to Assignments</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Announcements</h5>
						<p class="card-text">Stay updated with the latest news and
							announcements from your school.</p>
						<a href="announcements.jsp" class="btn btn-outline-primary">View
							Announcements</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="text-center py-4 bg-light">
		<p>&copy; 2024 Student Portal. All rights reserved.</p>
	</footer>
</body>
</html>

<%@page import="java.net.URLDecoder"%>
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
/* General Styles */
body {
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
	color: #343a40;
	margin: 0;
	padding: 0;
}

/* Hero Section */
.hero-section {
	background-image: url('your-background-image.jpg'); /* Replace with a relevant image URL */
	background-size: cover;
	background-position: center;
	color: white;
	padding: 120px 20px;
	text-align: center;
	box-shadow: inset 0 0 200px rgba(0, 0, 0, 0.5);
}

.hero-section h1 {
	font-size: 3rem;
	font-weight: 700;
	margin-bottom: 15px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
}

.hero-section p {
	font-size: 1.2rem;
	margin-bottom: 20px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
}

.hero-section .btn {
	font-size: 1.2rem;
	padding: 10px 20px;
	border-radius: 30px;
}

/* Cards Section */
.card {
	border: none;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.card-title {
	font-weight: 600;
	color: #495057;
}

.card-text {
	color: #6c757d;
	font-size: 0.95rem;
}

.card .btn {
	border-radius: 30px;
}

/* Footer */
footer {
	background-color: #343a40;
	color: #ffffff;
	padding: 20px 0;
	font-size: 0.9rem;
}

footer p {
	margin: 0;
}

footer a {
	color: #0d6efd;
	text-decoration: none;
}

footer a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<%--
		do we have the need to check password is there or not?
	--%>
	<%
	Cookie cookie[] = request.getCookies();
	String name = request.getAttribute("Name")==null?"Guest":(String)request.getAttribute("Name");
	String email = request.getAttribute("email")==null?null:(String)request.getAttribute("email");
	
	String password = request.getAttribute("password")==null?null:(String)request.getAttribute("password");;
	String sessionPass = (String)session.getAttribute("password");

	
	if (cookie != null) {
		for (Cookie c : cookie) {
			if (c.getName().equals("Email")) {
				email = c.getValue();
			}
			if (c.getName().equals("Password")) {
				password = c.getValue();
			}
			if (c.getName().equals("Name")) {
				name = URLDecoder.decode(c.getValue(), "UTF-8");
			}
		}
	} else {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	if (email == null || password == null || name == "Guest") {
		request.setAttribute("DataNotFound", "Not logged into the website");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	%>
	<div class="hero-section">
		<div class="container">
			<h1 class="display-4">
				Welcome to the Student Portal,
				<%=name == null ? "Guest" : name%>!
			</h1>
			<p class="lead">Your one-stop platform for managing student activities and resources.</p>
			<a href="profile.jsp" class="btn btn-primary btn-lg">Go to Your Profile</a>
		</div>
	</div>

	<div class="content-section container py-5">
		<div class="row g-4">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">View Courses</h5>
						<p class="card-text">Explore and enroll in various courses to boost your skills and knowledge.</p>
						<a href="courses.jsp" class="btn btn-outline-primary">View Courses</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Assignments</h5>
						<p class="card-text">Check your assignments and submit your work on time.</p>
						<a href="assignments.jsp" class="btn btn-outline-primary">Go to Assignments</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Announcements</h5>
						<p class="card-text">Stay updated with the latest news and announcements from your school.</p>
						<a href="announcements.jsp" class="btn btn-outline-primary">View Announcements</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="text-center py-4">
		<p>&copy; 2024 Student Portal. All rights reserved. <a href="about.jsp">About Us</a></p>
	</footer>
</body>
</html>

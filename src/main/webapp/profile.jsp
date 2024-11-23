<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            color: #343a40;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .logout-btn {
            float: right;
            margin-top: 20px;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
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
    <% 
        String id = "2102030400273";
        String course = "Bachelor of Technology - Computer Engineering";
        String phone = "9876543210";
        String semester = "7";
    %>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Student Details</h1>
            <a href="logoutServlet" class="btn btn-danger logout-btn">Logout</a>
        </div>
        <div class="card mt-4 p-4">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="profile-pic.jpg" alt="Profile Picture" class="profile-pic">
                </div>
                <div class="col-md-8">
                    <h2 class="mb-3"><%= name %></h2>
                    <p><strong>Student ID:</strong> <%= id %></p>
                    <p><strong>Course:</strong> <%= course %></p>
                    <p><strong>Email:</strong> <%= email %></p>
                    <p><strong>Phone:</strong> <%= phone %></p>
                    <p><strong>Semester:</strong> <%= semester %></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Signup</title>
    <link rel="stylesheet" type="text/css" href="Styles.css">
</head>
<body>
	<%
		String phoneError = (String) request.getAttribute("phoneError");
		String AadharError = (String) request.getAttribute("AadharError");
		String emailError = (String) request.getAttribute("emailError");
		
		String gender = (String) request.getAttribute("gender");
	%>
    <div class="form-container">
        <div class="image-placeholder">
        </div>
        <div class="form-placeholder">
            <h1>Signup Form</h1>
            <form action="signupServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= request.getAttribute("name")==null?"":request.getAttribute("name") %>" required>
                
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" value="<%= request.getAttribute("phone")==null?"":request.getAttribute("phone") %>" required>
                <div class="error-message"><%=phoneError==null?"":phoneError %></div>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= request.getAttribute("email")==null?"":request.getAttribute("email")  %>" required>
                <div class="error-message"><%=emailError==null?"":emailError %></div>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender"  required>
                	<option value="">Please Select</option>
            		<option value="Male" <%= (gender!=null&& gender.equals("Male"))?"selected":"" %> >Male</option>
            		<option value="Female" <%= (gender!=null&& gender.equals("Female"))?"selected":"" %>>Female</option>
            		<option value="Other" <%= (gender!=null&& gender.equals("Other"))?"selected":"" %>>Other</option>
        		</select>

                <label for="aadhar">Aadhar Number:</label>
                <input type="text" id="aadhar" name="aadhar" value="<%= request.getAttribute("aadhar")==null?"":request.getAttribute("aadhar")  %>" required>
                <div class="error-message"><%=AadharError==null?"":AadharError %></div>

                <label for="address">Address:</label>
                <textarea id="address" name="address" required><%= request.getAttribute("address")==null?"":request.getAttribute("address")  %></textarea>

                <label for="birthdate">Birthdate:</label>
                <input type="date" id="birthdate" name="birthdate" value="<%= request.getAttribute("birthdate")==null?"":request.getAttribute("birthdate")  %>" required>

                <input type="submit" value="Sign Up">
            </form>
        </div>
    </div>
</body>
</html>
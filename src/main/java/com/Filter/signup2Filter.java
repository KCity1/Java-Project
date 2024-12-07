package com.Filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/signupServlet")
public class signup2Filter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws javax.servlet.ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String aadhar = request.getParameter("aadhar").trim();
		String address = request.getParameter("address");
		String birthdate = request.getParameter("birthdate");
		boolean isDuplicate = false;

		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";

		try {
			Class.forName(SQLDriver);
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
			PreparedStatement pstmt = connection
					.prepareStatement("SELECT Email, AadharNum FROM student WHERE AadharNum = ? OR Email = ?");
			pstmt.setString(1, aadhar);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("AadharNum").equals(aadhar)) {
					request.setAttribute("AadharError",
							"This Aadhar number is already registered. Please use a different Aadhar number.");
					isDuplicate = true;
				}
				if (rs.getString("Email").equals(email)) {
					request.setAttribute("emailError",
							"Email address already registered. Please use a different one or sign in.");
					isDuplicate = true;
				}
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("Database error during Aadhar number validation.");
		}

		if (isDuplicate) {
			System.out.println("Duplicate data");
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("phone", phone);
			request.setAttribute("gender", gender);
			request.setAttribute("aadhar", aadhar);
			request.setAttribute("address", address);
			request.setAttribute("birthdate", birthdate);
			request.getRequestDispatcher("signUp.jsp").forward(request, response);
		} else {
			System.out.println("No Duplicate data");
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {

	}

}

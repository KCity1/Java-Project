package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String aadhar = request.getParameter("aadhar");
		String address = request.getParameter("address");
		String birthdate = request.getParameter("birthdate");
		
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

			PreparedStatement statement = connection.prepareStatement(
					"INSERT INTO student (Name, Email, PhoneNo, Gender, AadharNum, Address, Birthdate) VALUES (?, ?, ?, ?, ?, ?, ?)");
			System.out.println(name);
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, phone);
			statement.setString(4, gender);
			statement.setString(5, aadhar);
			statement.setString(6, address);
			statement.setString(7, birthdate);
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				response.setContentType("text/html");
                response.getWriter().println("Signup successful!");
            } else {
                response.getWriter().println("Signup failed, please try again.");
            }
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

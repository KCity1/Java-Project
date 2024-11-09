package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String aadhar = request.getParameter("aadhar");
		String address = request.getParameter("address").replace("\n"," ").replace("\r", "");
		String birthdate = request.getParameter("birthdate");

		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";
		try {
			Class.forName(SQLDriver);
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

			PreparedStatement statement = connection.prepareStatement(
					"INSERT INTO student (Name, Email, PhoneNo, Gender, AadharNum, Address, Birthdate) VALUES (?, ?, ?, ?, ?, ?, ?)");

//				if same email is found then error persist "SQLIntegrityConstraintViolationException"<----how to handle?
				statement.setString(1, name);
				statement.setString(2, email);
				statement.setString(3, phone);
				statement.setString(4, gender);
				statement.setString(5, aadhar);
				statement.setString(6, address);
				statement.setString(7, birthdate);
				statement.executeUpdate();
				response.setContentType("text/html");
				response.getWriter().println("<h1>Signup successful!<br>Hello " + name + "</h1>");
				connection.close();
				System.out.println(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.Service.SendEmailService;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Email = request.getParameter("Email");
		String subject = "Generated OTP";
		int OTP = (int) (Math.random() * 900000) + 100000;
		
		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";
		try {
			Class.forName(SQLDriver);
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

			PreparedStatement statement = connection.prepareStatement(
					"update student set OTP = ? where Email = ?");
				statement.setLong(1, OTP);
				statement.setString(2, Email);
				statement.executeUpdate();
				connection.close();
//				System.out.println(name);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//Email Draft!!
		String body = generateEmail(OTP);
		boolean isSent = SendEmailService.sendEmail(Email, subject, body);

		request.setAttribute("Email", Email);
		response.setContentType("text/html");
		response.getWriter().println(isSent ? "Email sent successfully!" : "Failed to send email.");
		request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
	}

	// Method to generate the email content
	public String generateEmail(int OTP) {
		return "Dear User,\n\n" + "We received a request to reset the password for your Student Portal account.\n"
				+ "To proceed with the password reset, please use the One-Time Password (OTP) provided below:\n\n"
				+ "Your OTP: " + OTP + "\n\n"
				+ "This OTP is valid for the next 10 minutes. Please do not share this code with anyone for security reasons.\n\n"
				+ "If you did not request to reset your password, please ignore this email. Your account remains secure, and no changes have been made.\n\n"
				+ "Thank you,\n" + "Student Portal Team";
	}

}

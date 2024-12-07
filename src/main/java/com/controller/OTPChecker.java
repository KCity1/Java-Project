package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OTPChecker")
public class OTPChecker extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Email = request.getParameter("Email");
		Integer OTP = Integer.parseInt(request.getParameter("OTPVerify"));
		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";
		
		try {
			Class.forName(SQLDriver);
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
			
			PreparedStatement pstm = connection.prepareStatement("Select * from student where Email = ? AND OTP = ?");
			pstm.setString(1, Email);
			pstm.setInt(2, OTP);
			ResultSet Rs =  pstm.executeQuery();
			if (Rs.next()) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/HTML");
				out.print("<h1>OTP Is Correct!!</h1>");
				System.out.println("OTP Is Correct!");
//				request.getRequestDispatcher("").forward(request, response);;<-------------if the OTP is Correct!
			} else {
				System.out.println("OTP Or Email not Correct");
				request.setAttribute("DataNotFound", "OTP or Email Not Correct!!");
				request.setAttribute("Email", Email);
				request.setAttribute("OTPVerify", OTP);
				request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Something Went Wrong with MySQL API!");
		}
	}
}

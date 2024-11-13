package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = "";
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";

		try {
			Class.forName(SQLDriver);
			Connection con = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
			PreparedStatement pstmt = con
					.prepareStatement("select Name , Email , Password from student where Email = ? AND Password = ?;");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet resultset = pstmt.executeQuery();
			System.out.println(email);
			
			if (resultset.next()) {
				name = resultset.getString("Name");
				
				Cookie emailCookie = new Cookie("Email",email);
				Cookie passwordCookie = new Cookie("Password",password);
				Cookie nameCookie = new Cookie("Name",name);
				response.addCookie(emailCookie);
				response.addCookie(passwordCookie);
				response.addCookie(nameCookie);
				
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			} else {
				request.setAttribute("email", email);
				request.setAttribute("password", password);
				request.setAttribute("DataNotFound", "Email or Password is incorrect!");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			;
		}
	}

}

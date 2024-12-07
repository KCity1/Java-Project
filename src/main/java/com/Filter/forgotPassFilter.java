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

@WebFilter("/EmailServlet")
public class forgotPassFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String Email = request.getParameter("Email");
		String SQLDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/student_portal";
		String jdbcUsername = "root";
		String jdbcPassword = "VidhitAgrawal";
		try {
			Class.forName(SQLDriver);
			Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
			PreparedStatement pstmt = connection.prepareStatement("SELECT Email FROM student WHERE Email = ?");
			pstmt.setString(1, Email);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("Email Found");
				chain.doFilter(request, response);
			} else {
				System.out.println("Email Not Found");
				request.setAttribute("DataNotFound", "Email not Registerd!!");
				request.setAttribute("Email", Email);
				request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("Database error during Email ID Verification.");
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}

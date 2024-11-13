package com.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/signupServlet")
public class signup1Filter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws javax.servlet.ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, javax.servlet.FilterChain chain)
			throws IOException, javax.servlet.ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String aadhar = request.getParameter("aadhar");
		String address = request.getParameter("address");
		String birthdate = request.getParameter("birthdate");

		String Emailregex = "[A-Za-z0-9\\._%+\\-]+@[A-Za-z0-9\\.\\-]+\\.[A-Za-z]{2,}";

		boolean flag = true;
		if (!email.matches(Emailregex)) {
			flag = false;
			request.setAttribute("emailError", "Please Enter Correct Email Address!!");
		}
		if (phone.trim().length() != 10) {
			flag = false;
			request.setAttribute("phoneError", "Please Enter Correct Phone Number!!");
		}
		if (password.trim().length() < 7) {
			flag = false;
			request.setAttribute("passwordError", "Password must be at least 6 characters long.");
		}
		if (aadhar.trim().length() != 12) {
			flag = false;
			request.setAttribute("AadharError", "Please Enter Correct Aadhar Number");
		}
		if (!flag) {
			System.out.println("Error in Data Entered");
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
			System.out.println("Error Free Data Entered");
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {

	}

}

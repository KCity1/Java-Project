package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie cookie[] = request.getCookies();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie c : cookies) {
		        System.out.println("Cookie Name: " + c.getName() + ", Value: " + c.getValue() + ", Path: " + c.getPath());
		    }
		}
		for (Cookie c : cookie) {
			if (c.getName().equals("Name") || c.getName().equals("Email") || c.getName().equals("Password")) {
				c.setMaxAge(0);
				c.setPath("/");
				c.setHttpOnly(false); // Ensure it is not HTTP-Only (if necessary)
                response.addCookie(c); // Add expired cookie to response
                System.out.println("Deleting cookie: " + c.getName());
			}
		}
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		response.sendRedirect("Login.jsp");
	}
}

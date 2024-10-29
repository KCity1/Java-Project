package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection()
	{
		Connection connection = null;
		try {
			String DriverName = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/Student_portal";
			String username= "root";
			String Password= "VidhitAgrawal";
			Class.forName(DriverName);
			connection = DriverManager.getConnection(url, username, Password);
			System.out.println("Connection=> "+connection);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	public static void main(String[] args) {
		
	}
}

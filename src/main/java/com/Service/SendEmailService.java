package com.Service;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmailService {
//	public static void main(String[] args) {
//		sendEmail("vidhit.agrawal2004@gmail.com", "Welcome to the Lovely Show", "Dear Vidhit Agrawal,\r\n" + "\r\n"
//				+ "We are thrilled to welcome you to the Student Portal, your go-to platform for managing your academic journey seamlessly. "
//				+ "Whether it's accessing resources, tracking assignments, or staying updated with the latest announcements, we've got you "
//				+ "covered!");
//	}

	public static boolean sendEmail(String recipient, String subject, String body) {
		// Sender email credentials
		final String sender = "vidhit.agrawal2004@gmail.com"; // Replace with your email
		final String password = "iadduyygaqhjmdgj"; // Replace with your email password or app-specific password

		// SMTP server configuration
		String host = "smtp.gmail.com";

		// Configure SMTP properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// Create a session with authentication
		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		try {
			// Create MimeMessage object
			MimeMessage message = new MimeMessage(session);

			// Set email fields
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject(subject);
			message.setText(body);

			// Send the email
			Transport.send(message);
			System.out.println("Mail successfully sent!");
			return true;
		} catch (MessagingException mex) {
			mex.printStackTrace();
			return false;
		}
	}
}

package com.Listener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionCounterListener implements HttpSessionListener{

	int counter = 0;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		counter++;
		System.out.println("Total (++): "+counter);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		counter--;
		System.out.println("Total (--): "+counter);
	}

}

package com.hobbycam.email;

public interface HobbyEmail {
	
	public void emailSend(String email, String subject, String content) throws Exception;
}

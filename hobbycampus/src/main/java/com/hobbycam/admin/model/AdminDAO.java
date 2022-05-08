package com.hobbycam.admin.model;

public interface AdminDAO {
	
	public int signUpAdmin(AdminDTO dto);
	public boolean adminCheck(String a_email, String a_pwd);

}

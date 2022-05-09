package com.hobbycam.admin.model;

import java.util.*;

public interface AdminDAO {
	
	public int signUpAdmin(AdminDTO dto);
	public boolean adminCheck(String a_email, String a_pwd);
	public AdminDTO adminLogin(String a_email, String a_pwd);

}

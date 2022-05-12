package com.hobbycam.admin.model;

import java.util.*;

public interface AdminDAO {
	
	public int signUpAdmin(AdminDTO dto);
	public AdminDTO adminLogin(String a_email, String a_pwd);
	public int adminEmailCheck(String a_email);
	public int adminNameCheck(String a_name);

}

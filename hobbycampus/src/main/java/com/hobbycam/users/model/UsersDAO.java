package com.hobbycam.users.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface UsersDAO {

	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	
	public int usersEmailJoin(UsersDTO dto);
	
	public int usersNameCheck(String name);
	
	public int usersEmailCheck(String email);
	
	public int usersLogin(String email, String pwd);
	
	public List usersInfo(String email);
	
	public String usersname(String email);

	public UsersDTO userUpForm(int idx);
	
	public int userUp(UsersDTO dto);

	public int userDel(int idx);
	
	
	/*
	public String getKey(boolean lowerCheck, int size);

	public String init();
	
	public String mailSend(String e_mail, HttpServletRequest request);
	*/
}

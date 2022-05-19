package com.hobbycam.users.model;

public interface UsersDAO {

	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	public static final int DEL=-2;
	
	
	public int getEmailCount(String email);
	
	public int getNameCount(String name);

	public int getTel(String tel);
	
	public int setUser(UsersDTO dto);
	
	public int getLoginPwd(String email, String pwd);
	
	public UsersDTO getUserName(String email);
	
	public Integer getUserTidx(int idx);
	
	public UsersDTO getUserEmail(String u_tel, String u_gender);

	public int getPwdCount(String email);
	
	public int updateUserPwd(UsersDTO dto);
	
	public UsersDTO getUserInfo(int idx);
	
	public int updateUserInfo(UsersDTO dto);

	public int deleteUserInfo(int idx);
	
}

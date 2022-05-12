package com.hobbycam.users.model;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class UsersDAOImple implements UsersDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;

	public UsersDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

	/**email Join*/
	//email Check
	@Override
	public int usersEmailCheck(String email) {
		int result=sqlMap.selectOne("usersEmailCheck",email);
		
		return result;
	}

	//name Check
	@Override
	public int usersNameCheck(String name) {
		int result=sqlMap.selectOne("usersNameCheck",name);
		
		return result;
	}
	
	
	/**email Join*/
	@Override
	public int usersEmailJoin(UsersDTO dto) {
		int emailCheck=usersEmailCheck(dto.getU_email());
		int nameCheck=usersNameCheck(dto.getU_name());

		if(emailCheck==0&&nameCheck==0) {
			int count=sqlMap.insert("usersEmailJoin",dto);
			return count;
		} else {
			return -1;
		}
	}


	
	/**Login*/
	@Override
	public int usersLogin(String email, String pwd) {

		String u_pwd=sqlMap.selectOne("usersLogin",email);
		
		if(u_pwd==null||u_pwd.equals("")){
			return NOT_ID;
		} else if(!u_pwd.equals(pwd)) {
			return NOT_PWD;
		} else if(u_pwd.equals(pwd)) {
			return LOGIN_OK;
		} else {
			return ERROR;
		}
	}
	
	
	public String usersname(String email) {
		String u_name=sqlMap.selectOne("usersname",email);
		return u_name;
	}
	
	//getusername
	@Override
	public List usersInfo(String email) {
		List u_info=sqlMap.selectList("usersInfo",email);
		
		return u_info;
	}
	
	@Override
	public UsersDTO userUpForm(int idx) {
		UsersDTO dto=sqlMap.selectOne("userUpForm",idx);
		return dto;
	}
	
	@Override
	public int userUp(UsersDTO dto) {
		int count=sqlMap.update("userUp",dto);
		return count;
	}
	
	@Override
	public int userDel(int idx) {
		int count=sqlMap.update("",idx);
		return count;
	}
	}

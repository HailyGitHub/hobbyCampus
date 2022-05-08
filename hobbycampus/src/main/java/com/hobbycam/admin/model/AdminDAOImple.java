package com.hobbycam.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	
	@Override
	public int signUpAdmin(AdminDTO dto) {
		int count = sqlMap.insert("insertAdmin", dto);
		return count;
	}
	
	
	@Override
	public boolean adminCheck(String a_email, String a_pwd) {
		
		Map map = new HashMap();
		map.put("a_email", a_email);
		map.put("a_pwd",a_pwd);
		
		String id = sqlMap.selectOne("selectAdmin", map); // null is false
		boolean result = id==null? false : true;
		
		return result;
	}

}

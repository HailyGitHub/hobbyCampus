package com.hobbycam.admin.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
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
	public AdminDTO adminLogin(String a_email, String a_pwd) {
		Map map = new HashMap();
		map.put("a_email", a_email);
		map.put("a_pwd",a_pwd);
		AdminDTO dto = sqlMap.selectOne("selectAdminLogin", map); // False -> null
		return dto;
	}
	
	@Override
	public int adminEmailCheck(String a_email) {
		int count = sqlMap.selectOne("selectAdminEmail", a_email);
		return count;
	}
	
	@Override
	public int adminNameCheck(String a_name) {
		int count = sqlMap.selectOne("selectAdminName", a_name);
		return count;
	}

}

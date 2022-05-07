package com.hobbycam.admin.model;

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

}

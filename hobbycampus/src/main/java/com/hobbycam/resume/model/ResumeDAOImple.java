package com.hobbycam.resume.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ResumeDAOImple implements ResumeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ResumeDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public ResumeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public int resumeInsert(ResumeDTO dto) {
		int count = sqlMap.insert("insertResume",dto);
		return count;
	}
}

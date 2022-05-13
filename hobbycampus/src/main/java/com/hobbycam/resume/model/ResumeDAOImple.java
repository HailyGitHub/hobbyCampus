package com.hobbycam.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class ResumeDAOImple implements ResumeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ResumeDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public ResumeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/**select all cate1 List*/
	@Override
	public List cate2List() {
		List cate2List =  sqlMap.selectList("selectCate2");
		return cate2List;
	}

	@Override
	public int resumeInsert(ResumeDTO dto) {
		int count = sqlMap.insert("insertResume",dto);
		return count;
	}
}

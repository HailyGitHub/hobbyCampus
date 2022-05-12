package com.hobbycam.review.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class reviewDAOImple implements reviewDAO {

	@Autowired
	SqlSessionTemplate sqlMap;

	public reviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

}

package com.hobbycam.review.model;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewDAOImple implements ReviewDAO {

	@Autowired
	SqlSessionTemplate sqlMap;

	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List review(HttpServletRequest req) {
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		
		List list=sqlMap.selectList("review",idx);
		
		return list;
	}
}

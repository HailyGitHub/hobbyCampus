package com.hobbycam.review.model;

import java.util.ArrayList;
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
	public ArrayList<ReviewVO> review(HttpServletRequest req) {
		HttpSession session=req.getSession();
		
		int idx=(int)session.getAttribute("u_idx");
		
		ArrayList<ReviewVO> arr=(ArrayList)sqlMap.selectList("myreview",idx);
		
		return arr;
	}
	
	
	@Override
	public ArrayList<ReviewVO> unReview(HttpServletRequest req) {
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		
		ArrayList<ReviewVO> arr=(ArrayList)sqlMap.selectList("myunreview",idx);
	
		return arr;
	}
	
	
	@Override
	public int insertReview(ReviewDTO dto) {
		int count=sqlMap.insert("insertReview",dto);
		return count;
	}
	
	@Override
	public int updateReview(ReviewDTO dto) {
		int count=sqlMap.update("updateReview",dto);
		return count;
	}
	
	@Override
	public int deleteReview(int idx) {
		
		int count=sqlMap.delete("deleteReview",idx);
		return count;
	}
}

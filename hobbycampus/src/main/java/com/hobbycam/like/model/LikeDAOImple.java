package com.hobbycam.like.model;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class LikeDAOImple implements LikeDAO {

	private SqlSessionTemplate sqlMap;

	public LikeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public ArrayList<LikeVO> myLike(int idx) {
		ArrayList arr= (ArrayList)sqlMap.selectList("selectMyLikeList",idx);
		return arr;
	}
	
	
	@Override
	public void getMyLike(LikeDTO dto) {
		int getLike=sqlMap.selectOne("selectMyLike",dto);
		if(getLike==0) {
			sqlMap.insert("insertMyLike",dto);
		
		} else if(getLike!=0) {
			sqlMap.delete("deleteMyLike",dto);
			
		}	
		
	}

}

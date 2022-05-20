package com.hobbycam.like.model;

import java.util.ArrayList;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class LikeDAOImple implements LikeDAO {

	private SqlSessionTemplate sqlMap;

	public LikeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public ArrayList<LikeVO> myLike(int cp, int listSize, int u_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
				
		Map map=new HashedMap();
			map.put("u_idx", u_idx);
			map.put("start", start);
			map.put("end", end);

		ArrayList arr= (ArrayList)sqlMap.selectList("selectPageLike",map);
		return arr;
	}
	
	
	
	
	@Override
	public int myLikeCnt(int idx){
		int count=sqlMap.selectOne("selectMyLikeCnt",idx);
		return count;
	}
	
	
	
	
	@Override
	public void getMyLike(int idx, int lesson_idx) {
		
		LikeDTO dto=new LikeDTO(idx, lesson_idx);
		
		Map map=new HashedMap();
			map.put("u_idx", idx);
			map.put("lesson_idx", lesson_idx);

		int getLike=sqlMap.selectOne("selectMyLike",map);
		if(getLike==0) {
			sqlMap.insert("insertMyLike",map);
		
		} else if(getLike!=0) {
			sqlMap.delete("deleteMyLike",map);
			
		}	
		
	}

}

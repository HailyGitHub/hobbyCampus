package com.hobbycam.category.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class CategoryDAOImple implements CategoryDAO {

	private SqlSessionTemplate sqlMap;
	
	public CategoryDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public int getCateOneMaxIdx() {
		int nextIdx = sqlMap.selectOne("selectCateOneMaxIdx");
		return nextIdx;
	}
	
	@Override
	public int getCateTwoMaxIdx() {
		int maxIdx = sqlMap.selectOne("selectCateTwoMaxIdx");
		return maxIdx;
	}
	
	@Override
	public int addCateOne(String cate1_name, String cate1_img) {
		Map map = new HashMap();
		map.put("cate1_name", cate1_name);
		map.put("cate1_img", cate1_img);
		int count = sqlMap.insert("insertCateOne", map);
		return count;
	}
	
	@Override
	public int addCateTwo(int cate1_idx, String cate2_name, String cate2_img) {
		Map map = new HashMap();
		map.put("cate1_idx", cate1_idx);
		map.put("cate2_name", cate2_name);
		map.put("cate2_img", cate2_img);
		int count = sqlMap.insert("insertCateTwo", map);
		return count;
	}
	
	@Override
	public List getCateOneList() {
		List lists = sqlMap.selectList("selectCateOneList");
		return lists;
	}
	
	@Override
	public List getCateTwoList(int cate1_idx) {
		List lists = sqlMap.selectList("selectCateTwo", cate1_idx);
		return lists;
	}
	
	@Override
	public int editCateOneName(int cate1_idx, String cate1_name) {
		Map map = new HashMap();
		map.put("cate1_idx", cate1_idx);
		map.put("cate1_name", cate1_name);
		int count = sqlMap.update("updateCateOneName", map);
		return count;
	}

}

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
		int maxIdx = sqlMap.selectOne("selectCate1MaxIdx");
		return maxIdx;
	}
	
	@Override
	public int setCateOneInfo(String cate1_name, String cate1_img) {
		Map map = new HashMap();
		map.put("cate1_name", cate1_name);
		map.put("cate1_img", cate1_img);
		int count = sqlMap.insert("insertCate1Info", map);
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

}

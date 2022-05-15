package com.hobbycam.index.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class IndexDAOImple implements IndexDAO {
	
	private SqlSessionTemplate sqlMap;

	public IndexDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public List getCateOneList() {
		List lists = sqlMap.selectList("selectIndexCateOneList");
		return lists;
	}
	
	@Override
	public List getCateTwoList() {
		List lists = sqlMap.selectList("selectIndexCateTwoList");
		return lists;
	}
	
	
	
}

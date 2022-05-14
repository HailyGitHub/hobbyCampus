package com.hobbycam.category.model;

import java.util.*;

public interface CategoryDAO {
	
	public int getCateOneMaxIdx();
	public int getCateTwoMaxIdx();
	public int addCateOne(String cate1_name, String cate1_img);
	public int addCateTwo(int cate1_idx, String cate2_name, String cate2_img);
	public List getCateOneList();
	public List getCateTwoList(int cate1_idx);
	public int editCateOneName(int cate1_idx, String cate1_name);
	
}

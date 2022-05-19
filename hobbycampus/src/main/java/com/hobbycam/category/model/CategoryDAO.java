package com.hobbycam.category.model;

import java.util.*;

public interface CategoryDAO {
	
	public int getCateOneMaxIdx();
	public int getCateTwoMaxIdx();
	public int addCateOne(int nextIdx, String cate1_name, String cate1_img);
	public int addCateTwo(int nextIdx, int cate1_idx, String cate2_name, String cate2_img);
	public List getCateOneList();
	public List getCateTwoList(int cate1_idx);
	public int editCateOne(int cate1_idx, String cate1_name, String cate1_img);
	public int editCateTwo(int cate2_idx, String cate2_name, String cate2_img);
	
}

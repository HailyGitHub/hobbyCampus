package com.hobbycam.category.model;

import java.util.*;

public interface CategoryDAO {
	
	public int getCateOneMaxIdx();
	public int setCateOneInfo(String cate1_name, String cate1_img);
	public List getCateOneList();
	public List getCateTwoList(int cate1_idx);
	
}

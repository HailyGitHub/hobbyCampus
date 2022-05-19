package com.hobbycam.like.model;

import java.util.ArrayList;

public interface LikeDAO {

	public ArrayList<LikeVO> myLike(int idx);
	
	public void getMyLike(LikeDTO dto);
	
}

package com.hobbycam.like.model;

import java.util.ArrayList;

public interface LikeDAO {

	public ArrayList<LikeVO> myLike(int idx, int lesson_idx, int u_idx);
	
	public void getMyLike(int idx, int lesson_idx);
	
	public int myLikeCnt(int idx);
}

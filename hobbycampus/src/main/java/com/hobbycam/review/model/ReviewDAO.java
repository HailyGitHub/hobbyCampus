package com.hobbycam.review.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ReviewDAO {

	public ArrayList<ReviewVO> review(HttpServletRequest req); 
	
	public ArrayList<ReviewVO> unReview(HttpServletRequest req);
	
	public int insertReview(ReviewDTO dto);
	
	public int updateReview(ReviewDTO dto);
	
	public int deleteReview(int idx);
}

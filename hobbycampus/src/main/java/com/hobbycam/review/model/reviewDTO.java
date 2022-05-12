package com.hobbycam.review.model;

import java.sql.Date;

public class reviewDTO {

	private int review_idx;
	private int lesson_record_idx;
	private int star_point;
	private String review_content;
	private Date review_date;
	
	
	
	public reviewDTO() {
		super();
	}



	public reviewDTO(int review_idx, int lesson_record_idx, int star_point, String review_content, Date review_date) {
		super();
		this.review_idx = review_idx;
		this.lesson_record_idx = lesson_record_idx;
		this.star_point = star_point;
		this.review_content = review_content;
		this.review_date = review_date;
	}



	public int getReview_idx() {
		return review_idx;
	}



	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}



	public int getLesson_record_idx() {
		return lesson_record_idx;
	}



	public void setLesson_record_idx(int lesson_record_idx) {
		this.lesson_record_idx = lesson_record_idx;
	}



	public int getStar_point() {
		return star_point;
	}



	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}



	public String getReview_content() {
		return review_content;
	}



	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}



	public Date getReview_date() {
		return review_date;
	}



	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	

	
	
}

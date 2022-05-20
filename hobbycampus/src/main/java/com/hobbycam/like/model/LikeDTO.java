package com.hobbycam.like.model;

import java.sql.Date;

public class LikeDTO {

	private int u_idx;
	private int lesson_idx;
	private Date like_date;
	
	public LikeDTO() {
		super();
	}

	
	
	public LikeDTO(int u_idx, int lesson_idx) {
		super();
		this.u_idx = u_idx;
		this.lesson_idx = lesson_idx;
	}



	public LikeDTO(int u_idx, int lesson_idx, Date like_date) {
		super();
		this.u_idx = u_idx;
		this.lesson_idx = lesson_idx;
		this.like_date = like_date;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public Date getlike_date() {
		return like_date;
	}

	public void setlike_date(Date like_date) {
		this.like_date = like_date;
	}

}

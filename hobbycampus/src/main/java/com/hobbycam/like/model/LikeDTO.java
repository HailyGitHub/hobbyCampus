package com.hobbycam.like.model;

public class LikeDTO {

	private int u_idx;
	private int lesson_idx;
	

	public LikeDTO() {
		super();
	}


	public LikeDTO(int u_idx, int lesson_idx) {
		super();
		this.u_idx = u_idx;
		this.lesson_idx = lesson_idx;
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

}

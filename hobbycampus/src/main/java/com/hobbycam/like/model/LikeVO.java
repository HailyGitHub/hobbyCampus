package com.hobbycam.like.model;

public class LikeVO {
	
	private int u_idx;
	private int lesson_idx;
	private int t_idx;
	private String lesson_subj;
	private String lesson_thumbnail;
	private String t_name;

	public LikeVO() {
		super();
	}

	public LikeVO(int u_idx, int lesson_idx, int t_idx, String lesson_subj, String lesson_thumbnail, String t_name) {
		super();
		this.u_idx = u_idx;
		this.lesson_idx = lesson_idx;
		this.t_idx = t_idx;
		this.lesson_subj = lesson_subj;
		this.lesson_thumbnail = lesson_thumbnail;
		this.t_name = t_name;
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

	public int getT_idx() {
		return t_idx;
	}

	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}

	public String getLesson_subj() {
		return lesson_subj;
	}

	public void setLesson_subj(String lesson_subj) {
		this.lesson_subj = lesson_subj;
	}

	public String getLesson_thumbnail() {
		return lesson_thumbnail;
	}

	public void setLesson_thumbnail(String lesson_thumbnail) {
		this.lesson_thumbnail = lesson_thumbnail;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
}

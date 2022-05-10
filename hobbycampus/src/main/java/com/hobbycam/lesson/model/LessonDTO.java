package com.hobbycam.lesson.model;

import java.sql.Date;

public class LessonDTO {

	private int lesson_idx;
	private int cate2_idx;
	private int t_idx;
	private String lesson_subj;
	private Date lesson_up_date;
	private String lesson_type;
	private int lesson_price;
	private String lesson_thumbnail;
	private String lesson_short_cont;
	private String lesson_state;
	private String lesson_kit;
	
	public LessonDTO() {
		super();
	}

	public LessonDTO(int lesson_idx, int cate2_idx, int t_idx, String lesson_subj, Date lesson_up_date,
			String lesson_type, int lesson_price, String lesson_thumbnail, String lesson_short_cont,
			String lesson_state, String lesson_kit) {
		super();
		this.lesson_idx = lesson_idx;
		this.cate2_idx = cate2_idx;
		this.t_idx = t_idx;
		this.lesson_subj = lesson_subj;
		this.lesson_up_date = lesson_up_date;
		this.lesson_type = lesson_type;
		this.lesson_price = lesson_price;
		this.lesson_thumbnail = lesson_thumbnail;
		this.lesson_short_cont = lesson_short_cont;
		this.lesson_state = lesson_state;
		this.lesson_kit = lesson_kit;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public int getCate2_idx() {
		return cate2_idx;
	}

	public void setCate2_idx(int cate2_idx) {
		this.cate2_idx = cate2_idx;
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

	public Date getLesson_up_date() {
		return lesson_up_date;
	}

	public void setLesson_up_date(Date lesson_up_date) {
		this.lesson_up_date = lesson_up_date;
	}

	public String getLesson_type() {
		return lesson_type;
	}

	public void setLesson_type(String lesson_type) {
		this.lesson_type = lesson_type;
	}

	public int getLesson_price() {
		return lesson_price;
	}

	public void setLesson_price(int lesson_price) {
		this.lesson_price = lesson_price;
	}

	public String getLesson_thumbnail() {
		return lesson_thumbnail;
	}

	public void setLesson_thumbnail(String lesson_thumbnail) {
		this.lesson_thumbnail = lesson_thumbnail;
	}

	public String getLesson_short_cont() {
		return lesson_short_cont;
	}

	public void setLesson_short_cont(String lesson_short_cont) {
		this.lesson_short_cont = lesson_short_cont;
	}

	public String getLesson_state() {
		return lesson_state;
	}

	public void setLesson_state(String lesson_state) {
		this.lesson_state = lesson_state;
	}

	public String getLesson_kit() {
		return lesson_kit;
	}

	public void setLesson_kit(String lesson_kit) {
		this.lesson_kit = lesson_kit;
	}
	
	
}
	
	
	
	
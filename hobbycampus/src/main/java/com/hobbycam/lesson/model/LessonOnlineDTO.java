package com.hobbycam.lesson.model;

import java.sql.Date;

public class LessonOnlineDTO {

	private int online_idx;
	private int lesson_idx;
	private String online_subj;
	private String online_img;
	private String online_file;
	private String online_cont;
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
	
	public LessonOnlineDTO() {
		super();
	}

	public LessonOnlineDTO(int online_idx, int lesson_idx, String online_subj, String online_img, String online_file,
			String online_cont, int cate2_idx, int t_idx, String lesson_subj, Date lesson_up_date, String lesson_type,
			int lesson_price, String lesson_thumbnail, String lesson_short_cont, String lesson_state,
			String lesson_kit) {
		super();
		this.online_idx = online_idx;
		this.lesson_idx = lesson_idx;
		this.online_subj = online_subj;
		this.online_img = online_img;
		this.online_file = online_file;
		this.online_cont = online_cont;
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

	public int getOnline_idx() {
		return online_idx;
	}

	public void setOnline_idx(int online_idx) {
		this.online_idx = online_idx;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public String getOnline_subj() {
		return online_subj;
	}

	public void setOnline_subj(String online_subj) {
		this.online_subj = online_subj;
	}

	public String getOnline_img() {
		return online_img;
	}

	public void setOnline_img(String online_img) {
		this.online_img = online_img;
	}

	public String getOnline_file() {
		return online_file;
	}

	public void setOnline_file(String online_file) {
		this.online_file = online_file;
	}

	public String getOnline_cont() {
		return online_cont;
	}

	public void setOnline_cont(String online_cont) {
		this.online_cont = online_cont;
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

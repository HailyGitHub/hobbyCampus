package com.hobbycam.lessonRecord.model;

import java.sql.Date;

public class LessonRecordDTO {
	private int lesson_record_idx;
	private int u_idx;
	private int lesson_schedule_idx;
	private int price_point;
	private Date lesson_buy_date;
	private String lesson_record_state;
	private String lesson_exchange_state;
	private String u_name;
	private String lesson_time;
	private String lesson_subj;
	private String lesson_start;
	
	public LessonRecordDTO() {
		super();
	}

	public LessonRecordDTO(int lesson_record_idx, int u_idx, int lesson_schedule_idx, int price_point,
			Date lesson_buy_date, String lesson_record_state, String lesson_exchange_state, String u_name,
			String lesson_time, String lesson_subj) {
		super();
		this.lesson_record_idx = lesson_record_idx;
		this.u_idx = u_idx;
		this.lesson_schedule_idx = lesson_schedule_idx;
		this.price_point = price_point;
		this.lesson_buy_date = lesson_buy_date;
		this.lesson_record_state = lesson_record_state;
		this.lesson_exchange_state = lesson_exchange_state;
		this.u_name = u_name;
		this.lesson_time = lesson_time;
		this.lesson_subj = lesson_subj;
	}

	
	public LessonRecordDTO(int lesson_record_idx, int u_idx, int lesson_schedule_idx, int price_point,
			Date lesson_buy_date, String lesson_record_state, String lesson_exchange_state, String u_name,
			String lesson_time, String lesson_subj, String lesson_start) {
		super();
		this.lesson_record_idx = lesson_record_idx;
		this.u_idx = u_idx;
		this.lesson_schedule_idx = lesson_schedule_idx;
		this.price_point = price_point;
		this.lesson_buy_date = lesson_buy_date;
		this.lesson_record_state = lesson_record_state;
		this.lesson_exchange_state = lesson_exchange_state;
		this.u_name = u_name;
		this.lesson_time = lesson_time;
		this.lesson_subj = lesson_subj;
		this.lesson_start = lesson_start;
	}

	
	public String getLesson_start() {
		return lesson_start;
	}

	public void setLesson_start(String lesson_start) {
		this.lesson_start = lesson_start;
	}

	public int getLesson_record_idx() {
		return lesson_record_idx;
	}

	public void setLesson_record_idx(int lesson_record_idx) {
		this.lesson_record_idx = lesson_record_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getLesson_schedule_idx() {
		return lesson_schedule_idx;
	}

	public void setLesson_schedule_idx(int lesson_schedule_idx) {
		this.lesson_schedule_idx = lesson_schedule_idx;
	}

	public int getPrice_point() {
		return price_point;
	}

	public void setPrice_point(int price_point) {
		this.price_point = price_point;
	}

	public Date getLesson_buy_date() {
		return lesson_buy_date;
	}

	public void setLesson_buy_date(Date lesson_buy_date) {
		this.lesson_buy_date = lesson_buy_date;
	}

	public String getLesson_record_state() {
		return lesson_record_state;
	}

	public void setLesson_record_state(String lesson_record_state) {
		this.lesson_record_state = lesson_record_state;
	}

	public String getLesson_exchange_state() {
		return lesson_exchange_state;
	}

	public void setLesson_exchange_state(String lesson_exchange_state) {
		this.lesson_exchange_state = lesson_exchange_state;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getLesson_time() {
		return lesson_time;
	}

	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}

	public String getLesson_subj() {
		return lesson_subj;
	}

	public void setLesson_subj(String lesson_subj) {
		this.lesson_subj = lesson_subj;
	}
	
	
}



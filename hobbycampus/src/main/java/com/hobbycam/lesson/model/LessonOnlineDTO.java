package com.hobbycam.lesson.model;

import java.sql.Date;

public class LessonOnlineDTO {

	private int online_idx;
	private int lesson_idx;
	private String online_subj;
	private String online_img;
	private String online_file;
	private String online_cont;
	
	public LessonOnlineDTO() {
		super();
	}

	public LessonOnlineDTO(int online_idx, int lesson_idx, String online_subj, String online_img, String online_file,
			String online_cont) {
		super();
		this.online_idx = online_idx;
		this.lesson_idx = lesson_idx;
		this.online_subj = online_subj;
		this.online_img = online_img;
		this.online_file = online_file;
		this.online_cont = online_cont;
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

	
	
	
	
}

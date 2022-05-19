package com.hobbycam.lesson.model;

import java.sql.Date;

public class LessonScheduleDTO {

	private int lesson_schedule_idx;
	private int lesson_idx;
	private Date lesson_start;
	private String lesson_time;
	private String lesson_people;
	
	public LessonScheduleDTO() {
		// TODO Auto-generated constructor stub
	}

	public LessonScheduleDTO(int lesson_schedule_idx, int lesson_idx, Date lesson_start, String lesson_time,
			String lesson_people) {
		super();
		this.lesson_schedule_idx = lesson_schedule_idx;
		this.lesson_idx = lesson_idx;
		this.lesson_start = lesson_start;
		this.lesson_time = lesson_time;
		this.lesson_people = lesson_people;
	}

	public int getLesson_schedule_idx() {
		return lesson_schedule_idx;
	}

	public void setLesson_schedule_idx(int lesson_schedule_idx) {
		this.lesson_schedule_idx = lesson_schedule_idx;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public Date getLesson_start() {
		return lesson_start;
	}

	public void setLesson_start(Date lesson_start) {
		this.lesson_start = lesson_start;
	}

	public String getLesson_time() {
		return lesson_time;
	}

	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}

	public String getLesson_people() {
		return lesson_people;
	}

	public void setLesson_people(String lesson_people) {
		this.lesson_people = lesson_people;
	}
	
	
}

package com.hobbycam.schedule.model;

import java.sql.*;

public class ScheduleDTO {
	
	private int lesson_schedule_idx;
	private int lesson_idx;
	private String lesson_start;
	private String lesson_time;
	private int lesson_people;
	
	public ScheduleDTO() {
		super();
	}

	public ScheduleDTO(int lesson_schedule_idx, int lesson_idx, String lesson_start, String lesson_time,
			int lesson_people) {
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

	public String getLesson_start() {
		return lesson_start;
	}

	public void setLesson_start(String lesson_start) {
		this.lesson_start = lesson_start;
	}

	public String getLesson_time() {
		return lesson_time;
	}

	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}

	public int getLesson_people() {
		return lesson_people;
	}

	public void setLesson_people(int lesson_people) {
		this.lesson_people = lesson_people;
	}


}


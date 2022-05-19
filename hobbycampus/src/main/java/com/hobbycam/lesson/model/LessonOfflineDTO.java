package com.hobbycam.lesson.model;

import java.sql.Date;

public class LessonOfflineDTO {
	
	private int offline_idx;
	private int lesson_idx;
	private int offline_runtime;
	private String offline_map;
	private String offline_folder;
	private String offline_cont;
	private String offline_addr;
	
	public LessonOfflineDTO() {
		super();
	}

	public LessonOfflineDTO(int offline_idx, int lesson_idx, int offline_runtime, String offline_map,
			String offline_folder, String offline_cont, String offline_addr) {
		super();
		this.offline_idx = offline_idx;
		this.lesson_idx = lesson_idx;
		this.offline_runtime = offline_runtime;
		this.offline_map = offline_map;
		this.offline_folder = offline_folder;
		this.offline_cont = offline_cont;
		this.offline_addr = offline_addr;
	}

	public int getOffline_idx() {
		return offline_idx;
	}

	public void setOffline_idx(int offline_idx) {
		this.offline_idx = offline_idx;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public int getOffline_runtime() {
		return offline_runtime;
	}

	public void setOffline_runtime(int offline_runtime) {
		this.offline_runtime = offline_runtime;
	}

	public String getOffline_map() {
		return offline_map;
	}

	public void setOffline_map(String offline_map) {
		this.offline_map = offline_map;
	}

	public String getOffline_folder() {
		return offline_folder;
	}

	public void setOffline_folder(String offline_folder) {
		this.offline_folder = offline_folder;
	}

	public String getOffline_cont() {
		return offline_cont;
	}

	public void setOffline_cont(String offline_cont) {
		this.offline_cont = offline_cont;
	}

	public String getOffline_addr() {
		return offline_addr;
	}

	public void setOffline_addr(String offline_addr) {
		this.offline_addr = offline_addr;
	}
	
	
}

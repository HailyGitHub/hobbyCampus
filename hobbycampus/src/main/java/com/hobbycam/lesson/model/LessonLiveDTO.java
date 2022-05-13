package com.hobbycam.lesson.model;

public class LessonLiveDTO {
	
	private int live_idx;
	private int lesson_idx;
	private int live_runtime;
	private String live_tool;
	private String live_folder;
	private String live_cont;
	
	public LessonLiveDTO() {
		super();
	}

	public LessonLiveDTO(int live_idx, int lesson_idx, int live_runtime, String live_tool, String live_folder,
			String live_cont) {
		super();
		this.live_idx = live_idx;
		this.lesson_idx = lesson_idx;
		this.live_runtime = live_runtime;
		this.live_tool = live_tool;
		this.live_folder = live_folder;
		this.live_cont = live_cont;
	}

	public int getLive_idx() {
		return live_idx;
	}

	public void setLive_idx(int live_idx) {
		this.live_idx = live_idx;
	}

	public int getLesson_idx() {
		return lesson_idx;
	}

	public void setLesson_idx(int lesson_idx) {
		this.lesson_idx = lesson_idx;
	}

	public int getLive_runtime() {
		return live_runtime;
	}

	public void setLive_runtime(int live_runtime) {
		this.live_runtime = live_runtime;
	}

	public String getLive_tool() {
		return live_tool;
	}

	public void setLive_tool(String live_tool) {
		this.live_tool = live_tool;
	}

	public String getLive_folder() {
		return live_folder;
	}

	public void setLive_folder(String live_folder) {
		this.live_folder = live_folder;
	}

	public String getLive_cont() {
		return live_cont;
	}

	public void setLive_cont(String live_cont) {
		this.live_cont = live_cont;
	}
	
}

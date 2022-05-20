package com.hobbycam.VO;

import java.util.Date;

public class LessonRecordVO {
	private String lessonSubj;
	private String tName;
	private String lessonBuyDate;
	private String lessonRecordState;
	private String lesson_type;
	private String lesson_time;
	private String lesson_thumbnail;
	
	public LessonRecordVO() {
		// TODO Auto-generated constructor stub
	}

	


	public LessonRecordVO(String lessonSubj, String tName, String lessonBuyDate, String lessonRecordState,
			String lesson_type, String lesson_time, String lesson_thumbnail) {
		super();
		this.lessonSubj = lessonSubj;
		this.tName = tName;
		this.lessonBuyDate = lessonBuyDate;
		this.lessonRecordState = lessonRecordState;
		this.lesson_type = lesson_type;
		this.lesson_time = lesson_time;
		this.lesson_thumbnail = lesson_thumbnail;
	}


	public LessonRecordVO(String lessonSubj, String tName, String lessonBuyDate, String lessonRecordState,
			String lesson_type) {
		super();
		this.lessonSubj = lessonSubj;
		this.tName = tName;
		this.lessonBuyDate = lessonBuyDate;
		this.lessonRecordState = lessonRecordState;
		this.lesson_type = lesson_type;
	}

	
	public String getLessonSubj() {
		return lessonSubj;
	}




	public void setLessonSubj(String lessonSubj) {
		this.lessonSubj = lessonSubj;
	}




	public String gettName() {
		return tName;
	}




	public void settName(String tName) {
		this.tName = tName;
	}




	public String getLessonBuyDate() {
		return lessonBuyDate;
	}




	public void setLessonBuyDate(String lessonBuyDate) {
		this.lessonBuyDate = lessonBuyDate;
	}




	public String getLessonRecordState() {
		return lessonRecordState;
	}




	public void setLessonRecordState(String lessonRecordState) {
		this.lessonRecordState = lessonRecordState;
	}




	public String getLesson_type() {
		return lesson_type;
	}




	public void setLesson_type(String lesson_type) {
		this.lesson_type = lesson_type;
	}




	public String getLesson_time() {
		return lesson_time;
	}




	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}




	public String getLesson_thumbnail() {
		return lesson_thumbnail;
	}




	public void setLesson_thumbnail(String lesson_thumbnail) {
		this.lesson_thumbnail = lesson_thumbnail;
	}




	@Override
	public String toString() {
		return "LessonRecordVO [lessonSubj=" + lessonSubj + ", tName=" + tName + ", lessonBuyDate=" + lessonBuyDate
				+ ", lessonRecordState=" + lessonRecordState + "]";
	}

}

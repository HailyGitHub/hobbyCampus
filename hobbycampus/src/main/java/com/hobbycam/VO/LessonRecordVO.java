package com.hobbycam.VO;

import java.util.Date;

public class LessonRecordVO {
	private String lessonSubj;
	private String tName;
	private String lessonBuyDate;
	private String lessonRecordState;
	private String lesson_type;
	
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

	public LessonRecordVO() {
		super();
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

	@Override
	public String toString() {
		return "LessonRecordVO [lessonSubj=" + lessonSubj + ", tName=" + tName + ", lessonBuyDate=" + lessonBuyDate
				+ ", lessonRecordState=" + lessonRecordState + "]";
	}

}

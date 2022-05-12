package com.hobbycam.VO;

import java.util.Date;

public class LessonRecordVO {
	private String lessonSubj;
	private String tName;
	private String lessonBuyDate;
	private String lessonRecordState;
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
	@Override
	public String toString() {
		return "LessonRecordVO [lessonSubj=" + lessonSubj + ", tName=" + tName + ", lessonBuyDate=" + lessonBuyDate
				+ ", lessonRecordState=" + lessonRecordState + "]";
	}
	

}

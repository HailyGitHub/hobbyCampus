package com.hobbycam.VO;
import java.sql.*;
public class LessonScheduleVO {
	private int lessonIdx;
	private int cate2Idx;
	private int tIdx;
	private String lessonSubj;
	private String lessonUpDate;
	private String lessonType;
	private int lessonPrice;
	private String lessonThumbnail;
	private String lessonShortCount;
	private String lessonState;
	private String lessonKit;
	private String tName;
	private String lessonStart;


	public int getLessonIdx() {
		return lessonIdx;
	}
	public void setLessonIdx(int lessonIdx) {
		this.lessonIdx = lessonIdx;
	}
	public int getCate2Idx() {
		return cate2Idx;
	}
	public void setCate2Idx(int cate2Idx) {
		this.cate2Idx = cate2Idx;
	}
	public int gettIdx() {
		return tIdx;
	}
	public void settIdx(int tIdx) {
		this.tIdx = tIdx;
	}
	public String getLessonSubj() {
		return lessonSubj;
	}
	public void setLessonSubj(String lessonSubj) {
		this.lessonSubj = lessonSubj;
	}
	public String getLessonUpDate() {
		return lessonUpDate;
	}
	public void setLessonUpDate(String lessonUpDate) {
		this.lessonUpDate = lessonUpDate;
	}
	public String getLessonType() {
		return lessonType;
	}
	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}
	public int getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(int lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public String getLessonThumbnail() {
		return lessonThumbnail;
	}
	public void setLessonThumbnail(String lessonThumbnail) {
		this.lessonThumbnail = lessonThumbnail;
	}
	public String getLessonShortCount() {
		return lessonShortCount;
	}
	public void setLessonShortCount(String lessonShortCount) {
		this.lessonShortCount = lessonShortCount;
	}
	public String getLessonState() {
		return lessonState;
	}
	public void setLessonState(String lessonState) {
		this.lessonState = lessonState;
	}
	public String getLessonKit() {
		return lessonKit;
	}
	public void setLessonKit(String lessonKit) {
		this.lessonKit = lessonKit;
	}
	
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	@Override
	public String toString() {
		return "LessonVO [lessonIdx=" + lessonIdx + ", cate2Idx=" + cate2Idx + ", tIdx=" + tIdx + ", lessonSubj="
				+ lessonSubj + ", lessonUpDate=" + lessonUpDate + ", lessonType=" + lessonType + ", lessonPrice="
				+ lessonPrice + ", lessonThumbnail=" + lessonThumbnail + ", lessonShortCount=" + lessonShortCount
				+ ", lessonState=" + lessonState + ", lessonKit=" + lessonKit + "]";
	}
	public String getLessonStart() {
		return lessonStart;
	}
	public void setLessonStart(String lessonStart) {
		this.lessonStart = lessonStart;
	}
	
	
}

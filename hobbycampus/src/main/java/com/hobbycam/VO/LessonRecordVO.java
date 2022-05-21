package com.hobbycam.VO;

import java.util.Date;

public class LessonRecordVO {
   private String lessonSubj;
   private String tName;
   private String lessonBuyDate;
   private String lessonRecordState;
   private String lesson_type;
   private String lessonTime;
   private String lessonStart;
   private String lesson_thumbnail;
   private String lessonIdx;
   

   
   
   /*
    * public LessonRecordVO(String lessonSubj, String tName, String lessonBuyDate,
    * String lessonRecordState, String lesson_type, String lessonTime, String
    * lessonStart, String lesson_thumbnail) { super(); this.lessonSubj =
    * lessonSubj; this.tName = tName; this.lessonBuyDate = lessonBuyDate;
    * this.lessonRecordState = lessonRecordState; this.lesson_type = lesson_type;
    * this.lessonTime = lessonTime; this.lessonStart = lessonStart;
    * this.lesson_thumbnail = lesson_thumbnail; }
    */

   


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




   public String getLessonTime() {
      return lessonTime;
   }




   public void setLessonTime(String lessonTime) {
      this.lessonTime = lessonTime;
   }




   public String getLessonStart() {
      return lessonStart;
   }




   public void setLessonStart(String lessonStart) {
      this.lessonStart = lessonStart;
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




public String getLessonIdx() {
   return lessonIdx;
}




public void setLessonIdx(String lessonIdx) {
   this.lessonIdx = lessonIdx;
}


}
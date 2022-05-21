package com.hobbycam.VO;

public class PayVO {
   private int payListIdx;
   private String payDate;
   private int point;
   private String title;
   private String type;
   
   public int getPayListIdx() {
      return payListIdx;
   }
   public void setPayListIdx(int payListIdx) {
      this.payListIdx = payListIdx;
   }
   public String getPayDate() {
      return payDate;
   }
   public void setPayDate(String payDate) {
      this.payDate = payDate;
   }
   public int getPoint() {
      return point;
   }
   public void setPoint(int point) {
      this.point = point;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   @Override
   public String toString() {
      return "PayVO [payListIdx=" + payListIdx + ", payDate=" + payDate + ", point=" + point + ", title=" + title
            + ", type=" + type + "]";
   }
   

}
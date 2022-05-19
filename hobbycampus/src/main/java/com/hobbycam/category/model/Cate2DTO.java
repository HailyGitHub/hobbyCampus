package com.hobbycam.category.model;

public class Cate2DTO {

   private int cate2_idx;
   private int cate1_idx;
   private String cate2_name;
   private String cate2_img;
   
   public Cate2DTO() {
      // TODO Auto-generated constructor stub
   }

   public Cate2DTO(int cate2_idx, int cate1_idx, String cate2_name, String cate2_img) {
      super();
      this.cate2_idx = cate2_idx;
      this.cate1_idx = cate1_idx;
      this.cate2_name = cate2_name;
      this.cate2_img = cate2_img;
   }

   public int getCate2_idx() {
      return cate2_idx;
   }

   public void setCate2_idx(int cate2_idx) {
      this.cate2_idx = cate2_idx;
   }

   public int getCate1_idx() {
      return cate1_idx;
   }

   public void setCate1_idx(int cate1_idx) {
      this.cate1_idx = cate1_idx;
   }

   public String getCate2_name() {
      return cate2_name;
   }

   public void setCate2_name(String cate2_name) {
      this.cate2_name = cate2_name;
   }

   public String getCate2_img() {
      return cate2_img;
   }

   public void setCate2_img(String cate2_img) {
      this.cate2_img = cate2_img;
   }

}
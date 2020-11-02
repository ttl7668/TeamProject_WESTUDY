package com.project.product.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductResultVO {

   private int pno;
   private String title;
   private String category;
   private String creator;
   private String thumbnail;
   private String intro;
   private Timestamp startDate;
   private Timestamp endDate;
   private String price;
   private String volume;
   private Timestamp regdate;
   private String term;
   
   private String contents;
   
   private String QnA;
   
   
   
   
   
   
   
   
}
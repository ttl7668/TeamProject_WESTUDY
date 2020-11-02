package com.project.product.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.Data;

@Data
public class ProductVO {

   private int pno;
   private int uno;
   private String title;
   private String category;
   private String creator;
   private String thumbnail;
   private String intro;
   private String startDate;
   private String endDate;
   private String price;
   private String volume;
   private Timestamp regdate;
   private String term;
   
   private ArrayList<ContentVO> contents;
   
   private ArrayList<QnAVO> QnA;
   
   private String titleSearch;
   private String introSearch;
   private String creatorSearch;

   
}
package com.project.review.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
   private Integer rno;
   private Integer pno;
   private Integer uno;
   private String title;
   private String writer;
   private String content;
   private Timestamp regdate;
   private String satisfaction;


   
   
}
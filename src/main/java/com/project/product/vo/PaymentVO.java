package com.project.product.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentVO {

   private int sno;
   private int pno;
   private int uno;
   private int amount;
   private String cardGrantNum;
   private Timestamp regdate;
   
}
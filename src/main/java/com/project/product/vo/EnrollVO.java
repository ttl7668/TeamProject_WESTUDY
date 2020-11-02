package com.project.product.vo;

import lombok.Data;

@Data
public class EnrollVO {
   
   private int pno;
   private int uno;
   
   
   public EnrollVO() {
      super();
   }
   public EnrollVO(int pno, int uno) {
      super();
      this.pno = pno;
      this.uno = uno;
   }
   
   
   
   

}
package com.project.util;


public class Criteria {
   //화면에서 전달할 값들을 가지고 다닐 클래스   
   private int pageNum;
   private int amount;
   
   //검색에 필요한 데이터를 변수로 선언.
   private String searchType;
   private String searchName;

   public Criteria() {
      this(1, 10);
   }

   public Criteria(int pageNum, int amount) {
      this.pageNum = pageNum;
      this.amount = amount;
   }

   public Criteria(int pageNum, int amount, String searchType, String searchName) {
      super();
      this.pageNum = pageNum;
      this.amount = amount;
      this.searchType = searchType;
      this.searchName = searchName;
   }

   public int getPageNum() {
      return pageNum;
   }

   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
   }

   public int getAmount() {
      return amount;
   }

   public void setAmount(int amount) {
      this.amount = amount;
   }

   public String getSearchType() {
      return searchType;
   }

   public void setSearchType(String searchType) {
      this.searchType = searchType;
   }

   public String getSearchName() {
      return searchName;
   }

   public void setSearchName(String searchName) {
      this.searchName = searchName;
   }
   
   
   
}
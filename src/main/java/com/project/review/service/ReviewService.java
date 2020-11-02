package com.project.review.service;

import java.util.List;

import com.project.review.vo.ReviewVO;

public interface ReviewService {

   public int reviewRegist(ReviewVO vo);
   public String reviewBoard();
   public ReviewVO ReviewContent(ReviewVO reviewVO);
   public List<ReviewVO> getList(int startNum, int pno);
   public String reviewWrite();
   public int ReviewUpdate(ReviewVO vo);
   public int ReviewDelete(ReviewVO vo);
   public int getReviewTotal();
   public Double getReviewAvg(int pno);
   
}
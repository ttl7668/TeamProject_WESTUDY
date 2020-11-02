package com.project.review.mapper;

import java.util.List;

import com.project.review.vo.ReviewVO;
import com.project.util.Criteria;

public interface ReviewMapper {
   public int reviewRegist(ReviewVO vo);
   public String reviewBoard();
   public ReviewVO ReviewContent(int rno);
   public List<ReviewVO> getList();
   public String reviewWrite();
   public int ReviewUpdate(ReviewVO vo);
   public int ReviewDelete(ReviewVO vo);
   public int getReviewTotal();
}
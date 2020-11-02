package com.project.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{


   private String mapperPath = "com.project.review.mapper.";

   @Autowired
   private SqlSession sqlsession;

   //  후기 게시판 
   @Override
   public String reviewBoard() {

      return sqlsession.selectOne("com.project.review.mapper.ReviewBoard");
   }
   //후기 작성 
   @Override
   public String reviewWrite() {

      return sqlsession.selectOne("com.project.review.mapper.ReviewWrite");
   }
   //후기 등록 
   @Override
   public int reviewRegist(ReviewVO vo) {

      return sqlsession.insert(mapperPath + "reviewRegist", vo);
   }
   //후기 정보 불러오기
   @Override
   public List<ReviewVO> getList(int startNum, int pno) {
	  Map<String, Integer> map = new HashMap<String, Integer>();
	  map.put("startNum", startNum - 1);
	  map.put("pno", pno);
	  
	  System.out.println("startNum : " + startNum);
	  System.out.println("startNum : " + startNum);
	  System.out.println("startNum : " + startNum);
	  System.out.println("startNum : " + startNum);
	  System.out.println("startNum : " + startNum);
	  
      return sqlsession.selectList(mapperPath + "getList", map);

   }
   //후기 상세 페이지
   @Override
   public ReviewVO ReviewContent(ReviewVO reviewVO) {
      return sqlsession.selectOne("com.project.review.mapper.getReviewDetail", reviewVO);
   }

   /*
    * //후기 수정 페이지 이동
    * 
    * @Override public ReviewVO getReviewModify(int rno) {
    * 
    * return sqlsession.selectOne("com.project.review.mapper.getReviewModify",
    * rno); }
    */
   //후기 업데이트
   @Override
   public int ReviewUpdate(ReviewVO vo) {
      return sqlsession.update("com.project.review.mapper.ReviewUpdate", vo);

   }
   @Override
   public int ReviewDelete(ReviewVO vo) {
      
      return sqlsession.delete("com.project.review.mapper.ReviewDelete", vo);
   }
   @Override
   public int getReviewTotal() {
   
      return sqlsession.selectOne("com.project.review.mapper.getReviewTotal");
      
   }
   
   @Override
	public Double getReviewAvg(int pno) {
		return sqlsession.selectOne("com.project.review.mapper.getReviewAvg", pno);
	}
   

   
}
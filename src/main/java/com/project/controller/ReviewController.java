package com.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.review.vo.ReviewVO;
import com.project.user.vo.UserVO;
import com.project.product.service.ProductService;
import com.project.product.vo.ProductResultVO;
import com.project.review.service.ReviewService;
import com.project.util.Criteria;
import com.project.util.ReviewPageVO;
import com.project.util.SessionKeyCode;


@Controller
@RequestMapping("/Review")
public class ReviewController {

   @Autowired
   private ReviewService reviewService; 
   
   @Autowired
   private ProductService productService;

   //리뷰 작성
   @GetMapping("/ReviewWrite")
   public String ReviewWrite(@RequestParam("pno")int pno, Model model) {//값이 들어온거를 등록합니다. :-)
	   model.addAttribute("pno", pno);
      return "/Review/ReviewWrite"; 
   }

   //리뷰 등록
   @RequestMapping("/ReviewRegist")
   public String ReviewRegist(ReviewVO vo, HttpSession session, Model model) {
	   UserVO sessionUser = (UserVO) session.getAttribute(SessionKeyCode.userKey);
	  int uno = sessionUser.getUno(); 
      System.out.println(vo.toString());
      vo.setUno(uno);
      reviewService.reviewRegist(vo);
      model.addAttribute("pno", vo.getPno());
      return "redirect:/Review/ReviewBoard";
   }
   //수강 후기
   @RequestMapping("/ReviewBoard")
   public String ReviewBoard(HttpServletRequest request, Model  model,
          Criteria cri, @RequestParam("pno") int pno) {
	  ProductResultVO productVO = productService.getProductInfo(pno); 
      int total = reviewService.getReviewTotal();
      ReviewPageVO reviewPageVO = new ReviewPageVO(total, cri); //화면에 그려질 페이지네이션처리
      int startNum = ((reviewPageVO.getPageNum() - 1) * 10) + 1;
      
      ArrayList<ReviewVO> list =  (ArrayList<ReviewVO>)reviewService.getList(startNum, pno);
      Double satisAvg = reviewService.getReviewAvg(pno);
      
      satisAvg = (double) Math.round(satisAvg);
      
      //페이징
      model.addAttribute("satisAvg", satisAvg);
      model.addAttribute("productVO", productVO);
      model.addAttribute("ReviewPageVO", reviewPageVO); 
      model.addAttribute("list",list);
      model.addAttribute("pno", pno);
      System.out.println(reviewPageVO.toString());

      return "/Review/ReviewBoard"; 
   }
   //리뷰 자세히 보기, 수정화면 보기
   @RequestMapping("/ReviewDetail")
   public String reviewDetail(@RequestParam("rno") int rno,
         Model model
         ) {
	  ReviewVO reviewVO = new ReviewVO();
	  reviewVO.setRno(rno);
      ReviewVO resultReview = reviewService.ReviewContent(reviewVO);
      model.addAttribute("reviewVO", resultReview);
      return "/Review/ReviewDetail";
      
   }
   
   @RequestMapping("/ReviewModify")
   public String reviewModify(@RequestParam("rno") int rno,@RequestParam("pno") int pno, Model model, HttpServletRequest request) {
	   HttpSession session = request.getSession();
	   UserVO sessionUser = (UserVO) session.getAttribute(SessionKeyCode.userKey);
	   int uno = sessionUser.getUno();
	   ReviewVO reviewVO = new ReviewVO();
	   reviewVO.setPno(pno);
	   reviewVO.setRno(rno);
	   reviewVO.setUno(uno);
	   
	   ReviewVO resultReview = reviewService.ReviewContent(reviewVO);
	   model.addAttribute("reviewVO", resultReview);
	   return "/Review/ReviewModify";
   }

   //후기 수정
   @RequestMapping("/ReviewUpdate")
   public String ReviewUpdate(ReviewVO vo, RedirectAttributes RA, HttpServletRequest request) {
	   
      //성공시 1 실패시 0
      int result = reviewService.ReviewUpdate(vo);

      if(result == 1) {
         RA.addFlashAttribute("msg", "게시글이 정상 수정되었습니다.");
      } else {
         RA.addFlashAttribute("msg", "게시글 수정에 실패했습니다.");
      }
      return "redirect:/Review/ReviewBoard?pno="+ vo.getPno();
   }

   //후기 삭제
      @RequestMapping("/ReviewDelete")
      public String ReviewDelete(ReviewVO vo, RedirectAttributes RA) {
         
         int result = (int)reviewService.ReviewDelete(vo);
         if(result == 1) {
            RA.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");
         } else {
            RA.addFlashAttribute("msg", "게시글 삭제에 실패했습니다.");
         }
         
         //다시 목록으로 리다이렉트
         return "redirect:/Review/ReviewBoard?pno="+ vo.getPno();
      }
}
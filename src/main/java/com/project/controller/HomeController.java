package com.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.highchart.vo.LineGraphVO;
import com.project.highchart.vo.PiGraphVO;
import com.project.product.service.ProductService;
import com.project.product.vo.ProductResultVO;


@Controller
public class HomeController {
   
   @Autowired
   ProductService productService;
   
   
   @RequestMapping(value = "/")
   public String home(Locale locale, Model model) {
      
      
      //모든 강좌 정보 가져오기
      ArrayList<ProductResultVO> allProductList = (ArrayList<ProductResultVO>)productService.getAllProductList();
      model.addAttribute("allProductlist",allProductList);
      
      
      //인기 강좌 TOP10 가져오기
      ArrayList<ProductResultVO> TopProductList = (ArrayList<ProductResultVO>)productService.getTopProductList();
      model.addAttribute("TopProductList",TopProductList);
      
      
      //인기 강좌 TOP3 가져오기
      ArrayList<ProductResultVO> TopThreeProductList = (ArrayList<ProductResultVO>)productService.getTopThreeProductList();
      model.addAttribute("TopThreeProductList",TopThreeProductList);
      
      for(int i = 0; i<TopThreeProductList.size(); i++) {
    	  model.addAttribute("TopThreeProductListCategory" + i,TopThreeProductList.get(i).getCategory()) ;
    	  model.addAttribute("TopThreeProductListTitle" + i,TopThreeProductList.get(i).getTitle());
    	  model.addAttribute("TopThreeProductListPrice" + i,TopThreeProductList.get(i).getPrice());
    	  model.addAttribute("TopThreeProductListThumb" + i,TopThreeProductList.get(i).getThumbnail());
    	  model.addAttribute("TopThreeProductListPno" + i,TopThreeProductList.get(i).getPno());
    	  
      }
      
      //신규 강좌 가져오기
      ArrayList<ProductResultVO> RecentProductList = (ArrayList<ProductResultVO>)productService.getRecentProductList();
      model.addAttribute("RecentProductList",RecentProductList);
      
      
      //꺾은선 차트 정보 가져오기
      ArrayList<LineGraphVO> LineGraphList = (ArrayList<LineGraphVO>)productService.NumberOfStudentByCategory();
      
      try {
         String[] LineGraphCategoryArr = new String[LineGraphList.size()];
         int[] LineGraphSumArr = new int[LineGraphList.size()];
         
         for(int i = 0; i < LineGraphList.size(); i++) {
            LineGraphCategoryArr[i] = LineGraphList.get(i).getCategory();
            LineGraphSumArr[i] = LineGraphList.get(i).getSum();
            
            model.addAttribute("LineGraphCategoryArr" + i,LineGraphCategoryArr[i]);
            model.addAttribute("LineGraphSumArr" + i,LineGraphSumArr[i]);
            
            System.out.println(LineGraphCategoryArr[i] + " : " + LineGraphSumArr[i] );
         }

//         model.addAttribute("LineGraphCategoryArr",LineGraphCategoryArr);
//         model.addAttribute("LineGraphSumArr",LineGraphSumArr);
          
          
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      
      
      //파이차트(원형차트) 정보 가져오기
      ArrayList<PiGraphVO> PiGraphList = (ArrayList<PiGraphVO>)productService.NumberOfProductByCategory();
      
      try {
         String[] PiGraphCategoryArr = new String[PiGraphList.size()];
         int[] PiGraphSumArr = new int[PiGraphList.size()];
         double[] PiGraphPercentageArr = new double[PiGraphList.size()];
         int[] PiGraphPercentageArrInt = new int[PiGraphList.size()];
         
         int TotalCount = 0;
         
         for(int i = 0; i < PiGraphList.size(); i++) {
            PiGraphCategoryArr[i] = PiGraphList.get(i).getCategory();
            PiGraphSumArr[i] = PiGraphList.get(i).getTotal();
            
            TotalCount = TotalCount + PiGraphSumArr[i];
         }

         
         
         for(int i = 0; i < PiGraphList.size(); i++) {
            PiGraphPercentageArr[i] = (double)PiGraphSumArr[i] / TotalCount * 100;
            PiGraphPercentageArr[i] = Math.round(PiGraphPercentageArr[i]/1.0);
            
            PiGraphPercentageArrInt[i] = (int)PiGraphPercentageArr[i];
            
            model.addAttribute("PiGraphCategoryArr" + i,PiGraphCategoryArr[i]);
            model.addAttribute("PiGraphPercentageArr" + i,PiGraphPercentageArr[i]);
            
            System.out.println(PiGraphCategoryArr[i] + " : " + PiGraphPercentageArr[i]);
         }
         
         
          
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      return "home";
   }
   
   
   
}
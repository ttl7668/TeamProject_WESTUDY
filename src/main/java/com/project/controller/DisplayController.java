package com.project.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.product.service.ProductService;
import com.project.product.vo.ProductResultVO;

@Controller
@RequestMapping("/Display")      //이미지 화면 출력 전용 컨트롤러
public class DisplayController {
   
   @Autowired
   ProductService productService;
   
   @ResponseBody
   @RequestMapping("productImgLoad")
   public byte[] Product(@RequestParam("pno") int pno, @RequestParam("img") int img) {

      ProductResultVO productResultVO = productService.getProductInfo(pno);
      
      String contentStr = productResultVO.getContents();
      String[] contentList = contentStr.split("&&bhc&&");

      ArrayList<String> contentImgList = new ArrayList<String>();
      ArrayList<String> contentTextList = new ArrayList<String>();
      for(int i = 0; i < contentList.length-1; i++) {
         contentImgList.add(contentList[i]);
         i++;
         contentTextList.add(contentList[i]);
      }
      
      System.out.println(contentImgList.get(img));
      
      File file = new File(contentImgList.get(img));
      
      
      
      byte[] result = null;
      try {
         result = FileCopyUtils.copyToByteArray(file);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
      
      return result;
   }
   
   
   @ResponseBody
   @RequestMapping("ProductThumbnail")
   public byte[] ProductThumbnail(@RequestParam("pno") int pno) {

      ProductResultVO productResultVO = productService.getProductInfo(pno);
      
      String thumbNail = productResultVO.getThumbnail();
      File file = new File(thumbNail);
      
      byte[] result = null;
      try {
         result = FileCopyUtils.copyToByteArray(file);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
      
      return result;
   }

}
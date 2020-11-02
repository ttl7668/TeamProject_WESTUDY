package com.project.product.service;

import java.util.List;

import com.project.highchart.vo.LineGraphVO;
import com.project.highchart.vo.PiGraphVO;
import com.project.product.vo.EnrollVO;
import com.project.product.vo.IntegratedContentVO;
import com.project.product.vo.PaymentVO;
import com.project.product.vo.ProductResultVO;
import com.project.util.SearchKeyword;

public interface ProductService {
   
   public int ProductRegist(IntegratedContentVO integratedVO);
   public ProductResultVO getProductInfo(int pno);
   public int ProductGetNextPno();

   public List<ProductResultVO> getAllProductList();
   public List<ProductResultVO> getTopProductList();
   public List<ProductResultVO> getTopThreeProductList();
   
   public List<ProductResultVO> getRecentProductList();
   
   public int ProductModify(IntegratedContentVO integratedVO);
   public List<ProductResultVO> getMyPageProductList(int uno);
   
   public int PaymentRegist(PaymentVO paymentVO);
   
   public int EnrollProduct(EnrollVO enrollVO);
   public int IsStudent(EnrollVO enrollVO);
   
   public int CreateInterest(EnrollVO enrollVO);
   public int DeleteInterest(EnrollVO enrollVO);
   public int IsInterst(EnrollVO enrollVO);
   
   public List<ProductResultVO> getSameProductList(ProductResultVO productResultVO);
   
   public List<LineGraphVO> NumberOfStudentByCategory();
   public List<PiGraphVO> NumberOfProductByCategory();
   
   public List<ProductResultVO> searchProduct(SearchKeyword searchKeyword);
   
   //도혜린씨가 해본거
   //갓ㅡ혜린
   //public int insertProduct(ProductVO productVO);
   //public int insertProductContent(ArrayList<ContentVO> contentVoList);
   

}
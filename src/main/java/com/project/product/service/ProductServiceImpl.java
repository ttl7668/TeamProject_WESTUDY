package com.project.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.highchart.vo.LineGraphVO;
import com.project.highchart.vo.PiGraphVO;
import com.project.product.vo.EnrollVO;
import com.project.product.vo.IntegratedContentVO;
import com.project.product.vo.PaymentVO;
import com.project.product.vo.ProductResultVO;
import com.project.util.SearchKeyword;

@Service("ProductService")
public class ProductServiceImpl implements ProductService{



   @Autowired
   private SqlSession sqlsession;

   @Override
   public int ProductRegist(IntegratedContentVO integratedVO) {
      //return productDAO.ProductRegist(integratedVO);
      return sqlsession.insert("com.project.product.mapper.ProductRegist",integratedVO);
   }

   @Override
   public ProductResultVO getProductInfo(int pno) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne("com.project.product.mapper.getProductInfo",pno);
   }

   @Override
   public int ProductGetNextPno() {
      // TODO Auto-generated method stub
      return sqlsession.selectOne("com.project.product.mapper.ProductGetNextPno");
   }


   @Override
   public int EnrollProduct(EnrollVO enrollVO) {
      return sqlsession.insert("com.project.product.mapper.enrollProduct",enrollVO);
   }

   @Override
   public List<ProductResultVO> getAllProductList() {
      return sqlsession.selectList("com.project.product.mapper.getAllProductList");
   }

   @Override
   public int ProductModify(IntegratedContentVO integratedVO) {
      return sqlsession.update("com.project.product.mapper.ProductModify",integratedVO);
   }
   
   @Override
	public List<ProductResultVO> getMyPageProductList(int uno) {
		return sqlsession.selectList("com.project.product.mapper.getMyPageProductList", uno);
	}

   @Override
   public int PaymentRegist(PaymentVO paymentVO) {
      return sqlsession.insert("com.project.product.mapper.PaymentRegist",paymentVO);
   }

   @Override
   public int IsStudent(EnrollVO enrollVO) {
      return sqlsession.selectOne("com.project.product.mapper.IsStudent",enrollVO);
   }

   @Override
   public List<LineGraphVO> NumberOfStudentByCategory() {
      return sqlsession.selectList("com.project.product.mapper.NumberOfStudentByCategory");
   }

   @Override
   public List<PiGraphVO> NumberOfProductByCategory() {
      return sqlsession.selectList("com.project.product.mapper.NumberOfProductByCategory");
   }

   @Override
   public int CreateInterest(EnrollVO enrollVO) {
	   	return sqlsession.insert("com.project.product.mapper.CreateInterest",enrollVO);
   }

   @Override
   public int DeleteInterest(EnrollVO enrollVO) {
	   return sqlsession.delete("com.project.product.mapper.DeleteInterest",enrollVO);
   }

   @Override
   public int IsInterst(EnrollVO enrollVO) {
	   return sqlsession.selectOne("com.project.product.mapper.IsInterst",enrollVO);
   }

   @Override
   public List<ProductResultVO> getSameProductList(ProductResultVO productResultVO) {
	   return sqlsession.selectList("com.project.product.mapper.getSameProductList",productResultVO);
   }

   @Override
   public List<ProductResultVO> getTopProductList() {
	   return sqlsession.selectList("com.project.product.mapper.getTopProductList");
   }

   @Override
   public List<ProductResultVO> getRecentProductList() {
	   return sqlsession.selectList("com.project.product.mapper.getRecentProductList");
   }
   
   @Override
   public List<ProductResultVO> searchProduct(SearchKeyword searchKeyword) {
      return sqlsession.selectList("com.project.product.mapper.searchProduct", searchKeyword);
   }

   @Override
   public List<ProductResultVO> getTopThreeProductList() {
	   return sqlsession.selectList("com.project.product.mapper.getTopThreeProductList");
   }




   //이하 도혜린
   //   @Override
   //   public int insertProduct(ProductVO productVO) {
   //      int result = 0;
   //      result = sqlsession.insert("com.project.product.mapper.ProductRegist",productVO);
   //      return result;
   //   }
   //   
   //   @Override
   //   public int insertProductContent(ArrayList<ContentVO> contentVoList) {
   //      int result = -1;
   //      for(int i = 0; i < contentVoList.size(); i++) {
   //         result = sqlsession.insert("com.project.product.mapper.ProductListRegist", contentVoList.get(i));
   //         if(result == 0) return result;
   //      }
   //      return result;
   //   }



}
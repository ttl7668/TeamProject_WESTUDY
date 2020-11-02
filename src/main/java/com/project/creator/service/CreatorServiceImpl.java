package com.project.creator.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.creator.vo.EnrollBoardPubVO;
import com.project.creator.vo.EnrollBoardVO;
import com.project.product.vo.EnrollVO;
import com.project.product.vo.IntegratedContentVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;


@Service("creatorService")
public class CreatorServiceImpl implements CreatorService{

	@Autowired
	private SqlSession sqlsession;
	
	private String mapperPath = "com.project.creator.mapper";
	
//	@Override
//	public int ProductRegist(IntegratedContentVO integratedVO) {
//		//return productDAO.ProductRegist(integratedVO);
//		return sqlsession.insert("com.project.product.mapper.ProductRegist",integratedVO);
//	}
	
	@Override
	public int getMaxEno() {
		int eno = sqlsession.selectOne(mapperPath + ".getMaxEno");
		return eno;
	}
	
	@Override
	public int insertEnrollBoard(EnrollBoardVO enrollBoardVO) {
		return sqlsession.insert(mapperPath + ".insertEnrollBoard", enrollBoardVO);
	}
	
	@Override
	public List<EnrollBoardVO> getEnrollList(String pno) {
		
		List<EnrollBoardVO> resultList = sqlsession.selectList(mapperPath + ".getEnrollList", pno);
		
		return resultList;
	}
	
	@Override
	public List<EnrollBoardVO> getEnrollStudentList(String pno) {
		
		List<EnrollBoardVO> resultList = sqlsession.selectList(mapperPath + ".getEnrollStudentList", pno);
		
		return resultList;
	}
	
	@Override
	public EnrollBoardVO getEnrollDetailBoard(String eno, String pno) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("eno", eno);
		return sqlsession.selectOne(mapperPath + ".getEnrollDetailBoard", map);
	}
	
	@Override
	public List<ProductVO> getUserProductList(int uno) {
		return sqlsession.selectList(mapperPath + ".getUserProductList",uno);
	}

	@Override
	public int IsCreator(EnrollVO enrollVO) {
		return sqlsession.selectOne(mapperPath + ".IsCreator",enrollVO);
	}

	@Override
	public int pubSetAllFalse() {
		return sqlsession.update(mapperPath + ".pubSetAllFalse");
	}
	
	@Override
	public int pubSet(EnrollBoardPubVO enrollBoardPubVO) {
		return sqlsession.update(mapperPath + ".pubSet",enrollBoardPubVO);
	}

	@Override
	public int EnrollDelete(EnrollBoardPubVO enrollBoardPubVO) {
		return sqlsession.delete(mapperPath+".deleteEnrollBoard",enrollBoardPubVO);
	}

	@Override
	public int enrollBoardModify(EnrollBoardPubVO enrollBoardPubVO) {
		
		return sqlsession.update(mapperPath+".modifyEnrollBoard",enrollBoardPubVO);
	}



	
	
}

package com.project.creator.mapper;

import java.util.List;
import java.util.Map;

import com.project.creator.vo.EnrollBoardVO;

public interface CreatorMapper {
	
	public int getMaxEno();
	
	//TODO: pno!
	public int insertEnrollBoard (EnrollBoardVO enrollBoardVO);
	
	public List<EnrollBoardVO> getEnrollList(String pno);
	
	public EnrollBoardVO getEnrollDetailBoard(Map<String, String> map);
}

package com.project.creator.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.util.StringUtil;

import lombok.Data;

@Data
public class EnrollBoardVO {
	//정적인 폼
	private int uno;
	private int eno;
	private int pno;
	private String title;
	private String writer;
	private Timestamp regdate;
	
	
	//동적인 폼을 스트링으로 가져온 것
	private String content;
	
}
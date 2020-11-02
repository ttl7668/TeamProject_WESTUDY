package com.project.product.vo;

import java.util.ArrayList;

public class MultiContentVO {
	
	private ArrayList<ContentVO> ContentList;		// Controller에서 MultiContentVO를 매개변수들중 하나로 받기 때문에, MultiContentVO의 멤버변수인
													// 이 ContentList라는 ArrayList에 자동으로 ContentVO들 (이미지, textArea의 한 쌍)이 채워져요
	
	private String listStr="";						// ContentList 안에있는 ContentVO 안에있는 imgbox의 경로(String ContentImgBox)와 textbox의 내용(String ContentTextBox)을
													// 이 String 변수에 모두 이어 붙여서 데이터베이스의 컬럼에 문자열로 넣을거에요
													// 이미지와 텍스트, 그리고 그 여러 쌍들이 하나의 String에 들어있기 때문에 꺼낼때는 그것들을 구분지어야 해요
	
	private String contentSpace = "&&bhc&&";		// 이 &&bhc&& 라는 문자열을 각각의 요소들의 사이에 집어넣음으로써 이미지와 텍스트, 그 순서쌍들을 구분지을거에요 (split 메소드 검색)
	
	

	public String getListStr() {
		try {
//			listStr = ContentList.get(0).getContentImgBox() + getContentSpace() + ContentList.get(0).getContentTextBox() + getContentSpace() + 
//					ContentList.get(1).getContentImgBox() + getContentSpace() + ContentList.get(1).getContentTextBox() + getContentSpace() +
//					ContentList.get(2).getContentImgBox() + getContentSpace() + ContentList.get(2).getContentTextBox() + getContentSpace() +
//					ContentList.get(3).getContentImgBox() + getContentSpace() + ContentList.get(3).getContentTextBox() + getContentSpace() + 
//					ContentList.get(4).getContentImgBox() + getContentSpace() + ContentList.get(4).getContentTextBox() + getContentSpace() +
//					ContentList.get(5).getContentImgBox() + getContentSpace() + ContentList.get(5).getContentTextBox() + getContentSpace();
			
//			System.out.println("ContentList.toString() : " + ContentList.toString());
//			System.out.println(ContentList.get(0).toString());
			
			for(int i = 0; i < ContentList.size(); i++) {
				String str = ContentList.get(i).getContentImgBox() + getContentSpace() + ContentList.get(i).getContentTextBox() + getContentSpace();
				listStr += str;
//				System.out.println("ContentList : " + ContentList.size());
//				System.out.println("i : " + i);
//				System.out.println("listStr : " + listStr);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
//		System.out.println(listStr);
//		System.out.println("getlistStr : " + listStr);
		return listStr;
	}

	public void setListStr(String listStr) {
		this.listStr = listStr;
		System.out.println("setlistStr : " + listStr);
	}

	public MultiContentVO() {
		super();
	}

	public MultiContentVO(ArrayList<ContentVO> contentList) {
		super();
		ContentList = contentList;
		listStr = ContentList.toString();
		System.out.println("listStr : " + listStr);
	}

	public ArrayList<ContentVO> getContentList() {
		return ContentList;
	}

	public void setContentList(ArrayList<ContentVO> contentList) {
		ContentList = contentList;
	}
	
	public String getContentSpace() {
		return contentSpace;
	}

	public void setContentSpace(String contentSpace) {
		this.contentSpace = contentSpace;
	}
	
	

}

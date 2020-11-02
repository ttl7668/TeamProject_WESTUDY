package com.project.product.vo;

import java.util.ArrayList;

public class MultiQnAVO {
	
	private ArrayList<QnAVO> qnAList;
	private String qnAlistStr="";

	//호찬쓰플릿
	private String qnASpace = "&&bhc_qna&&";
	
	

	public String getQnAListStr() {
		try {
//			listStr = ContentList.get(0).getContentImgBox() + getContentSpace() + ContentList.get(0).getContentTextBox() + getContentSpace() + 
//					ContentList.get(1).getContentImgBox() + getContentSpace() + ContentList.get(1).getContentTextBox() + getContentSpace() +
//					ContentList.get(2).getContentImgBox() + getContentSpace() + ContentList.get(2).getContentTextBox() + getContentSpace() +
//					ContentList.get(3).getContentImgBox() + getContentSpace() + ContentList.get(3).getContentTextBox() + getContentSpace() + 
//					ContentList.get(4).getContentImgBox() + getContentSpace() + ContentList.get(4).getContentTextBox() + getContentSpace() +
//					ContentList.get(5).getContentImgBox() + getContentSpace() + ContentList.get(5).getContentTextBox() + getContentSpace();
//			QnAlistStr = QnAList.get(0).getqBox() + getQnASpace() + QnAList.get(0).getaBox() + getQnASpace() + 
//					QnAList.get(1).getqBox() + getQnASpace() + QnAList.get(1).getaBox() + getQnASpace() + 
//					QnAList.get(2).getqBox() + getQnASpace() + QnAList.get(2).getaBox() + getQnASpace() + 
//					QnAList.get(3).getqBox() + getQnASpace() + QnAList.get(3).getaBox() + getQnASpace();
//			System.out.println("=========================================================================================");
//			System.out.println("QnAList.toString() : " + qnAList.toString());
			
			//합체!
			for(int i = 0; i < qnAList.size(); i++) {
				String str = qnAList.get(i).getQBox() + getQnASpace() + qnAList.get(i).getABox() + getQnASpace();
				qnAlistStr += str;
//				System.out.println("QnAList : " + qnAList.size());
//				System.out.println("QnAlistStr : " + qnAlistStr);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return qnAlistStr;
	}



	public ArrayList<QnAVO> getQnAList() {
		return qnAList;
	}



	public void setQnAList(ArrayList<QnAVO> qnAList) {
		this.qnAList = qnAList;
	}



	public String getQnASpace() {
		return qnASpace;
	}



	public void setQnASpace(String qnASpace) {
		this.qnASpace = qnASpace;
	}



	public MultiQnAVO(ArrayList<QnAVO> qnAList, String qnAlistStr, String qnASpace) {
		super();
		this.qnAList = qnAList;
		this.qnAlistStr = qnAlistStr;
		this.qnASpace = qnASpace;
	}



	public MultiQnAVO() {
		super();
	}
	
	

	
	

}

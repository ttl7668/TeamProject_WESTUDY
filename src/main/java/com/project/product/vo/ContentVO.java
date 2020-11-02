package com.project.product.vo;

public class ContentVO {
	
	private int pno;			//강좌번호
	private int cno;			//컨텐츠의 순서		//순서는 쓸모가 없어졋어요
	private String ContentImgBox;		//이곳에 최대 6개의 이미지 중 '하나'가 담겨요
	private String ContentTextBox;		//이곳에 최대 6개의 textArea중 '하나'가 담겨요
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getContentImgBox() {
		return ContentImgBox;
	}
	public void setContentImgBox(String contentImgBox) {
		ContentImgBox = contentImgBox;
	}
	public String getContentTextBox() {
		return ContentTextBox;
	}
	public void setContentTextBox(String contentTextBox) {
		ContentTextBox = contentTextBox;
	}
	public ContentVO(int pno, int cno, String contentImgBox, String contentTextBox) {
		super();
		this.pno = pno;
		this.cno = cno;
		ContentImgBox = contentImgBox;
		ContentTextBox = contentTextBox;
	}
	public ContentVO() {
		super();
	}
	
	
	
	
	
	
	
	

}

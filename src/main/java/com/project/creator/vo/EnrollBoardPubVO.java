package com.project.creator.vo;

import lombok.Data;

@Data
public class EnrollBoardPubVO {
	
	private int pno;
	private int eno;
	
	
	public EnrollBoardPubVO(int pno, int eno) {
		super();
		this.pno = pno;
		this.eno = eno;
	}
	
	

}

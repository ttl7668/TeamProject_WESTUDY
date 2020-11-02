package com.project.product.vo;

public class IntegratedContentVO {
	
	
	// serviceImpl에서 sqlSession의 메소드들 (insert, selectOne 등등)에 매개변수가 두개밖에 들어갈 수 없는데,
	// 첫번째 매개변수는 매퍼(sql문이 있는 곳)을 지정해줘야 하므로 사실상 우리가 정보를 담아 넘겨줄 수 있는 멤버변수는 하나 뿐이에요
	// 많은 정보들을 담기위해서 여러 VO들을 포함하는 통합 VO(IntegratedContentVO)를 만들어서 넘겨줄거에요
	
	
	private ProductVO productVO;
	private MultiContentVO multicontentVO;
	private MultiQnAVO multiqnaVO;
	
	
	
	
	
	
	public IntegratedContentVO() {
		super();
	}
	public IntegratedContentVO(ProductVO productVO, MultiContentVO multicontentVO, MultiQnAVO multiqnaVO) {
		super();
		this.productVO = productVO;
		this.multicontentVO = multicontentVO;
		this.multiqnaVO = multiqnaVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public MultiContentVO getMulticontentVO() {
		return multicontentVO;
	}
	public void setMulticontentVO(MultiContentVO multicontentVO) {
		this.multicontentVO = multicontentVO;
	}
	public MultiQnAVO getMultiqnaVO() {
		return multiqnaVO;
	}
	public void setMultiqnaVO(MultiQnAVO multiqnaVO) {
		this.multiqnaVO = multiqnaVO;
	}
	
	
	
	
	
	
	
	

}

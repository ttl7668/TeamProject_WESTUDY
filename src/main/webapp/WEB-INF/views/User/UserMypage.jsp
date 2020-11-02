<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userMypage.js"></script>

	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userMypage.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/utilProduct.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

</head>
<body>
<%@include file="../include/header.jsp" %>
    
<section>
    <div class="mypage-info">
        <div class="mypage-info-side">
            <div class="mypage-info-detail">
                <div class="mypage-img"><img src="../img/ic-unknown.png"></div><br>
                <span class="mypage-info-nickname">${sessionScope.userVO.name }</span><br>
                <span class="mypage-info-email">${sessionScope.userVO.email }</span>
            </div><hr>
            <div class="mypage-info-btns">
                <button type="button" class="point-btn" onclick="location.href='UserUpdate'">회원정보 수정하기</button><br>
            </div>
        </div>
        <div class="mypage-detail-side">
            <div>
                <h3>내가 수강한 클래스</h3><hr>
                <div class="mypage-view-myclass">
								
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        <%-- 
                        	<c:forEach var="item" items="${allProductlist }" varStatus="vs">
								<div class="class-view-minibox swiper-slide">
									<a href="${pageContext.request.contextPath}/Product/ProductDetail?product=${item.pno}">
										<div class="class-minibox-img">
											<img src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
										</div>
										<div class="class-minibox-info">
											<span class="class-minibox-cartegory">${item.category }</span><br />
											<span class="class-minobox-name">${item.title }</span><br />
											<hr />
											<span class="class-minibox-price">${item.price }</span><span>${item.term }</span>
										</div>
									</a>
								</div>
							</c:forEach>
                        	 --%>
                        
                        	<c:forEach var="item" items="${myPageProductList }" varStatus="vs">
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">${item.category }</span><br />
                                    <span class="class-minobox-name">${item.title }</span><br />
                                    <hr />
                                    <span class="class-minibox-price">${item.price }</span><span>${item.term }</span>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                            <div class="class-view-minibox swiper-slide">
                                <div class="class-minibox-img"><img src="../img/banner3.jpg" /></div>
                                <div class="class-minibox-info">
                                    <span class="class-minibox-cartegory">요리</span><br />
                                    <span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                                    <hr />
                                    <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                    
                </div>
            </div>
            
            <div>
                <h3>내가 작성한 후기</h3><hr>
            </div>
        </div>
    </div>
</section>

</body>
</html>
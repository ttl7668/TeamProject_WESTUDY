<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/utilProduct.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/detailProducts.css">

</head>

<body>

	<!-- <header>
        사이트 이름 뭐 넣냐~~~
    </header> -->

	<%@include file="../include/header.jsp"%>

	<!--이미지-->
	<div class="gallery-items">
		<div class="gallery-items-large"
			style="background-image:url(${pageContext.request.contextPath}/Display/productImgLoad?pno=${productVO.pno }&img=0)">
		</div>
		<div class="gallery-items-small"
			style="background-image:url(${pageContext.request.contextPath}/Display/productImgLoad?pno=${productVO.pno }&img=1)">
			<div class="gallery-item-box test1"
				style="background-image:url(${pageContext.request.contextPath}/Display/productImgLoad?pno=${productVO.pno }&img=2)">

			</div>
			<div class="gallery-item-box test2"
				style="background-image:url(${pageContext.request.contextPath}/Display/productImgLoad?pno=${productVO.pno }&img=3)">
			</div>
		</div>
	</div>





	<div class="item row">
		<div>
			<!--슬라이드 메뉴-->
			<div class="sticky-tab">
				<div>강의 소개</div>
				<div>강의 설명</div>
				<div>강좌 FAQ</div>
				<div>수강 후기</div>
			</div>
			<!--강의 본문-->
			<div class="item-content">
				<div class="item-content-introduce">
					<div class="content-title">
						<h2>강의 소개</h2>
						<hr>
					</div>
					<div class="item-content-info">
						<div>
							클래스 분량 <span>${productVO.term }주</span>
						</div>
						<div>
							수강 신청일 <span>2020.08.18(화)</span> ~ <span>2020.08.31(화)</span>
						</div>
						<div>
							자막포함여부 <span>포함</span>
						</div>
						<hr>
					</div>
					<div class="item-content-title">
						<div class="item-content-title-decorate">❝</div>
						<span></span>
					</div>
					<div class="item-content-class-name">${productVO.intro }</div>
					<div class="item-content-class-period">
						<div>
							<span class="info">수업기간</span><br>
							<span class="time"><b><span>${productVO.term }주</span></b></span>
						</div>
						<div>
							<span class="info">수업횟수</span><br>
							<span class="time"><b>${productVO.term * 2 }회</b></span>
						</div>
					</div>
				</div>
				<div class="item-content-curriculum">
					<span class="content-title">
						<h2>강의 설명</h2> <span>${productVO.intro }</span>
						<hr>
					</span>
					<div class="summary-space">
						<c:forEach var="item" begin="0" end="${contentImgList }"
							items="${contentTextList }" varStatus="vs">

							<div class="summary-img">
								<img
									src="${pageContext.request.contextPath}/Display/productImgLoad?pno=${productVO.pno }&img=${vs.index}">
							</div>
							<div class="summary-content">
								<span>${item }<!-- <br>짱짱~ --></span>
							</div>

						</c:forEach>
					</div>
				</div>

				<div class="item-content-package">
					<span class="content-title">
						<h2>강좌 FAQ</h2>
						<hr>
					</span>



					<div class="qna-box-space">

						<c:forEach var="i" items="${map }">
							<div class="qna-box">
								<div>
									<span class="qSpan">Q : ${i.key }</span><br>
								</div>
								<div>
									<span class="aSpan">A : ${i.value }</span>
								</div>
							</div>

						</c:forEach>


					</div>
				</div>
				<div class="item-content-postscript">
					<span class="content-title">
						<h2>수강후기</h2>
						<hr>
					</span>
					<div class="review-box-space">
						<div class="review-box">
							<span class="review-writer"><b>김첨지</b></span> <span
								class="review-star">★★★☆☆</span> <span class="review-content">빠르게
								집가다 설렁탕을 다 쏟았네요. 만족합니다^^</span>
						</div>
						<div class="review-box">
							<span class="review-writer"><b>박침대</b></span> <span
								class="review-star">★★★★☆</span> <span class="review-content">침대짱</span>
						</div>
						<a
							href="${pageContext.request.contextPath}/Review/ReviewBoard?pno=${productVO.pno}"><div
								class="review-board-link">리뷰 더 보기 >></div></a>

					</div>
				</div>

				<div class="item-content-suggest">

					<span class="content-title">
						<h2>같은 카테고리의 다른 강좌</h2>
						<hr>
					</span>
					<div class="content-suggest-space">
						<div class="swiper-container">
							<div class="swiper-wrapper">
							<%-- 
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
							 --%>
							
							
							<c:forEach var="item" items="${sameProductList}" varStatus="vs">
								<div class="class-view-minibox swiper-slide">
									<div class="class-minibox-img">
										<img src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
									</div>
									<div class="class-minibox-info">
										<span class="class-minibox-cartegory">${item.category }</span><br /> <span
											class="class-minobox-name">${item.title }</span><br />
										<hr />
										<span class="class-minibox-price">${item.price }원</span><br>
										<br>
										<c:if test="${item.term == 0 }">
                        					<span>${(item.term+1) * 2 }회</span>
                        				</c:if>
                        				<c:if test="${item.term != 0 }">
                        					<span>${(item.term) * 2 }회</span>
                        				</c:if>
									</div>
								</div>
							</c:forEach>
								
								
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- 강의 관리 -->
		<div class="info-item">
			<span class="info-class-cartrgory">${productVO.category }</span><br>
			<span class="info-class-name" id="productTitle">${productVO.title }</span><br>
			<span class="info-creator-name">${productVO.creator }</span>
			<hr>
			<span class="info-class-price" id="productPrice">${productVO.price }원</span>
			<hr>
			<div class="info-class-btns">
				<%-- <button type="button" class="info-class-apply-btn" id="charge" onclick="location.href='${pageContext.request.contextPath}/Product/ProductPayment?pno=${productVO.pno }'">클래스 신청하기</button> --%>


				<c:choose>
					<c:when test="${IsStudent == true}">
						<button type="button" class="info-class-apply-btn" id="classroom"
							onclick="location.href='${pageContext.request.contextPath}/Creator/EnrollBoard?pno=${productVO.pno }'">강의실
							가기</button>
					</c:when>

					<c:when test="${IsStudent == false || IsStudent == null}">
						<button type="button" class="info-class-apply-btn" id="charge">클래스
							신청하기</button>
					</c:when>
				</c:choose>
				
				
				
				<c:choose>
					<c:when test="${Interest == true }">
						<button type="button" class="info-class-apply-btn" id="unlike" >좋아요 <b style="color: red">&hearts;</b></button>
					</c:when>
					<c:when test="${Interest == false || Interest == null}">
						<button type="button" class="info-class-apply-btn" id="like" >좋아요 등록하기</button>
					</c:when>
				</c:choose>
				
				<button type="button" class="info-class-apply-btn">공유하기</button>
				 
				<!-- <button type="button" class="info-class-apply-btn">내 관심</button> <p style="color: red; font-size: 15px" >좋아요 등록하기 &hearts; <p> -->

				<!-- 
                <button type="button" class="info-class-apply-btn" id="charge">클래스 신청하기</button>
                <button type="button" class="info-class-apply-btn">공유하기</button>
                 -->
				<input type="hidden" name="pno" value="${productVO.pno }">
				<%-- sessionScope.userVO.uno = ${sessionScope.userVO.uno }<br>
            IsStudent = ${IsStudent }<br>
            productVO pno = ${productVO.pno }<br> --%>

			</div>
		</div>

		<%-- 
        <div class="info-item">
            <span class="info-class-cartrgory">${productVO.category }</span><br>
            <span class="info-class-name">${productVO.title }</span><br>
            <span class="info-creator-name">${productVO.creator }</span><hr>
            <span class="info-class-price">${productVO.price }</span>
            <span>추가금 100원</span><span>지하철 1300원</span>
            <span>왕복 2800원</span>
            <div>뭔가..있ㅇㅁ..</div>
            <div>뭐적지</div>
            <hr>
            <div class="info-class-btns">
                <button type="button" class="info-class-apply-btn" id="charge" onclick="location.href='${pageContext.request.contextPath}/Product/ProductPayment?pno=${productVO.pno }'">클래스 신청하기</button>
                <button type="button" class="info-class-apply-btn" id="charge">클래스 신청하기</button>
                <button type="button" class="info-class-apply-btn">공유하기</button>
                
                <input type="hidden" name="pno" value="${productVO.pno }">
            sessionScope.userVO.uno = ${sessionScope.userVO.uno }<br>
            IsStudent = ${IsStudent }<br>
            productVO pno = ${productVO.pno }<br>
             
            </div>
        </div>
         --%>

	</div>

	<script>
	
	
	
		
	
    	const user = {};
    	
    const userInit = function(){
    	var i =1;
    }
    
    
    $('document').ready(function(){
    	 let contentMenu = $(".sticky-tab").children("div");
    	    
    	   contentMenu.click(function(e) {
    	        let scrollPosition;
    	        if($(this).text() == "강의 소개"){
    	            scrollPosition = $(".item-content-introduce").offset().top;
    	        } else if ($(this).text() == "강의 설명"){
    	            scrollPosition = $(".item-content-curriculum").offset().top;
    	        }else if ($(this).text() == "강좌 FAQ"){
    	            scrollPosition = $(".item-content-package").offset().top;
    	        }else if ($(this).text() == "수강 후기"){
    	            scrollPosition = $(".item-content-postscript").offset().top;
    	        }
    	        $("html, body").animate({
    	            scrollTop: scrollPosition
    	        }, 500);
    	    })


    	    var swiper = new Swiper('.swiper-container', {
    	        spaceBetween: 0, //마진값
    	        slidesPerView: 4,
    	        loop: false,
    	        rebuildOnUpdate: true,
    	        direction: getDirection(),
    	        navigation: {
    	            nextEl: '.swiper-button-next',
    	            prevEl: '.swiper-button-prev',
    	        },
    	        on: {
    	            resize: function () {
    	                swiper.changeDirection(getDirection());
    	            },
    	        },
    	    });
    	    
    	    function getDirection() {
    	        var windowWidth = window.innerWidth;
    	        var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
    	    
    	        return direction;
    	    }
    	$('#like').click(function() {
    		const sessionUser = '${sessionScope.userVO==null}';
    		
    	        /* alert('로그인이 필요한 서비스입니다');
    	        console.log('${sessionScope.userVO}');
    	        location.href="${pageContext.request.contextPath}/User/UserLogin"; */
    	    
    	    	if(confirm('좋아요 등록 하시겠습니까?')){
    	    		location.href="${pageContext.request.contextPath}/Product/CreateInterest?pno=" + '${productVO.pno }';	
    	    	} else {
    	    		return;
    	    	}
    	    
    	    
    	})
    	
    	$('#unlike').click(function() {
    		
    	    	if(confirm('좋아요 취소 하시겠습니까?')){
        			location.href="${pageContext.request.contextPath}/Product/DeleteInterest?pno=" + '${productVO.pno }';
        		} else {
        			return;
        		}
    	    
    		
    	})
    	
    	
    	
    	
    	
    //출처 : https://1-7171771.tistory.com/83
    $('#charge').click(function () {
    	
       if(${sessionScope.userVO==null}){
          alert('로그인이 필요한 서비스입니다');
          console.log('${sessionScope.userVO}');
          location.href="${pageContext.request.contextPath}/User/UserLogin";
       }
       
       
        // getter
        var amount = 0;
        console.log(window.IMP);
        //var IMP = window.IMP;
        IMP.init('imp82888509');
        var money = $('input[name="cp_item"]:checked').val();

        IMP.request_pay({
            pg: 'inicis',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: $('#productTitle').html(),
            amount: $('#productPrice').html().slice(0,-1),
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                let pno = $("")
                 var msg = '결제가 완료되었습니다.';
                 amount = rsp.paid_amount;
                 $.ajax({
                     type: "GET", 
                     url: "${pageContext.request.contextPath}/Product/PaymentProcedure?amount="+amount+"&cardGrantNum="+rsp.apply_num+"&pno="+'${productVO.pno }', //충전 금액값을 보낼 url 설정
                     data: {
                         "amount" : money,
                         "cardGrantNum" : rsp.apply_num
                     },
                 });
                 
             } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                /* document.location.href=history.go(-1); */
            }
            alert(msg);
            document.location.href="${pageContext.request.contextPath}/Product/ProductDetail?product="+'${productVO.pno }';
        });
    });
       
    })
    
   </script>

</body>

</html>
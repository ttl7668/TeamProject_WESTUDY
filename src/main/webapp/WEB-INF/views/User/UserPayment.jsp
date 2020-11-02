<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userPayment.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
    <section>
            <div class="container-P">
                <div class="Payrow">					
                    <div class="Pay-Container">
                        <div class="Pay-Header">
                            <h3 class="Pay-Text">결제하기</h3>
                        </div>
                        <div class="Pay-Form-Container">
                            <form action="PayForm" method="post" name="regForm">
                                <div>
                                    <h4 class="Pay-Title">주문 정보</h4>
                                    <span>드로잉 온라인 수강권(20주)</span>
                                    <div>
                                        <img>클래스이미지
                                    </div>
                                    <hr>
                                </div>
                                <div>
                                    <h4 class="Pay-Title">주문자 정보</h4>
                                        <div class="Styled-Form-Group">
                                            <label class="Label-Name">신청하시는분</label> 
                                                <input type="text" class="Styled-Input-Field-Text" name="" id="name"
                                                    placeholder="홍길동">
                                                    <h6 class="msgt">
                                                        <svg id="svgName"width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
                                                        <span id="msgName">필수 입력입니다.</span>
                                                    </h6>
                                        </div>
                                        <div class="Styled-Form-Group">
                                            <label class="Label-Name">휴대폰 번호</label> 
                                                <input type="text" class="Styled-Input-Field-Text" name="" id="phone"
                                                    placeholder="01031352401">
                                                    <h6 class="msgt">
                                                        <svg id="svgPhone"width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
                                                        <span id="msgPhone">휴대폰 번호를 입력해주세요.</span>
                                                    </h6>
                                        </div>
                                    <hr>
                                </div>
                                <div>
                                    <h4 class="Pay-Title">결제 금액</h4>
                                    <span style="font-weight: bold;">264,000원</span>
                                    <hr>
                                </div>
                                <div>
                                    <h4 class="Pay-Title">결제 방식</h4>
                                        <button class="module" type="button" id="IcBtn1">
                                            <img src="../img/ic-card-black.png" alt class="Icpay">
                                            <div class="Card-Text">카드 결제</div>
                                            <img src="../img/ic-check-black.png" alt id="Ic-Check1">
                                        </button>
                                        <button class="module" type="button" id="IcBtn2">
                                            <img src="../img/ic-bank-black.png" alt class="Icpay">
                                            <div class="Card-Text">무통장 입금</div>
                                            <img src="../img/ic-check-black.png" alt id="Ic-Check2">
                                        </button>
                                 <div>
                                    <hr>
                                        <button class="btn" type="button" id="PaymentBtn"><span class="Button-Text">결제하기</span></button>
                                    </div>
                                </div>
                            </form>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>
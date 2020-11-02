<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/userUpdate.js?ver=5"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stayle.css">
	
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="Update-Container">
					<div class="Update-Form-Container">
						<h1>정보수정</h1>

						<form action="UpdateForm" name="UpdateForm" method="post">
							<div class="Styled-Form-Group" id="divId">
								<label class="Label-Name">이름</label> <input type="text"
									class="Styled-Input-Field-Text" name="name" id="name"
									value="${UserVO.name }" placeholder="홍길동">
								<h6 class="msgt">
									<svg id="svgName" width="16" height="16" fill="none"
										viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"
											fill="rgb(255, 82, 82)"></path></svg>
									<span id="msgName"></span>
								</h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">이메일</label> <input type="text"
									class="Styled-Input-Field-Text" name="email" id="email"
									value="${UserVO.email }" placeholder="example@naver.com"
									style="background-color: ghostwhite;" readonly>
								<h6 class="msgt">
									<svg id="svgEmail" width="16" height="16" fill="none"
										viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"
											fill="rgb(255, 82, 82)"></path></svg>
									<span id="msgEmail"></span>
								</h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">휴대폰번호</label> <input
									class="Styled-Input-Field-Text" placeholder="-제외하고 입력하세요."
									name="phone" id="phone" value="${UserVO.phone }">
								<h6 class="msgt">
									<svg id="svgPhone" width="16" height="16" fill="none"
										viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"
											fill="rgb(255, 82, 82)"></path></svg>
									<span id="msgPhone"></span>
								</h6>
							</div>

							<div class="Styled-Form-Group">
								<label class="Label-Name">비밀번호(8자이상)</label> <input
									type="password" class="Styled-Input-Field-Text" name="pw"
									id="pw" placeholder="********">
								<h6 id="msgt">
									<svg id="svgPw" width="16" height="16" fill="none"
										viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"
											fill="rgb(255, 82, 82)"></path></svg>
									<span id="msgPw"></span>
								</h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">비밀번호 확인</label> <input type="password"
									class="Styled-Input-Field-Text" name="pw-confrim"
									id="pw-confrim" placeholder="********">
								<h6 class="msgt">
									<svg id="svgPwC" width="16" height="16" fill="none"
										viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z"
											fill="rgb(255, 82, 82)"></path></svg>
									<span id="msgPwC"></span>
								</h6>
							</div>

							<div class="Styled-Form-Group">
								<label class="addr-num">주소</label>
								<div class="Input-Field">
									<input type="text" class="addr" name="postalCode"
										id="postalCode" value="${UserVO.postalCode }"
										placeholder="우편번호" readonly>
									<button type="button" class="btn logBtn add-Btn"
										onclick="goPopup()">주소찾기</button>
								</div>
							</div>

							<div class="Styled-Form-Group">
								<input type="text" class="Styled-Input-Field-Text"
									name="address1" id="address1" value="${UserVO.address1}"
									placeholder="기본주소">
							</div>
							<div class="Styled-Form-Group">
								<input type="text" class="Styled-Input-Field-Text"
									name="address2" id="address2" value="${UserVO.address2 }"
									placeholder="상세주소">
							</div>

							<div class="update-Form">
								<button type="button" class="btn log-Btn" id="UpdateBtn">
									<span class="Button-Text">수정하기 </span>
								</button>
							</div>
							<div class="sign-Out-Form">
								<button type="button" class="btn log-Btn sign-Out-Btn"
									id="deleteBtn">
									<span class="Button-Text">회원탈퇴</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div>
			<form action="UserDelete" id="deleteForm" method="post">
				<label class="Label-Name">비밀번호 확인</label> 
					<input type="hidden"
					class="Styled-Input-Field-Text" name="email" id="emailC" value="${sessionScope.email }">
					<input type="password"
					class="Styled-Input-Field-Text" name="pw" id="pwC" >
				<button type="button" id="pwCheckBtn">비밀번호확인</button>
			</form>
		</div>
	</div>


	<script>

		/*js파일로 넣으면 실행안됨*/
		$(document).ready(function() {

			(function() {
				var msg = "${msg}";
				if (msg != '') {
					alert(msg);
				}
			})();
			
		})

		/*주소팝업창*///TODO: 수정하기...
		function goPopup() {
			let pop = window
					.open(
							"${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp",
							"pop",
							"width=570,height=420, scrollbars=yes, resizable=yes");
		}
		function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
			//팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

			document.getElementById("postalCode").value = postalCode;
			document.getElementById("address1").value = address1;
			document.getElementById("address2").value = address2;
		}


	</script>
</body>
</html>
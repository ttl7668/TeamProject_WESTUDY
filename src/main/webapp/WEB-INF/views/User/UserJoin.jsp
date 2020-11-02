<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/userJoin.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle.css?ver=1">

</head>
<body>
    <section>
		<div class="container">
			<div class="row">					
				<div class="Join-Container">

					<div class="Join-Form-Container">
						<h1>회원가입</h1>

						<form action="JoinForm" name="JoinForm" method="post" >
							<div class="Styled-Form-Group" id="divId">
								<label class="Label-Name">이름</label> 
									<input type="text" class="Styled-Input-Field-Text" name="name" id="name" value="${k_name }"
										placeholder="홍길동">
										<h6 class="msgt">
											<svg id="svgName" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
											<span id="msgName"></span>
										</h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">이메일</label> 
								<div class="Input-Field">
									<input type="text" class="addr" name="email" id="email" value="${k_email }"
										placeholder="example@naver.com"><button type="button" class="btn logBtn add-Btn" id="emailCheckBtn">아이디중복체크</button>
								</div>
									<h6 class="msgt">
										<svg id="svgEmail" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
										<span id="msgEmail"></span>
									</h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">휴대폰번호</label> 
								<input class="Styled-Input-Field-Text" placeholder="-제외하고 입력하세요." name="phone" id="phone">
									<h6 class="msgt">
										<svg id="svgPhone"width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
										<span id="msgPhone"></span>
                                    </h6>
							</div>
							
							<div class="Styled-Form-Group">
								<label class="Label-Name">비밀번호(8자이상)</label> 
								<input type="password" class="Styled-Input-Field-Text" name="pw" id="pw"
									placeholder="********">
									<h6 id="msgt">
										<svg id="svgPw" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
										<span id="msgPw"></span>
                                    </h6>
							</div>
							<div class="Styled-Form-Group">
								<label class="Label-Name">비밀번호 확인</label> 
								<input type="password" class="Styled-Input-Field-Text" name="pw-confrim"
									id="pw-confrim" placeholder="********">
									<h6 class="msgt">
										<svg id="svgPwC" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
                                        <span id="msgPwC"></span>
                                    </h6>
							</div>
						
							<div class="Styled-Form-Group">
								<label class="addr-num">주소</label> 
								<div class="Input-Field">
									<input type="text" class="addr" name="postalCode" id="postalCode"
										placeholder="우편번호" style="background-color:ghostwhite;" readonly><button type="button" class="btn logBtn add-Btn" onclick="goPopup()">주소찾기</button>
								</div>
							</div>

							<div class="Styled-Form-Group">
								 <input type="text" class="Styled-Input-Field-Text" name="address1" id="address1"
									placeholder="기본주소">
							</div>
							<div class="Styled-Form-Group">
								<input type="text" class="Styled-Input-Field-Text" name="address2" id="address2" placeholder="상세주소">
							</div>
						
							<button type="button" class="btn" id="joinFormBtn"><span class="Button-Text">회원가입하기</span></button>
							
							<input type="hidden" name="joinType" value="${joinType }">
						</form>
						<hr>
						<div>
							<!--카카오로그인 버튼-->
							<button type="button" class="btn kakaobtn"><a id="custom-login-btn" href="javascript:loginWithKakao()" >
								<span class="Button-Text"><svg style="display: inline-block;" width="24" height="24" viewBox="0 0 24 24"><path fill="#1b1c1d" fill-rule="evenodd" d="M12 4c-4.97 0-9 3.185-9 7.115 0 2.557 1.707 4.8 4.27 6.054-.188.702-.682 2.545-.78 2.94-.123.49.178.483.376.351.155-.103 2.466-1.675 3.464-2.353.541.08 1.1.123 1.67.123 4.97 0 9-3.186 9-7.115C21 7.185 16.97 4 12 4"></path></svg>카카오로 시작하기</span></a>
							</button>
							<!-- <a id="custom-login-btn" href="javascript:loginWithKakao()" > <img
								src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
								width="100%" />
							</a> -->
						</div>
					</div>		


				</div>
			</div>
		</div>
	</section>
	
	
	
	<script>
    /*주소팝업창*/ //TODO: 수정하기...
   function goPopup(){
	let pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
		//팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
		document.getElementById("postalCode").value = zipNo;
		document.getElementById("address1").value=roadAddrPart1;
		document.getElementById("address2").value=addrDetail;
	}

	
	//1.카카오 초기화
    Kakao.init('21dacd05a4f6f56d008ee3ba02ad3564');//키등록
    console.log(Kakao.isInitialized());

    function loginWithKakao() {
         Kakao.Auth.login({
          success: function(authObj) {
            getInfo();//2.사용자 정보요청 함수 호출
            },
        fail: function(err) {
            alert(JSON.stringify(err))
            }, 
        })
    }
    //3.사용자 정보 얻기
    function getInfo(){
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                console.log(res);
                //다음 코드로 id 추출
                //아이디
                var k_id = res.id;
                //이메일
                var k_email = res.kakao_account.email;
                //이름
                var k_name = res.kakao_account.profile.nickname;
                //프로필사진
                var k_profile_img=res.kakao_account.profile.profile_image_url;

                console.log(k_id,k_email,k_name,k_profile_img);

                //폼요청 url변경
                console.log("k_email : " + res.kakao_account.email);
                console.log("k_name : " + k_name);
                
                location.href = "${pageContext.request.contextPath}/User/KakaoLogin?email=" + res.kakao_account.email + "&name=" + k_name;
                
                document.LoginForm.action = "/project/User/KakaoLogin?email=" + res.kakao_account.email + "&name=" + k_name;
                //폼 id의 value값 변경 
                //document.LoginForm.id.value=id;
                
                //document.LoginForm.name.value=name;
                
                sessionStorage.setItem('k_name',k_name);
                
                console.log(sessionStorage.getItem('k_name'));

                document.LoginForm.email.value=k_email;
                                
                document.LoginForm.hiddenInput.value=k_name;
                document.LoginForm.submit();//서브밋
                
            },
            fail: function(error) {
            alert("사용자 요청 정보에 실패했습니다. 동의 항목을 확인")
            },
        })
    }

    //4.로그아웃 
    function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
        alert('Not logged in.')
        return
        }
        Kakao.Auth.logout(function() {
        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
        })
    }
	</script>

	

</body>
</html>
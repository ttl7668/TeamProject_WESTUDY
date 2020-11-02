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
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/userLogin.js?ver=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle.css">


</head>
<body>
    <section>
		<div class="containerL">
			<div class="Loginrow">				
                <div class="Form-Container">

                    <div class="Login-Form-Container">
                            <div class="Login-Form-Top">
                                <h2 class="Login-Title-Text">로그인</h2></div>
    
                        <form action="LoginForm" name="LoginForm" method="post">
                            <div class="Styled-Form-Group">
                                <label class="Label-Name">이메일</label> 
                                <div class="Styled-Input-Field">
                                    <input type="email" name="email" id="email"
                                    class="Styled-Input-Field-Text" placeholder="example@naver.com">
                                    <h6 class="msgt">
                                        <svg id="svgEmail" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
                                        <span id="msgEmail"></span>
                                    </h6>
                                </div>
                            </div>
    
                            <div class="Styled-Form-Group">
                                <label class="Label-Name">비밀번호</label> 
                                <div class="Styled-Input-Field">
                                    <input type="password" class="Styled-Input-Field-Text" name="pw" id="pw" placeholder="********">
                                    <h6 class="msgt">
                                        <svg id="svgPw" width="16" height="16" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.872 19.51A1 1 0 0121 21H3a1 1 0 01-.872-1.49l9-16a1 1 0 011.744 0l9 16zM13 15V9h-2v6h2zm0 3v-2h-2v2h2z" fill="rgb(255, 82, 82)"></path></svg>
                                        <span id="msgPw"></span>
                                    </h6>
                                </div>
                            </div>
                            <div class="button-Wrap">
                                <a class="reset-Pw-Button" id="findPwBtn">비밀번호를 잊으셨나요?</a>
                                <a class="join-Button" href="UserJoin">회원가입하기</a>
    
                            </div>
                           
                            <button type="button" class="btn log-Btn" onclick="LoginBtn()">
                                <span class="Button-Text">로그인</span>
                            </button>
                        </form>
                        <hr>
    
                        <div>
                            
                            <!--카카오로그인 버튼-->
							<button type="button" class="btn kakaobtn"><a id="custom-login-btn" href="javascript:loginWithKakao()" >
								<span class="Button-Text"><svg style="display: inline-block;" width="24" height="24" viewBox="0 0 24 24"><path fill="#1b1c1d" fill-rule="evenodd" d="M12 4c-4.97 0-9 3.185-9 7.115 0 2.557 1.707 4.8 4.27 6.054-.188.702-.682 2.545-.78 2.94-.123.49.178.483.376.351.155-.103 2.466-1.675 3.464-2.353.541.08 1.1.123 1.67.123 4.97 0 9-3.186 9-7.115C21 7.185 16.97 4 12 4"></path></svg>카카오로 시작하기</span></a>
							</button>
                        </div>	
                    </div>    
                </div>     
                <div class="Login-Form-Background"><img src="../img/login-bg.png" style="width:100%;"></div>
            </div>
			
	    </div>


	</section>
    
    <script>
    	
    	function LoginBtn(){
    		
    	if(document.LoginForm.email.value == ''){
    		document.LoginForm.email.focus();
    		alert('이메일을 입력하세요');
    		return;
    	} else if(document.LoginForm.pw.value == ''){
    		document.LoginForm.pw.focus();
    		alert('비밀번호를 입력하세요');
    		return;
    	}
    	}
    
       $(document).ready(function() {
        
        (function() {
           var msg = "${msg}";
           if(msg!='') {
              alert(msg);
           }
        })();
        
       	$(function(){
        	$("#findPwBtn").click(function(){
        			location.href="UserModifyPw";
        		})
        	})
    
        
     })   
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
                //폼 id의 value값 변경 
                //document.LoginForm.id.value=id;
                
                //document.LoginForm.name.value=name;
                
                /* sessionStorage.setItem('k_name',k_name);
                
                console.log(sessionStorage.getItem('k_name'));

                document.LoginForm.email.value=k_email;
                                
                document.LoginForm.hiddenInput.value=k_name;
                document.LoginForm.submit();//서브밋 */
                
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
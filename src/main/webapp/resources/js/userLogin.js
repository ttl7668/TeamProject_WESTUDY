$("document").ready(function(){
	
	 $("#email").focusout(function(){
         if($("#email").val()==''){
             $("#email").css("borderColor","red")
             $("#svgEmail").css("display","inline-block")
             $("#msgEmail").text("이메일을 입력하세요.")
             $("#msgEmail").css("color","red")
         }else{
             $("#svgEmail").css("display","none")
             $("#msgEmail").text("");
             $("#email").css("border-color","rgb(221, 224, 226)")
          
         }
	 })
         
         $("#pw").focusout(function(){
             if($("#pw").val()==''){
                 $("#pw").css("borderColor","red")
                 $("#svgPw").css("display","inline-block")
                 $("#msgPw").text("비밀번호를 입력하세요.")
                 $("#msgPw").css("color","red")
             }else{
                 $("#svgPw").css("display","none")
                 $("#msgPw").text("");
                 $("#pw").css("border-color","rgb(221, 224, 226)")
             }
         })
         
    //로그인폼 전체체크
    $(".log-Btn").click(function(){
        if($("#msgEmail").text()!=""){
            alert("이메일을 다시 확인하세요.")
            $("#email").focus();
            return;
        }else if($("#msgPw").text()!=""){
            alert("비밀번호를 다시 확인하세요.")
            $("#pw").focus();
            return;
        }else{
            document.LoginForm.submit();
            }
    })


 /* //1.카카오 초기화
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
    }*/
})

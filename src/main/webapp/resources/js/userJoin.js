$("document").ready(function(){
        
        ///////////////////////폼 양식 체크하는 부분////////////////////////
        var getName= RegExp(/^[가-힣]+$/);//이름 형식
        var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);//이메일 형식검사
        var getPhone = RegExp(/^01([0|1|6|7|8|9]?)([0-9]{4})([0-9]{4})$/);//핸드폰번호 형식
            $("#name").focusout(function(){
                if($("#name").val()==''){
                    $("#name").css("borderColor","red")
                    $("#svgName").css("display","inline-block")
                    $("#msgName").text("이름을 입력하세요.")
                    $("#msgName").css("color","red")
                }else if(!getName.test($("#name").val())){
                    $("#name").css("borderColor","red")
                    $("#svgName").css("display","inline-block")
                    $("#msgName").text("올바른 이름이 아닙니다.")
                    $("#msgName").css("color","red")
                }else{
                    $("#svgName").css("display","none")
                    $("#msgName").text("");
                    $("#name").css("border-color","rgb(221, 224, 226)");
                }
            })
  
            $("#email").focusout(function(){
                if($("#email").val()==''){
                    $("#email").css("borderColor","red")
                    $("#svgEmail").css("display","inline-block")
                    $("#msgEmail").text("이메일을 입력하세요.")
                    $("#msgEmail").css("color","red")
                }else if(!getMail.test($("#email").val())){
                    $("#email").css("borderColor","red")
                    $("#svgEmail").css("display","inline-block")
                    $("#msgEmail").text("올바른 이메일이 아닙니다.")
                    $("#msgEmail").css("color","red")
                }else if(getMail.test($("#email").val())){
                	$("#email").css("borderColor","red")
                    $("#svgEmail").css("display","inline-block")
                    $("#msgEmail").text("이메일은 중복체크 필수입니다.");
                    $("#msgEmail").css("color","red")
                 
                }
            })
            $("#phone").focusout(function(){
                if($("#phone").val()==''){
                    $("#phone").css("borderColor","red")
                    $("#svgPhone").css("display","inline-block")
                    $("#msgPhone").text("휴대폰번호를 입력하세요.")
                    $("#msgPhone").css("color","red")
                }else if(!getPhone.test($("#phone").val())){
                    $("#phone").css("borderColor","red")
                    $("#svgPhone").css("display","inline-block")
                    $("#msgPhone").text("올바른 휴대폰번호가 아닙니다.")
                    $("#msgPhone").css("color","red")
                }else{
                    $("#svgPhone").css("display","none")
                    $("#msgPhone").text("")
                    $("#phone").css("border-color","rgb(221, 224, 226)")
                }
            })
            $("#pw").focusout(function(){
                if($("#pw").val()==''){
                    $("#pw").css("borderColor","red")
                    $("#svgPw").css("display","inline-block")
                    $("#msgPw").text("비밀번호를 입력하세요.")
                    $("#msgPw").css("color","red")
                }else if($("#pw").val().length<8){
                    $("#pw").css("borderColor","red")
                    $("#svgPw").css("display","inline-block")
                    $("#msgPw").text("비밀번호는 8자 이상입니다.")
                    $("#msgPw").css("color","red")
                }else{
                    $("#svgPw").css("display","none")
                    $("#msgPw").text("");
                    $("#pw").css("border-color","rgb(221, 224, 226)")
                }
            })

            $("#pw-confrim").focusout(function(){
                if($("#pw-confrim").val()==''){
                    $("#pw-confrim").css("borderColor","red")
                    $("#svgPwC").css("display","inline-block")
                    $("#msgPwC").text("비밀번호를 다시 입력하세요.")
                    $("#msgPwC").css("color","red")
                }else if(($("#pw-confrim").val())!=($("#pw").val())){
                    $("#svgPwC").css("display","inline-block")
                    $("#msgPwC").text("비밀번호를 다시 확인해주세요.")
                    $("#msgPwC").css("color","red")
                }else {
                    $("#svgPwC").css("display","none")
                    $("#msgPwC").text("비밀번호가 일치합니다.");
                    $("#msgPwC").css("color","black")
                    $("#pw-confrim").css("border-color","rgb(221, 224, 226)")
                }
            })
            ///////////////////////이메일중복체크////////////////////////
            $("#emailCheckBtn").click(function(){
            	var email = $("#email").val();
            	$.ajax({
            		type:"POST",
            		url:"emailCheck",
            		data:JSON.stringify({"email":email}),
            		contentType:"application/json; charset=utf-8",
            		success:function(data){
            			console.log(data)
            			if(data==1){//있는 아이디
            				alert("중복된 이메일입니다.")

            			}else{
            				alert("사용가능한 이메일입니다")
            				$("#svgEmail").css("display","none")
                            $("#msgEmail").text("");
                            $("#email").css("border-color","rgb(221, 224, 226)");
            				
            			}
            		},
            		error:function(status,error){
            			
            		}
            	})
            })
            
            ///////////////////가입폼 전체 체크 해주세요//////////////////////////
            $("#joinFormBtn").click(function(){
            	//가입하기 누르고 전체 체크되게 다시 수정...
                     if($("#msgName").text()!==""){
                        alert("이름을 다시 확인하세요.")
                        $("#name").focus();
                        return;
                    }else if($("#msgEmail").text()!=""){
                        alert("이메일을 다시 확인하세요.")
                        $("#email").focus();
                        return;
                    }else if($("#msgPhone").text()!=""){
                        alert("휴대폰번호를 다시 확인하세요.")
                        $("#phone").focus();
                        return;
                    }else if($("#msgPw").text()!=""){
                        alert("비밀번호를 입력하세요.")
                        $("#pw").focus();
                        return;
                    }else if($("msgPwC").text()!=""){
                        alert("비밀번호를 다시 입력하세요.")
                        $("#pw-confrim").focus();
                        return;
                    }else{
                        alert("가입하시겟습니까??????")
                        document.JoinForm.submit();

                    }

                })  
                
                /*주소팝업창*/
 /*               function goPopup(){
            	let pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
            	}
            	
            	function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
            		//팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            		
            		document.getElementById("addrZipNum").value = zipNo;
            		document.getElementById("addrBasic").value=roadAddrPart1;
            		document.getElementById("addrDetail").value=addrDetail;
            	}*/
            
        /*    
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
       
        
        
    


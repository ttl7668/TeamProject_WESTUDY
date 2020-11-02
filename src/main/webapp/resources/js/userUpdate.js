$("document").ready(function(){
  
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
         
  

       /*나중에 수정해야쥐이이이이이*/
       ////////수정하기버튼/////////
       $("#UpdateBtn").click(function(){
         if($("#msgName").text()!=""){
               alert("수정할 이름을 다시 확인하세요.")
               $("#name").focus();
               return;
         }else if($("#msgEmail").text()!=""){
                alert("수정할 이메일을 다시 확인하세요.")
                $("#email").focus();
                return;
            }else if($("#msgPhone").text()!=""){
                alert("수정할 휴대폰번호를 다시 확인하세요.")
                $("#phone").focus();
                return;
            }else if($("#msgPw").text()!=""){
                alert("수정할 비밀번호를 입력하세요.")
                $("#pw").focus();
                return;
            }else if($("msgPwC").text()!=""){
                alert("수정할 비밀번호를 다시 입력하세요.")
                $("#pw-confrim").focus();
                return;
            }else{
                document.UpdateForm.submit();
            }
          
        }) 
        //비번일치 버튼
        $("#pwCheckBtn").click(function(){
           var pwC = $("#pwC").val();
           var emailC = $("#emailC").val();
           $.ajax({
              url: "pwCheck",
              type:"POST",
              data:JSON.stringify(({"pw":pwC}),({"email":emailC})),
              contentType:"application/json; charset=utf-8",
              success:function(data){
                 console.log(pwC)
                 console.log(data)
                 if(data==0){
                    alert("비밀번호가 틀렸습니다.")

                 }else{
                    //alert("비밀번호가 일치.")
                    if(confirm("탈퇴하시겠습니까?")){
                   $("#deleteForm").submit();
                    }
                    }
              },
              error:function(status,error){
                 
              }
        })
        })
        
        //모달창확인용 todo:제이쿼리로 바꾸기
          
          function onClick() {
              document.querySelector('.modal_wrap').style.display ='block';
              document.querySelector('.black_bg').style.display ='block';
          }   
          function offClick() {
              document.querySelector('.modal_wrap').style.display ='none';
              document.querySelector('.black_bg').style.display ='none';
          }
       
          document.getElementById('deleteBtn').addEventListener('click', onClick);
          document.querySelector('.modal_close').addEventListener('click', offClick);
       

          
    
})



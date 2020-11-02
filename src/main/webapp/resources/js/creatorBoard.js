


$(document).ready(function(){
   
   
   
   $(document).on('click','#lecture-summary-img1',function(){
      console.log('111');
      let contentImgInput1 = $("#ContentImgInput1");
      contentImgInput1.click();
   })
   
   $("#ContentImgInput1").change(function(){
      imgSet1(this);
   })
   
   
   $(document).on('click','#lecture-summary-img2',function(){
      console.log('222');
      let contentImgInput2 = $("#ContentImgInput2");
      contentImgInput2.click();
   })
   
   $("#ContentImgInput2").change(function(){
      imgSet1(this);
   })
   
   
   $(document).on('click','#lecture-summary-img3',function(){
      console.log('333');
      let contentImgInput3 = $("#ContentImgInput3");
      contentImgInput3.click();
   })
   
   $("#ContentImgInput3").change(function(){
      imgSet1(this);
   })
   
   
   $(document).on('click','#lecture-summary-img4',function(){
      console.log('444');
      let contentImgInput4 = $("#ContentImgInput4");
      contentImgInput4.click();
   })
   
   $("#ContentImgInput4").change(function(){
      imgSet1(this);
   })
   
   
   $(document).on('click','#lecture-summary-img5',function(){
      console.log('555');
      let contentImgInput5 = $("#ContentImgInput5");
      contentImgInput5.click();
   })
   
   $("#ContentImgInput5").change(function(){
      imgSet1(this);
   })
//   $(document).on('change','#ContentImgInput1',function(){
//      imgSet1(this)
//   })
   
   
//   $("#ContentImgInput1").change(function() {
//      imgSet1(this); //this는 #file자신 태그를 의미
//   });

   //섬네일 클릭시 파일 업로드 뜨게함
   let lectureInfoImg =  $(".lecture-info-img-input")
   $(".lecture-thumbnail-img").click(function(){
      lectureInfoImg.click();
   })

   lectureInfoImg.change(function(){
      const img = lectureInfoImg
      uploadImgPreview(img)

   })
   
   
   let contentImgInput = $("#ContentImgInput0")
   $("#lecture-summary-img0").click(function(){
      console.log("000")
      contentImgInput.click();
   })
   
   
   let contentImgInput1 = $("#ContentImgInput1")
   $("#lecture-summary-img1").click(function(){
      console.log("111")
      contentImgInput1.click();
   })
   
   
   //자바 스크립트 파일 미리보기 기능
   function imgSet0(input) {
      
      console.log("readURL");
      

      console.log("123213123")
      console.log(input[0])
      console.log(input.files)
      console.log(input.files[0])

      if (input.files && input.files[0]) {
         
         console.log("input.files && input.files[0]");

         var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
         //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
         reader.readAsDataURL(input.files[0]); 
         //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
         $(".fileDiv").css("display", "block");

         reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            $('#ContentImg0').attr("src", event.target.result); 
            $('#ContentImg0').css("width","263px");
            $('#ContentImg0').css("height","467px");
//            $('#bi-image-fill').css("display","none");
//            $('#guid').css("display","none");
            console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
         }
      }
   }
   $("#ContentImgInput0").change(function() {
      imgSet0(this); //this는 #file자신 태그를 의미
   });
   
   



   //자바 스크립트 파일 미리보기 기능
   function readURL(input) {
      
      console.log("readURL");

      if (input.files && input.files[0]) {
         
         console.log("input.files && input.files[0]");

         var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
         //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
         reader.readAsDataURL(input.files[0]); 
         //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
         $(".fileDiv").css("display", "block");

         reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            $('#thumbnail-img').attr("src", event.target.result); 
            $('#preview-img').attr("src", event.target.result);
            $('#thumbnail-img').css("width","180px");
            $('#thumbnail-img').css("height","135px");
            $('#bi-image-fill').css("display","none");
            $('#guid').css("display","none");
            console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
         }
      }
   }
   $("#thumbFile").change(function() {
      readURL(this); //this는 #file자신 태그를 의미
   });




   // $(".lecture-cover-img").click(function(){
   //     $(".lecture-cover-img-input").click();
   // })

   let qnaBoxNum = 1;
   let contentBoxNum = 1;

   //qna버튼 추가
   $("#qnaAddBtn").click(function(){
      if($('.qna-box-space').children().length > 4){
         alert('질문은 4개까지만 추가 가능합니다');
         return;
      }
      const qnabox = createQNA(qnaBoxNum);
      qnabox.insertBefore($(event.target).parent());
      qnaBoxNum++;
      // $('.qna-box-space').append(qnabox);
   })

   //소개버튼 추가
   $("#summatyAddBtn").click(function(){
      if($('.summary-box-space').children().length > 6){
         alert('소개글은 6개까지만 추가 가능합니다');
         return;
      }
      const summaryBox = createSummary(contentBoxNum);
      summaryBox.insertBefore($(event.target).parent());
      if($('.summary-box-space').children().length > 7){
         $(event.target).remove('.add-write-button');

      }
      contentBoxNum++;
      // $('.summary-box-space').append(summaryBox)
   })

})

function createSummary(num){
   const summaryBox = $('<div>').attr('class', 'lecture-summary');
   const imgArea = $("<div>").attr({'class': 'lecture-summary-img', 'id':'lecture-summary-img' + num})
   const imgBox = $("<img>").attr({'id':'ContentImg' + num});
   const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'ContentList[' + num + '].ContentTextBox'});


   imgArea.append(imgBox)

   summaryBox.append(imgArea)
   //.append($('<input>').attr({'type': 'file', 'style':'display:none', 'name': 'ContentImg', 'id':'ContentImgInput' + num}))
   .append($('<input>').attr({'type': 'file', 'style':'display:none', 'name': 'ContentImg', 'id':'ContentImgInput' + num})
                      .on('change', function(){
                            imgSet1(this)
                    }))
   .append(textArea);
   
   
   return summaryBox;
}
   




//function createSummary(num){
//   const summaryBox = $('<div>').attr('class', 'lecture-summary');
//   const imgArea = $("<div>").attr('class', 'lecture-summary-img');
//   const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'ContentList[' + num + '].ContentTextBox'});
//
//
//
//   summaryBox.append(imgArea)
//   .append($('<input>').attr({'type': 'file', 'style':'display:none', 'name': 'ContentImg' + num}))
//   .append(textArea);
//   return summaryBox;
//}


function createQNA(num){
   const qnabox = $('<div>').attr('class', 'qna-box')
   //질문input생성
   const qInput = $('<div>').text('Q : ')
   .append($('<input>')
         .attr({'type':'text', 'placeholder':'질문을 적어주세요.', 'name':'qnAList[' + num + '].qBox'})
   )
   //답변input생성
   const aInput =  $('<div>').text('A : ')
   .append($('<input>')
         .attr({'type':'text', 'placeholder':'답변을 적어주세요.', 'name':'qnAList[' + num + '].aBox'})
   )                            
   qnabox.append(qInput).append(aInput)

   return qnabox;

}

function uploadImgPreview(input){
}

//자바 스크립트 파일 미리보기 기능
function imgSet1(input) {
   
   console.log("readURL");

   if (input.files && input.files[0]) {
      
      console.log("input.files && input.files[0]");

      var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
      //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
      reader.readAsDataURL(input.files[0]); 
      //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
      $(".fileDiv").css("display", "block");

      reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
         console.log("snum : " + snum);
         $('#ContentImg' + snum).attr("src", event.target.result); 
         $('#ContentImg' + snum).css("width","263px");
         $('#ContentImg' + snum).css("height","467px");
//         $('#bi-image-fill').css("display","none");
//         $('#guid').css("display","none");
         console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
         snum++;
      }
   }
}

let snum = 1;


//$("#ContentImgInput1").change(function() {
//   imgSet1(this); //this는 #file자신 태그를 의미
//});
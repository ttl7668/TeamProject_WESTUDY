<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/utilProduct.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/creatorBoard.css">
</head>
<body>
    
    <section>
        <form action="/project/Product/ProductRegist" name="registForm" enctype="multipart/form-data" method="post">
            <h3>STEP 1.</h3>
            <h4>등록할 강좌에 대해 간단한 소개를 적어주세요.</h4>
            <span class="guid">*표시는 필수항목입니다.</span>
            <hr><br>
            <div class="lecture-step-one">
                <div class="lecture-info">
                    <div class="lecture-info-img">
                        <div>
                            * 강좌 섬네일 이미지:<br>
                            <div class="lecture-thumbnail-img">
                                <img class="thumbnail-img" id="thumbnail-img">
                                <svg width="3em" height="3em" viewBox="0 0 16 16" id="bi-image-fill" class="bi bi-image-fill" fill="#b9b9b9" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094L15.002 9.5V13a1 1 0 0 1-1 1h-12a1 1 0 0 1-1-1v-1zm5-6.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                </svg>
                            </div>
                            <input type="file" accept=".jpg, .jpeg, .png" style="display: none;" class="lecture-info-img-input" id="thumbFile" name="thumb"><br>
                            <span class="guid" id="guid">섬네일 이미지는 4:3의 비율을 추천합니다.</span><br>
                        </div>
                        
                    </div>
                    
                    * 카테고리 : <select name="category" id="category" onchange='previewCategorySet(event)'>
                        <option value="">선택</option>
                        <option value="운동">운동</option>
                        <option value="요리">요리</option>
                        <option value="미술">미술</option>
                        <option value="수공예">수공예</option>
                        <option value="자기계발">자기계발</option>
                    </select><br>
                    
                    <span class="form-notice"></span><br>
                    * 강좌 제목: <input type="text" size="52" name="title" onkeyup='previewTitleSet(event)'><br>
                    
                   <span class="form-notice"></span><br>
                    * 강좌 소개: <br>
                    <textarea cols="60" rows="7" name="intro"></textarea><br>
                    <span class="form-notice"></span><br>
                    <div class="lecture-info-date-picker">
                        * 강좌 기간: <input type="date" size="15" name="startDate" id="startDate">   ~   <input type="date" size="15" name="endDate" id="endDate">
                    </div>
                            <input type="hidden" name="term" value="000">
                            <input type="hidden" name="creator" value="000">
                    * 강좌 가격: <input type="text" size="52" name="price" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'><br>
                    <!-- * 강좌 분량: <input type="text" size="52" name="volume"> -->
                    * 강좌 분량
                    <div class="radio-box">
                    <div>
	                    <input type = "radio" name = "volume" value = "1"> 주 1회 
                    </div>
                    <div>
	        			<input type = "radio" name = "volume" value = "2"> 주 2회
                    </div>
                    <div>
	        			<input type = "radio" name = "volume" value = "3"> 주 3회 
                    </div>
                    <div>
	        			<input type = "radio" name = "volume" value = "4"> 주 4회 
                    </div>
                    <div>
	        			<input type = "radio" name = "volume" value = "5"> 주 5회 
                    </div>
                    </div>

                    <span class="form-notice"></span>
                    
                </div>
                <div class="lecture-view-info">
                    <div>
                        <span>미리보기</span>
                        <div class="class-view-minibox">
                            <div class="class-minibox-img"><img src="../img/banner3.jpg" id="preview-img"/></div>
                            <div class="class-minibox-info">
                                <span class="class-minibox-cartegory" id="preview-category">요리</span><br />
                                <span class="class-minobox-name" id="preview-title">계란으로 만드는 20가지 브런치</span><br />
                                <hr />
                                <span class="class-minibox-price" id="preview-price">월 32,000원</span><!-- <span id="preview-term">(3개월)</span> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr>
            <br>
            <h3>STEP2.</h3>
            <h4>등록할 강좌의 내용을 소개를 적어주세요.</h4>
            <span class="guid">*표시는 필수항목입니다.</span>
            <hr>
            <div class="lecture-step-two">
                <div class="summary-box-space">
                    <div class="lecture-summary">
                        <div class="lecture-summary-img" id="lecture-summary-img0">
                           <img id="ContentImg0">
                        </div>
                        <input type="file"  name="ContentImg" style="display: none" id="ContentImgInput0">
                        <textarea cols="30" rows="7" name="ContentList[0].ContentTextBox" id="ContentList[0].ContentTextBox"></textarea>
                    </div>
                    <div class="add-write-button">
                        <button id="summatyAddBtn" type="button">추가하기</button>
                    </div>
                </div>
            </div>

            <h3>STEP3.</h3>
            <h4>FAQ - 등록할 강좌의 간단한 질의응답을 적어주세요.</h4>
            <hr>
            <div class="lecture-step-three">
                <div class="qna-box-space">
                    <div class="qna-box">
                        <div>
                            Q : <input type="text" name="qnAList[0].qBox" placeholder="질문을 적어주세요."> <br>
                        </div>
                        <div>
                            A : <input type="text" name="qnAList[0].aBox" placeholder="답변을 적어주세요.">
                        </div>
                    </div>
                    <div class="add-qna-button">
                        <button id="qnaAddBtn" type="button">추가하기</button>
                    </div>
                </div>
            </div>
            <hr>
            <button class="submit-button" type="button" id="registBtn">등록하기</button>
            <button class="go-back-button" type="button" onclick="javascript:history.go(-1)">돌아가기</button> 
             
        </form>

    <script src="${pageContext.request.contextPath}/js/creatorBoard.js"></script>
    </section>
    
    <script>
    function previewCategorySet(event){
       document.getElementById("preview-category").innerHTML = document.registForm.category.value;
    }
    
    function previewTitleSet(event){
       document.getElementById("preview-title").innerHTML = document.registForm.title.value;
    }
    
    
    function onlyNumber(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
            return;
        else
            return false;
    }
     
    function removeChar(event) {
       document.getElementById("preview-price").innerHTML = "월 " + document.registForm.price.value + "원";
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
            return;
        else
            event.target.value = event.target.value.replace(/[^0-9]/g, "");
    }
    
       var registBtn = document.getElementById("registBtn");
       registBtn.onclick = function() {
          if(document.registForm.thumb.value == ""){
             alert("썸네일은 필수 입력 사항입니다");
             document.registForm.thumb.focus();
             return;
          } else if(document.registForm.category.value == ""){
             alert("카테고리는 필수 입력 사항입니다");
             document.registForm.category.focus();
             return;
          } else if(document.registForm.title.value == ""){
             alert("제목은 필수 입력 사항입니다");
             document.registForm.title.focus();
             return;
          } else if(document.registForm.intro.value == ""){
             alert("과목소개는 필수 입력 사항입니다");
             document.registForm.intro.focus();
             return;
          } else if(document.registForm.startDate.value == ""){
             alert("시작날짜는 필수 입력 사항입니다");
             document.registForm.startDate.focus();
             return;
          } else if(document.registForm.endDate.value == ""){
             alert("끝나는 날짜는 필수 입력 사항입니다");
             document.registForm.endDate.focus();
             return;
          } else if(document.registForm.endDate.value == ""){
             alert("끝나는 날짜는 필수 입력 사항입니다");
             document.registForm.endDate.focus();
             return;
          } else if(document.registForm.price.value == ""){
             alert("가격은 필수 입력 사항입니다");
             document.registForm.price.focus();
             return;
          } else if(document.registForm.volume.value == ""){
             alert("분량은 필수 입력 사항입니다");
             document.registForm.volume.focus();
             return;
          }  else if(document.getElementById("ContentList[0].ContentTextBox").value==""){
             alert("최소 하나의 컨텐츠 내용을 등록해야 합니다");
             document.registForm.ContentList[0].ContentTextBox.focus();
             return;
          } else {
             document.registForm.submit();
          }
       }
       
    
    </script>
</body>
</html>
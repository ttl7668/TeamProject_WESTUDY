<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Vampiro+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <style>
        input{width: 100%;}
        textarea{width: 100%;}

        .summary-box-space{margin-bottom: 20px;}
        form {
        border-radius: 0px;
        padding: 15px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
        width: 50%;
       	margin: 0 auto;
        }
        
        .btnSpan{
     	font-size: 15px;
    	padding: 10px;
     }
    </style>
</head>
<body>

<%@include file="../include/creatorHeader.jsp" %>
	
	
    <section>
        <div class="form-box">
         <form action="EnrollBoardRegist" enctype="multipart/form-data" method="POST" id="creatorRegForm">
				<div class="board-title">
					<h2>강의자료 게시판</h2>
					<hr>
				</div>
                <div class="input-box">
                    <label>제목</label> 
                    <input type="text" class="form-control" placeholder="제목을 적어주세요" name="title" id="title">
                </div>
                <div>

                <input type="hidden" class="form-control" name="pno" value="${pno }">
                </div>
                <div>
                	<label>작성자</label>
                <input type="text" class="form-control" name="writer" value="${writer }">
                </div>
                
                <div class="summary-box-space">
                    <div class="lecture-summary">
                        <div class="lecture-summary-img">
                        </div>
                        <label>내용</label> 
                        <textarea class="form-control" cols="30" rows="7" name="contentText" id="contentText0"></textarea>
                    </div>
                    <input type="file" name="contentImg" id="contentImg0">
                    <input type="hidden" name="content" id=content>
                </div>
                
                    <div class="add-write-button">
                        <button id="summatyAddBtn" type="button">추가하기</button>
                    </div>
        
                <div class="form-btn-box">
                	<button type="submit" id="formSubmitBtn" class="point-btn"><span class="btnSpan">작성하기</span></button>
                    <button type="button" id="listBtn" class="simple-btn" ><span class="btnSpan">목록으로</span></button>
                </div>
            </form>
        </div>
    
    </section>
    
    <script>
    $(document).ready(function(){
    	let listBtn = $("#listBtn")
    	listBtn.click(function(){
    		location.href='${pageContext.request.contextPath}'+"/Creator/EnrollBoard?pno=" + '${enrollBoardVO.pno}';
    	})
      
       let contentBoxNum = 1;
       
       $("#formSubmitBtn").click(function(){
    	  if($('#title').val()==''){
    		  alert('제목을 입력하세요.')
    	  }
    	  
          let jsonContent = new Array();
          
         for(let i = 0; i < contentBoxNum; i++){
            let contentImg = "#contentImg" + i;
            let contentText = "#contentText" + i;
            
            if($(contentImg)[0].files[0] == '' || $(contentText).val() == ''){
               alert('파일과 텍스트를 한 세트로 올려주세요.')
            }
            	
            let contentBox =  new Object();
            contentBox.contentImg = $(contentImg)[0].files[0].name;
            contentBox.contentText = $(contentText).val();
            jsonContent.push(contentBox);
         }
         let contentStr = JSON.stringify(jsonContent);
         $('#content').val(contentStr);
         
         $('#creatorRegForm').submit();
            
       })
       // $(".lecture-cover-img").click(function(){
       //     $(".lecture-cover-img-input").click();
       // })


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
       const imgArea = $("<div>").attr('class', 'lecture-summary-img');
       const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'contentText', 'id' : 'contentText' + num});

       
       
       summaryBox.append(imgArea)
       .append($('<input>').attr({'type': 'file',  'name': 'contentImg', 'id':'contentImg' + num}))
       .append(textArea);
       return summaryBox;
    }
    </script>
</body>
</html>
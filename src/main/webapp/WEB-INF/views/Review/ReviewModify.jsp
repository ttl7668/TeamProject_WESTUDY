<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">

</head>
<body>

	<%@include file="../include/header.jsp"%>
	
   <section style="width: 50%;">
      <div class="board-title">
         <h2>리뷰 수정 하기</h2>
			<hr>
      </div>

      <form action="ReviewUpdate" name="regForm" method="post">
         <div>
         	<label>제목</label> <input class="form-control" name='title'
						value="${reviewVO.title }"> 
            <label>날짜</label>
            <p>
               <fmt:formatDate value="${reviewVO.regdate }" pattern="yyyy-MM-dd" />
            </p>
         </div>
         <div class="form-group">
					<label>번호</label> <input class="form-control" name='rno'
						value="${reviewVO.rno }" readonly>
		 </div>
		 
         <div class="form-group">
               <input type="hidden" class="form-control"  value="${reviewVO.uno }" name='uno'>
         </div>
         
         <div class="form-group">
               <input type="hidden" class="form-control"  value="${reviewVO.pno }" name='pno'>
         </div>

         <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'
               value="${reviewVO.writer }" readonly>
         </div>
         <div class="form-group">
            <label>평점</label>
               <div class="stars" data-rating="${reviewVO.satisfaction }" >
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span>
               <span class="star">&nbsp;</span>
            </div>
             <%-- <input class="form-control"  name="satisfaction" type="hidden" value="${reviewVO.satisfaction }"> --%>
             <input class="form-control"  type="hidden" value="${reviewVO.satisfaction }">
             <input type="hidden" name="satisfaction" >
             <%-- <input class="form-control" name='satisfaction' value="${reviewVO.satisfaction }"> --%>
             <!-- type="hidden" -->
         </div>

         <div class="form-group">
            <div>내용</div>
            <textarea class="form-control" rows="10" name='content'>${reviewVO.content }</textarea>
         </div>


         <div class="board-detail-btns">
            <button type="button" class="point-btn" id="updateBtn">수정하기</button>
            <button type="button" class="simple-btn"onclick="location.href='ReviewBoard?pno=${reviewVO.pno}' ">목록으로</button>
         </div>

      </form>
   </section>

   <script>
      //수정버튼
      var updateBtn = document.getElementById("updateBtn");
      updateBtn.onclick = function(){

          if(document.regForm.writer.value === '') {
             alert("작성자는 필수 사항 입니다");
             document.regForm.writer.focus();
             return;
          } else if(document.regForm.title.value === '') {
             alert("제목은 필수 사항 입니다");
             document.regForm.title.focus();
             return;
          } else if(document.regForm.content.value === '') {
             alert("내용은 필수 사항 입니다");
             document.regForm.content.focus();
             return;
          } else if (document.regForm.satisfaction.value === ''){
             alert("후기 평점은 필수 사항입니다.")
             document.regForm.satisfaction.focus();
          } else {
             //폼의 action값을 변경
             //document.regForm.action = "ReviewUpdate";
             document.regForm.submit();
          }
          
      }
      
       /*  $("document").ready(function(){
          $(".stars").attr("data-rating", "${reviewVO.satisfaction }");
       })  */

        
        
   </script>
   <script src="${pageContext.request.contextPath}/js/stars.js"></script>
</body>
</html>
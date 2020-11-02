<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
			<h2>리뷰 작성하기</h2>
			<hr>
		</div>
			
         <form action="ReviewRegist" method="POST" name="regForm" >
            <div class="board-content">
	            <input type="hidden" name="pno" value="${pno}">
	            <input type="hidden" name="pno" value="${sessionScope.userVO.uno }">
				<div>
					<label>제목</label> 
					<input class="form-control" placeholder="제목을 입력하세요" name="title" > 
				</div>
			
			   <div class="form-group">
               		<input type="hidden" class="form-control"  value="${reviewVO.uno }" name='uno'>
         	   </div>
         
         		<div class="form-group">
               		<input type="hidden" class="form-control"  value="${reviewVO.pno }" name='pno'>
         		</div>
         		
				<div class="form-group">
					<label>작성자</label> 
					<input class="form-control" type="text" value="${sessionScope.userVO.name }" name='writer'readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>평점</label>
					<div class="star-box">
              
			               <div class="stars" data-rating="3">
			                  <span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
			                  <span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
			                  <span class="star">&nbsp;</span>
			               </div>
                		 <input type="hidden" name="satisfaction" >
            		</div>

				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea  class="form-control" name="content" placeholder="내용을 작성해주세요"></textarea>
				</div>


			</div>
			
			<div class="board-detail-btns">
				 <button type="submit" class="point-btn" >작성하기</button>
				<button type="button" class="simple-btn" onclick="location.href='ReviewBoard?pno=${reviewVO.pno}'">목록으로</button>
			</div>
            
         </form>
   

   </section>
   <script src="${pageContext.request.contextPath}/js/stars.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	   form {
        border-radius: 0px;
        padding: 15px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
        width: 50%;
       	margin: 0 auto;
        }
     .board-detail-btns{
     	margin-top:20px;
     	
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
		 <form action="ReviewModify" method="post">
			<div class="board-title">
				<h2>강의자료 상세 보기</h2>
				<hr>
			</div>
			<div class="board-content">
				<div>
					<label>제목</label> <input class="form-control"
						value="${enrollBoardVO.title }" readonly>
				</div>

				<div class="form-group">
					<label>번호</label> <input class="form-control" name='eno'
						value="${enrollBoardVO.eno}" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value="${enrollBoardVO.writer }" readonly>
				</div>
				
				<div class="form-group">
					<label>내용</label>
					 
				</div>
				
			</div>
			
			<div class="board-detail-btns">
				<button type="button" class="point-btn" id="modifyBtn"><span class="btnSpan">수정하기</span></button>
				<button type="button" class="point-btn" id="deleteBtn"><span class="btnSpan">삭제하기</span></button>
				<button type="button" class="simple-btn" id="listBtn"><span class="btnSpan">목록으로</span></button>
			</div>
		</form>
	  </div>
	</section>

	<script>
   		$(document).ready(function(){
   			let modifyBtn = $("#modifyBtn")
   			let deleteBtn = $("#deleteBtn")
   			let listBtn = $("#listBtn")
   			
   			modifyBtn.click(function(){
   				location.href='${pageContext.request.contextPath}'+'/Creator/EnrollBoardModify?eno=' + '${enrollBoardVO.eno}' + '&pno=' + '${enrollBoardVO.pno}';
   			})
   			
   			deleteBtn.click(function(){
   				if(confirm("게시물을 삭제 하시겠습니까?")){
   					location.href='${pageContext.request.contextPath}'+'/Creator/EnrollBoardDelete?eno=' + '${enrollBoardVO.eno}' + '&pno=' + '${enrollBoardVO.pno}'
   				} else{
   					return;
   				}
   			})
   			
   			listBtn.click(function(){
   				location.href='${pageContext.request.contextPath}'+"/Creator/EnrollBoard?pno=" + '${enrollBoardVO.pno}';
   			})
   			
   			let contentStr = '${enrollBoardVO.content}';
			let contentJson = JSON.parse(contentStr);
			let eno = '${enrollBoardVO.eno}';
			console.log(eno)
			viewContentBox(contentJson, eno);
			
   		})
   		
   		function viewContentBox(list, eno){
   			for(let i = 0; i < list.length; i++){
   				let content = list[i];
   				console.log(content)
   				const imgBox = $('<div>').attr('class', 'img-box');
   				const img = $('<img>').attr('src', 'EnrollBoardImg?eno=' + eno + '&fileName=' + content.contentImg);
   				imgBox.append(img);
   				
   				const span = $('<span>').attr('class','board-content-span')
   										.html(content.contentText);
   				
   				$('.board-content').append(imgBox);
   				$('.board-content').append(span);
   			}
   				
   			}
   	</script>
</body>
</html>
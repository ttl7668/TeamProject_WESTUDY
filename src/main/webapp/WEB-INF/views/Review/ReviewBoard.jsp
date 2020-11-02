<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet"> --%>
<link
	href="${pageContext.request.contextPath }/resources/css/utilProduct.css"
	rel="stylesheet">
<title>Document</title>
<style>
/* 공통옵션 */

/* 페이지 */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

ul li {
	list-style: none;
}

.fl {
	float: left;
}

.tc {
	text-align: center;
}

/* 게시판 목록 */
.board {
	width: 950px;
}

.w70 {
	width: 70px;
}

.w500 {
	width: 500px;
}

.w120 {
	width: 120px;
}

.w100 {
	width: 100px;
}

.title {
	height: 50px;
	line-height: 50px;
	background: skyblue;
	font-weight: bold;
}

.t_line {
	border-right: solid 1px gray;
}

.lt_line {
	border-bottom: solid 1px gray;
}

.list {
	height: 40px;
	line-height: 40px;
	background: #f3f3f3;
}
</style>

</head>
<body>
	<%@include file="../include/header.jsp"%>

	<section style="width: 1000px; margin: auto;">
		<div> 
			<div style="display:flex; margin-top:70px; border:1px #999 solid; content-align:center;">
                     <div class="">
                        <img
                           src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${productVO.pno} "
                           style="width:400px; height:300px;" />
                     </div>
                     <div class="">
                        <span style="font-size:20px">${productVO.category }</span><br />
                        <span style="font-size:30px">${productVO.title }</span><br />
                        <span style="font-size:25px">후기 평균 점수: ${satisAvg }</span>
                     </div>
               </div>
		</div>
		<h2>리뷰 게시판</h2>
		<hr>
		<div class="board-body">

			<!--form select를 가져온다 -->

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>작성자</th>
						<th class="board-title">제목</th>
						<th>별점</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.writer }</td>
							<td><a href="ReviewDetail?pno=${vo.pno}&rno=${vo.rno }">${vo.title} </a></td>
							<td>${vo.satisfaction }</td>
							<td><fmt:formatDate value="${vo.regdate }"
									pattern="yy-MM-dd hh:mm:ss" /></td>
						</tr>
					</c:forEach>

				</tbody>


			</table>


			<!--페이지 네이션을 가져옴-->
			<form action="ReviewBoard" name="pageForm">
				<%-- <input type="hidden" name="pno" value="${vo.pno}"> --%>
				<div class="text-center">
					<hr>
					<ul class="pagination pagination-sm" id="pagination">
						<c:if test="${ReviewPageVO.prev }">
							<li><a href="#" data-pagenum="${ReviewPageVO.startPage-1 }">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${ReviewPageVO.startPage }"
							end="${ReviewPageVO.endPage }">
							<li class="${num == ReviewPageVO.pageNum ? 'active' : '' }"><a
								href="#" data-pagenum="${num }">${num }</a></li>
						</c:forEach>

						<c:if test="${ReviewPageVO.next }">
							<li><a href="#" data-pagenum="${ReviewPageVO.endPage+1 }">다음</a></li>
						</c:if>

					</ul>

					<!-- 페이지 클릭시 숨겨서 보낼 값 -->
					<input type="hidden" name="pno" value="${productVO.pno }">
					<input type="hidden" name="pageNum" value="${ReviewPageVO.pageNum }"> 
					<input type="hidden" name="amount" value="${ReviewPageVO.amount }">
						
					<button type="button" class="btn btn-info" id="reviewWriteBtn" >글쓰기</button>
				</div>
			</form>


		</div>

		</div>
	</section>

	<script>
      window.onload = function() {//화면 로딩이 끝난 직후에 실행

    	const reviewWriteBtn = $("#reviewWriteBtn");
      	const pno = '${pno}';
      	reviewWriteBtn.click(function(e){
      		e.preventDefault();
      		$.ajax({
      			method:'get',
      			url: 'user/enrollment/'+pno,
      		}).done(function(){
      			location.href='ReviewWrite?pno=${pno}';
      		}).fail(function(){
      			alert('작성 권한이 없습니다.');
      		})
      	})
    	  
    	  
    	  
         //기록이 변경 되었다면, 함수 종료
         if (history.state === '') {
            return;
         }
         var msg = '${msg}';
         if (msg !== '') {
            alert(msg);
            //(추가할데이터, 페이지제목, 변경할주소) - 기존기록을 삭제하고 새로운 기록을 추가
            //이렇게 추가된 데이터를 history.state 로 확인이 가능
            history.replaceState('', null, null);
         }

         
         
      }

      //페이저
      /*
      1. 아래 페이지버튼을 a태그에서 ->폼 전송으로 변경
      2. Criteria에 검색 키워드를 추가
      3. 검색폼과, 페이지폼이 동일한 값을 가지고 넘어가도록 hidden값을 추가
      4. sql문을 동적쿼리로 변경, total sql문 동적쿼리로 변경
      5. pageVO에 검색키워드를 저장도록 처리
      6. 화면에서 페이지폼과 검색폼 select박스 키워드처리, input태그 키워드 처리
      7. 페이지를 이동하거나, 검색버튼을 클릭했을 때 검색조건이 유지되도록 처리
       */
      var pagination = document.getElementById("pagination");
      pagination.onclick = function() {
         event.preventDefault(); //버튼의 고유이벤트 속성 중지

         var value = event.target.dataset.pagenum; //클릭한 타겟의 데이터셋 
         document.pageForm.pageNum.value = value; //폼에 pageNum에 타겟값 저장
         document.pageForm.submit();
      }
   </script>

</script>





</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/utilProduct.css" />
	
	<style>
		/*인롤 디자인*/

.board-table-left{margin-left: 0px;}
.board-table-right{margin-right: 40px;}

.board-table-viewbox{
display: inline-flex;
flex-wrap: wrap;
justify-content: center;
}

.titlebox {
   width: 250px;
   text-align: center;
   height: 40px;
   line-height: 40px;
   margin: 70px auto;
   border-top: 1px solid #E1E1E1;
   border-bottom: 1px solid #E1E1E1;
}
/*자게 그리드*/
.board-table {
    margin: 0 auto;
    margin-top: 60px;
}
.board-table1{display: flex;}

/*제목에 클래스를 줘서 강제로 크기 고정*/
.board-title {
   width: 300px;
}
/*th의 순차적 접근 색상변경 */
.table-bordered>thead>tr>th {
   background-color: ghostwhite;
   color:black;
}

/*테이블 안에 a태그에 순차적 접근 */
.table-bordered>tbody>tr>td>a, .table-bordered>tbody>tr>td>a:hover {
   color: black;
}
		
	</style>
</head>
<body>
	<%@include file="../include/creatorHeader.jsp"%>

	<section>
		<div class="board-table">
                    <div class="board-table1">
                        <div class="board-table-left">
                            <h1 style="font-size:40px">온라인 클래스</h1>
                        </div>
                        <div class="board-table-right">
                            <a class="new-class-Btn" href="${pageContext.request.contextPath}/Product/ProductWrite">
                                <div class="board-table-svg">
                                    <svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" fill="#5faec9"></path></svg>
                                <span style="font-size: 25px;">새 클래스 만들기</span>
                                </div>
                            </a>

                        </div>

                    </div>
		<div class="board-table-viewbox">
			<c:forEach var="item" items="${userProductList }">
				<div class="class-view-minibox">
					<a
						href="${pageContext.request.contextPath}/Creator/EnrollBoard?pno=${item.pno}">
						<div class="class-minibox-img">
							<img
								src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
						</div>
						<div class="class-minibox-info">
							<span class="class-minibox-cartegory">${item.category }</span><br />
							<span class="class-minobox-name">${item.title }</span><br />
							<hr />
							<span class="class-minibox-price">${item.price }원</span><br>
							<br>
							<c:if test="${item.term == 0 }">
								<span>${item.term + 1}회 </span>
							</c:if>
							<c:if test="${item.term != 0 }">
								<span>${item.term}회 </span>
							</c:if>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
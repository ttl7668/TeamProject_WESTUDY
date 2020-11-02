<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/all.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/searchProducts.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/utilProduct.css" />
</head>
<body>

<%@include file="../include/header.jsp" %>
   <section>
      <div>

         <div class="search_tit">
            <h2 class="search_tit_h2">검색결과</h2>
            <hr>
         </div>
         <%-- <div class="search_span">
            <span class="search-keyword"><b>${searchKeyword.keyword }
            </b></span>의 검색 결과
            <hr>
            <form action="SearchProductsResult">
               <select name="searchValue">
                  <option value="titleSearch">제목</option>
                  <option value="category">카테고리</option>
                  <option value="creatorSearch">크리에이터</option>
                  <option value="introSearch">소개</option>
               </select>
               <input type="text" name="keyword"> 
               <button type="submit">검색하기</button>
            </form>
         </div> --%>
         <div class="search-result-space">
            <div class="class-view-box">
               
               <c:if test="${fn:length(searchResultList) == 0}">
                  <b>검색 결과가 없습니다.</b>
               </c:if>
                  <c:forEach var="item" items="${searchResultList }" varStatus="vs">
                     <div class="class-view-minibox swiper-slide">
                        <a
                           href="${pageContext.request.contextPath}/Product/ProductDetail?product=${item.pno}">
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
                        	<span>${(item.term+1) * 2 }회</span>
                        </c:if>
                        <c:if test="${item.term != 0 }">
                        	<span>${(item.term) * 2 }회</span>
                        </c:if>
                           </div>
                        </a>
                     </div>
                  </c:forEach>
               
               

            </div>
         </div>
      </div>
   </section>


</body>
</html>
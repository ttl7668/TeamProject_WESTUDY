<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Rozha+One&display=swap" rel="stylesheet">
<style>
header {
   border-bottom: 1px rgb(228, 228, 228) solid;
   box-shadow: 3px 3px 5px 3px rgb(228, 228, 228);
   position: fixed;
   background-color: #fff;
   width: 100vw;
   z-index: 1000;
}

.header-logo {
   font-family: 'Rozha One', serif;
   font-size: 40px;
}



.header-container {
   padding-top: 10px;
   padding-left: 20px;
   padding-bottom: 15px;
}

.search {
	display: inline;
}

.header-container>div {
   display: inline-block;
   margin-right: 10px;
}

.header-container>input {
   height: 25px;
   width: 400px;
}

.header-menu {
   padding-top: 20px;
   padding-right: 20px;
   padding-bottom: 15px;
   line-height: 50px;
}

ul, li {
   padding-left: 0;
   list-style-type: none;
   display: inline;
   margin: 0 5px 0 5px;
}

.header-logo>a {
	color:black;
}

.header-logo>a:hover {
	text-decoration: none;
	color:black;
}

nav {
   display: flex;
   justify-content: space-between;
}

nav>div {
   margin: 0;
}

header>a {
   width: 100%;
   height: 100%;
   color:black; 
}

.dropbox-mypage {
   position: fixed;
   box-shadow: 3px 3px 5px 3px rgb(228, 228, 228);
   display: none;
   z-index: 200;
   width: 150px;
   height: 180px;
   right: 40px;
   top: 77px;
   border-radius: 7px;
}

.dropbox-mypage div {
   padding: 10px;
}

.dropbox-mypage div a {
   width: 100%;
   height: 100%;
}

@font-face {
   font-family: 'NEXON Lv1 Gothic OTF';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

body {
   font-family: 'NEXON Lv1 Gothic OTF';
   font-style: normal;
   font-weight: normal;
}

#searchForm {
	left-margin:20px;
	height:30px;
	font-size:15px;
}

#keyword {
	height:30px;
	font-size:15px;
}

#headerSubmitBtn {
	height:30px;
	font-size:15px;
}

li>a {
	color:black;
	font-size:20px;
}

b {
	font-size:20px;
}


</style>

</head>

<body>
   <header>
      <nav>
         <div class="header-container">
            <div class="header-logo">
               <a href="${pageContext.request.contextPath}">WeStudy</a>
            </div>
            <form class="search">
               <select name="searchValue"  id="searchForm">
                  <option value="titleSearch">제목</option>
                  <option value="category">카테고리</option>
                  <option value="creatorSearch">크리에이터</option>
                  <option value="introSearch">소개</option>
               </select> <input type="text" id="keyword" placeholder="무엇을 찾고계신가요?">
               <button type="button" id="headerSubmitBtn">검색</button>
               
               
            </form>
         </div>

         <div class="header-menu">
            <ul>

               <c:choose>
                  <c:when test="${sessionScope.userVO == null}">
                     <li><a id="userLogin"
                        href="${pageContext.request.contextPath}/User/UserLogin">로그인</a></li>
                     <li><a id="userLogin"
                        href="${pageContext.request.contextPath}/User/UserJoin">회원가입</a></li>
                  </c:when>
                  <c:when test="${sessionScope.userVO != null && sessionScope.userVO.permission eq 'creator'}">
                  
                     <li>${sessionScope.userVO.name }님환영합니다</li>
                     <li><a id="userLogin"
                         onclick="LogOut()">로그아웃</a></li>
                     <li><a id="userMypage"
                        href="${pageContext.request.contextPath}/User/Mypage">마이페이지</a></li>
                     <li><a id="creatorPage"
                        href="${pageContext.request.contextPath}/Creator/MyCreatorPage">크리에이터 페이지</a></li>
                  </c:when>
                  <c:when test="${sessionScope.userVO != null}">
                     <li><b>${sessionScope.userVO.name }님환영합니다</b></li>
                     <li><a id="userLogin" onclick="LogOut()">로그아웃</a></li>
                     
                     <%-- <a id="userLogin" href="${pageContext.request.contextPath}/User/Logout" onclick="LogOut()">로그아웃</a> --%>
                     
                     <li><a id="userMypage"
                        href="${pageContext.request.contextPath}/User/Mypage">마이페이지</a></li>
                     <li><a id="creatorPage"
                        href="${pageContext.request.contextPath}/User/CreatorJoin">크리에이터 지원</a></li>
                  </c:when>
                  

               </c:choose>

               <!-- <li><a id="creatorPage">크리에이터 지원</a></li>
               로그인 로그아웃에 따라 둘중 하나만 보입니다.
               <li><a id="userLogin">로그인</a></li>
               <li><a id="userMypage">마이페이지</a></li> -->
            </ul>
         </div>
      </nav>
   </header>


   <div class="dropbox-mypage">
      <div>
         <span>김아무개 님</span>
      </div>
      <hr>
      <div>
         <a>마이페이지</a>
      </div>
      <div>
         <a>로그아웃</a>
      </div>
   </div>


   <br>
   <br>
   <br>
   <br>

   <!-- <script>
      var asd = document.getElementById("hiddenInput");
      asd.value = sessionStorage.getItem('k_name');
      console.log(sessionStorage.getItem('k_name'));
   </script> -->

   <script>
      /* $("document").ready(function() {
         //마이페이지 드랍박스
         $("#userMypage").click(function() {
            const dropMypage = $(".dropbox-mypage");
            console.log(dropMypage.css("display"))
            if (dropMypage.css("display") == 'none') {
               dropMypage.css("display", "block");
            } else {
               dropMypage.css("display", "none");
            }

         }) */
         function LogOut(){
        	 if(confirm("로그아웃 하시겠습니까?")){
            	 location.href="${pageContext.request.contextPath}/User/Logout";
        	 } else{
        		 return;
        	 }
         }
         

         //검색 엔터키로 연동하는 이벤트
         const searchBox = $("searchBox")
         searchBox.keydown(function(key) {
            if (key.keyCode == 13) {
               //서브밋으로 쏘세용
            }
         })

         $("#headerSubmitBtn").click(function(){
        	console.log("들어왓다고");
            const searchValue = $("#searchForm").val();
            const keyword = $("#keyword").val();
            const path = '${pageContext.request.contextPath}';
            if(keyword == '' || keyword == null) return;
            location.href = path + "/Product/SearchProductsResult?searchValue="+searchValue+"&keyword="+keyword;
         }) 
      /* }) */
   </script>

</body>
</html>
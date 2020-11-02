<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="../js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stayle.css">
    <link href="https://fonts.googleapis.com/css2?family=Vampiro+One&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        


@font-face {
   font-family: 'NEXON Lv1 Gothic OTF';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
   font-weight: normal;
   font-style: normal;
}

body{font-family: 'NEXON Lv1 Gothic OTF';
    font-style: normal; 
    font-weight: normal;
}
a{
    text-decoration: none;
    color: #000000;}
/*인롤 디자인*/

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

.pagination {
   margin: 0; /*페이지 네이션의 기본 마진 0*/
}

.text-center .btn {
   float: right; /*오른쪽으로 쌓아서 우측정렬 시킨다*/
   border: 0; /*border스타일 해제*/
   border-radius: 0; /*윤곽 0*/
   padding: 5px 10px; /*버튼 패딩을 페이지네이션과 맞춘다*/
}
.board-table-left{
    -webkit-box-flex: 1;
    flex-grow: 1;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}
.board-table-right{
    display: flex;
    justify-content: flex-end;
}
.new-class-Btn{
    display: inline-flex;
    vertical-align: middle;
    font-size: 20px;
    background: none;
    transition: color 0.1s ease 0s;
    border-style: hidden;
    padding-top: 20px;

}

.board-table-svg{
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 0px;
    width: 18px;
    height: 18px;
    margin-right: 4px;
    flex: 0 0 auto;
}
svg{display: block;}

/* 페이지 */
.page_wrap {
   text-align: center;
   font-size: 0;
   display: flex;
}

.page_nation {
   display: inline-block;
   margin: 0 auto;
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

.point-btn{
    width: 10%;
    height: 32px;
    font-size: 15px;
    margin-right: 51px;
    line-height: 1.428571;
    background: black;
    color: white;
    border-radius: 5px;
}
    </style>

</head>

<body>
    
    <%@include file="../include/creatorHeader.jsp" %>

    <section style="width: 1000px; margin: auto;">
        <div class="container-fluid">
            <div class="row">
  
                <div class="board-table">
                    <div class="board-table1">
                        <div class="board-table-left">
                            <h1>강의자료 게시판</h1>
                        </div>
                        <div class="board-table-right">
                        
<!--                         	<a class="new-class-Btn" onclick="pubSet()">
                            	<div class="board-table-svg">
                                    
                                </div>
                                <span class="">공개설정</span>
                            </a> -->
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <a class="new-class-Btn" href="EnrollWrite?pno=${pno }">
                                <div class="board-table-svg">
                                    <svg width="18" height="18" fill="none" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" fill="#5faec9"></path></svg>
                                </div>
                                <span class="">강의자료 올리기</span>
                                
                            </a>
                            
                            

                        </div>

                    </div>

              
                   
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th class="board-title">제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>공개여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="vo" items="${enrollList}">
                            <tr>
                                <td>${vo.eno} </td>
                                <td><a href="EnrollDetail?pno=${pno }&eno=${vo.eno }">${vo.title} </a></td>
                                <td>${vo.writer }</td>
                                <td><fmt:formatDate value="${vo.regdate }" pattern="yy-MM-dd hh:mm:ss"/></td>
                        		<td><input type="checkbox" class="public" id="${vo.eno }"></td>
                            </tr>
                       
                          </c:forEach>
                        </tbody>
                        
                    </table>
                    
                                    <div>
                        <div class="page_wrap">
                            <div class="page_nation">
                                <a class="arrow pprev" href="#"><<</a> <a class="arrow prev"
                                    href="#"><</a> <a href="#" class="active">1</a> <a href="#">2</a>
                                <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a
                                    class="arrow next" href="#">></a> <a class="arrow nnext" href="#">>></a>
                            </div>
						<button class="point-btn" onclick="pubSet()">일괄공개</button>
                        </div>
                    </div>                 
                </div>
            </div>
        </div>
   </section>
   <script>
   		function pubSet(){
   			var publicArray = document.querySelectorAll('.public');
   	   		console.log(publicArray);
   	   		console.log(publicArray[0].checked);
   	   		
   	   		var selectedArray = new Array();
   	   		
   	   		for(var i = 0;  i < publicArray.length;  i++){
   	   			if(publicArray[i].checked) {
   	   				console.log(publicArray[i].getAttribute('id'));
   	   				selectedArray.push(publicArray[i].getAttribute('id'));
   	   			}
   	   		}
   	   		
   	   		
   	   		var selectedString = "";
   	   		
   	   		for(var i = 0; i < selectedArray.length; i++){
   	   			selectedString += selectedArray[i] + "@@";
   	   			
   	   		}
   	   		
   	   		console.log(selectedString);
   	   		
   	   		location.href = "EnrollPubSet?pno=" + ${pno} + "&selectedString=" + selectedString;
   		}
   		
   		
   		
   </script>

</body>
</html>


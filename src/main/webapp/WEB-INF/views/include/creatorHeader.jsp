<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.css"> --%>
<link href="https://fonts.googleapis.com/css2?family=Rozha+One&display=swap" rel="stylesheet">
<style>
	    header{
        border-bottom:1px rgb(228, 228, 228) solid;
        box-shadow:         3px 3px 5px 3px rgb(228, 228, 228);

    }
    .header-logo{
       font-family: 'Rozha One', serif;
        font-size: 40px;
        display: flex;
        color: white;
    }

    .header-container{
        padding-top : 10px; padding-left: 20px; padding-bottom:15px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        justify-content: space-between;
        position: relative;
  
    }

    .header-container > div {

        margin-right: 10px;
    }

    .header-container > input{
        height: 25px;
        width: 400px;
    }

    .header-menu{
        display: flex;
        -webkit-box-pack: end;
        justify-content: flex-end;
        -webkit-box-flex: 1;
        flex-grow: 1;
    }
    nav {background-color: black;}

    nav > div{
        margin: 0;
    }

    header a {
        width: 100%; height: 100%;
    }
    header a{color:white;}
    header a:hover {
    color:white;
    font-weight: bold;
    text-decoration: none;}
    
    .dropbox-mypage{
        box-shadow:3px 3px 5px 3px rgb(228, 228, 228);
        display: none;
        z-index: 200;
        width: 150px; height: 180px; margin-right: 20px; margin-top: 20px;
        padding:20px; border-radius: 7px;
    }
    .new-class,.class-manage,.class-analysis{
        font-size: 14px;
        font-weight: normal;
        color: rgb(27, 28, 29);
        line-height: 20px;
        letter-spacing: -0.15px;
        margin: 0px;
        padding-right: 20px;
    }
    
</style>
</head>
<body>
<header>
        <nav>
            <div class="header-container">
                <div class="header-logo"><a href="${pageContext.request.contextPath}">WeStudy</a></div>
                <!-- <div class="">
                    <a class="" href="#">크리에이터 지원</a></div> -->
                <div class="header-menu">
                    <div class="new-class">
                        <a class="" href="${pageContext.request.contextPath}/Product/ProductWrite">새클래스 만들기</a>
                    </div>
                    <div class="class-manage">
                        <a class="" href="${pageContext.request.contextPath}/Creator/CreatorMyPage">클래스 관리</a>
                    </div>
                    <div class="class-analysis">
                        <a class="">클래스 분석</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>
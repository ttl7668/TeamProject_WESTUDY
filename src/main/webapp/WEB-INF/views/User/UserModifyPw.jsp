<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
   <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stayle.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
    <div class="container">
        <div class="row">
               <div class="pg">
                   <div class="page-Messege">
                    <h1>
                    새로운 비밀번호를
                    <br>
                    설정해주세요
                    </h1>
                    <div class="page-Messege2">
                        계정에 연결된 이메일 주소를 입력하면 암호를 재설정할 수 있는 링크를 이메일로 보내드릴게요.
                    </div>
                    <form action="${pageContext.request.contextPath}/User/send.do" method="post">
                        <div class="resetPw-form">
                     <label for="email">이메일</label> <input type="text"
                        class="form-control" id="email" name="receiveMail"
                        placeholder="example@naver.com">
                     <input type="hidden" name="senderMail">
                     <input type="hidden" name="message">
                     <br>
                        <button type="submit" class="btn send-Mail"id="sendEmail">인증 메일 전송하기</button>
                        </div>
                    </form>
                    <span style="color:red;">${message}</span>
                   </div>
                   
            </div> 
        </div>           
    </div>
       
</body>
</html>
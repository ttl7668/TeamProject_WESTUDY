<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stayle.css">
</head>
<body>
    <div class="container">
        <div class="row">
                <div class="page-Messege">
                    <h2>비밀번호 재설정</h2>
                <form action="${pageContext.request.contextPath}/User/send.do/UpdatePwForm" method="post" > 
                    <div class="updatePw-form">
                      <input type="hidden" name="email" value="${Email }"><br>
                    <label style="color:rgb(255, 146, 43);font-size: 20px;">${Email } 님의</label><br>
                    <label>새 비밀번호를 입력하세요.</label> <input type="password"
                        class="form-control" id="pw" name="pw">
                   </div>
                <button type="submit" class="btn newPwBtn" id="newPwBtn">저장</button>
               </form>
            
                </div>
            </div>
        </div>

</body>
</html>
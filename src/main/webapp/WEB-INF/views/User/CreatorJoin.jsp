<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/creatorJoin.css">
</head>
<body>
    <%@include file="../include/header.jsp" %>
    <section>
        <div class="right">

            <div>
                <form action="PermissionChange" method="POST">
                    <span>음..문구 추천받습니다</span><br>
                    이메일 인증 : <input type="text" name="email"><br>
                    
                    <button type="submit">크리에이터 도전하기</button>
                </form>
    
            </div>
        </div>
    </section>
</body>
</html>
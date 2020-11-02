<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="testForm" method="post">
		<input type="text" name="list[0].aaa">
		<input type="text" name="list[0].bbb">
		<input type="text" name="list[0].ccc">

		<input type="text" name="list[1].aaa">
		<input type="text" name="list[1].bbb">
		<input type="text" name="list[1].ccc">
		
		<input type="text" name="list[2].aaa">
		<input type="text" name="list[2].bbb">
		<input type="text" name="list[2].ccc">
		
		
		<hr>
		
		
		<input type="text" name="list2[0].aaa">
		<input type="text" name="list2[0].bbb">
		<input type="text" name="list2[0].ccc">

		<input type="text" name="list2[1].aaa">
		<input type="text" name="list2[1].bbb">
		<input type="text" name="list2[1].ccc">
		
		<input type="text" name="list2[2].aaa">
		<input type="text" name="list2[2].bbb">
		<input type="text" name="list2[2].ccc">
		
		<button type="submit">dd</button>

	</form>
	
</body>
</html>
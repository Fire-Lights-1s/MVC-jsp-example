<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/update.jsp</title>
</head>
<body>
<h1>jsp4/update.jsp</h1>
<form action="updatePro.jsp" method="get">
<table>
	<tr>
		<td>학생번호</td>
		<td><input type="text" name="num"></td>
	</tr>
	<tr>
		<td>학생이름</td>
		<td><input type="text" name="name"></td>
	</tr>
</table>
<input type="submit" value="학생수정">
</body>
</html>
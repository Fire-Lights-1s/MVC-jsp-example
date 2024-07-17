<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/delete.jsp</title>
</head>
<body>
<h1>jsp4/delete.jsp</h1>
<form action="deletePro.jsp" method="get">
<table>
	<tr>
		<td>삭제할 학생번호</td>
		<td><input type="text" name="num"></td>
	</tr>
	<tr>
		<td>삭제할 학생이름</td>
		<td><input type="text" name="name"></td>
	</tr>
</table>
<input type="submit" value="학생삭제">
</body>
</html>
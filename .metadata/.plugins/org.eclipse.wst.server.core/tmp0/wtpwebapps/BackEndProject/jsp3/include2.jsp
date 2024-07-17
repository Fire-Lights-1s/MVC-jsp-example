<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/include2.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
<h1>jsp3/include2.jsp</h1>
<table>
		<tr>
			<td colspan="2" width="600" height="100">
			<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td height="400">왼쪽 메뉴</td>
			<td>본문2</td>
		</tr>
		<tr>
			<td colspan="2" width="600" height="100">
			<jsp:include page="battom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
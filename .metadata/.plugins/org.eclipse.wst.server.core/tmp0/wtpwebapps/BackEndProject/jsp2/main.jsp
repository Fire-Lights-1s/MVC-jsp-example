<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/main.jsp</title>
<link rel="stylesheet" href="../css/table.css">
<%
String userID = (String)session.getAttribute("id");
%>
</head>
<body>
	<h1>jsp2/main.jsp</h1>
	<table>
		<tr>
			<td>로그인 표시값</td>
			<td><%=userID%> 님</td>
		</tr>
		<tr>
			<td><a href="info.jsp">나의 정보 조회</a></td>
			<td><a href="logout.jsp">로그아웃</a></td>
		</tr>
	</table>
</body>
</html>
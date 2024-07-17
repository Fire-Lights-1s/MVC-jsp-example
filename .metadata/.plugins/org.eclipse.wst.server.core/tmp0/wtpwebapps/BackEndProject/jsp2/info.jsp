<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/info.jsp</title>
<link rel="stylesheet" href="../css/table.css">
<%
String userID = (String)session.getAttribute("id");
%>
</head>
<body>
<h1>jsp2/info.jsp</h1>
<table>
	<tr>
		<td>아이디</td>
		<td><%=userID%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>연결된 DB에서 가져와야함</td>
	</tr>
	<tr>
		<td><a href="main.jsp">메인으로 이동</a></td>
		<td></td>
	</tr>
</table>
</body>
</html>
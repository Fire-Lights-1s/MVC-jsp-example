<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/delete.jsp</title>
</head>
<body>
	<h1>jsp5/delete.jsp</h1>
	<%
	String id = "";
	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}
	%>
	<form action="deletePro.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" readonly value="<%=id%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원정보삭제"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp7/delete.jsp</title>
<link rel='stylesheet' href="../css/table.css">
<%
	String resultM = (String) session.getAttribute("resultM");
	String id = (String) session.getAttribute("id");
	
	System.out.println((String) session.getAttribute("id"));
	session.removeAttribute("resultM");
	if (resultM == null)
		resultM = "";
	if (id == null)
		id = "";
%>
</head>
<body>
	<h1>jsp7/delete.jsp</h1>
	<form action="deletePro.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" class="input_border"
					value="<%=id%>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="input_border"></td>
			</tr>
			<%if(!resultM.equals("")){ %>
			<tr>
				<td>결과 메세지</td>
				<td><%=resultM%></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="2"><input type="submit" value="회원정보삭제"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="main.jsp" >메인으로 돌아가기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
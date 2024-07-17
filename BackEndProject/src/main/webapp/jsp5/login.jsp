<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resultM = (String)session.getAttribute("resultM");
	String id = (String)session.getAttribute("id");

	System.out.println((String)session.getAttribute("id"));
 	if(resultM == null) resultM="";
 	if(id == null) id="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/login.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp5/login.jsp</h1>
	<form action="loginPro.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" class="input_border"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="input_border"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="로그인"></td>
			</tr>
			<%if(!resultM.equals("")){ %>
			<tr>
				<td>결과 메세지</td>
				<td><%=resultM%></td>
			</tr>
			<%} %>
			<%if(!id.equals("")){ %>
			<tr>
				<td>로그인 아이디</td>
				<td><%=id%></td>
			</tr>
			<%} %>
		</table>
	</form>
</body>
</html>
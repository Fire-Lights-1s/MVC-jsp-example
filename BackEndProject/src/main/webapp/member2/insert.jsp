<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2/insert.jsp</title>
<link rel="stylesheet" href="../css/table.css?ater">
<%
	String resultM = (String)session.getAttribute("resultM");
 	if(resultM == null) resultM="";
 	session.invalidate();
%>
</head>
<body>
	<h1>member2/insert.jsp</h1>
	<% %>
	<form action="insertPro.jsp" method="post">
		<table>
			<tr>
				<td>아이디 </td>
				<td><input type="text" name="id"> </td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password" name="pass"> </td>
			</tr>
			<tr>
				<td>이름 </td>
				<td><input type="text" name="name"> </td>
			</tr>
			<tr>
				<td>나이 </td>
				<td><input type="text" name="age"> </td>
			</tr>
			<tr>
				<td>성별 </td>
				<td>
				<input type="radio" name="gender" value="남">남성 
				<input type="radio" name="gender" value="여">여성
				</td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td><input type="email" name="email"> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
			<%if(!resultM.equals("")){ %>
			<tr>
				<td>결과 메세지</td>
				<td><%=resultM%></td>
			</tr>
			<%} %>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resultM = (String)session.getAttribute("resultM");
	System.out.println(resultM);
 	if(resultM == null) resultM="";
 	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/insert.jsp</title>
</head>
<body>
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
				<td></td>
				<td><input type="submit" value="회원가입"></td>
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
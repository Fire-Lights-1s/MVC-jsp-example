<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../jsp1/errPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/login.jsp</title>
</head>
<body>
<h1>jsp2/login.jsp</h1>
<form action="loginPro.jsp" method="post">
		<table>
			<tr>
				<td class="selfINFO">아이디</td>
				<td><input type="text" name="id" id="width100"></td>
			</tr>
			<tr>
				<td class="selfINFO">비밀번호</td>
				<td><input type="password" name="pass" id="width100"></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="submit" value="로그인">
				<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
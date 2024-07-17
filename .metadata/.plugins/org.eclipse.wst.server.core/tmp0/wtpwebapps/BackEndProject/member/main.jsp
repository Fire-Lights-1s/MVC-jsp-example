<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>member/main.jsp</h1>
	<table>
	<caption><%= session.getAttribute("id")%></caption>
	<%if(session.getAttribute("id") != null &&session.getAttribute("id").equals("admin")){ %>
		<tr>
			<td colspan="2"><a href="list.jsp" class="button btnLightBlue">모든 유저정보 보기</a></td>
		</tr>
		<%} %>
		<tr>
			<td><a href="info.jsp" class="button btnLightBlue">개인정보 보기</a></td>
			<td><a href="update.jsp" class="button btnLightBlue">나의 정보 수정</a></td>
		</tr>
		<tr>
			<td><a href="../board/write.jsp" class="button btnLightBlue">글쓰기</a></td>
			<td><a href="../board/list.jsp" class="button btnLightBlue">글목록 보기</a></td>
		</tr>
		<tr>
			<td><a href="delete.jsp" class="button btnLightBlue">나의 정보 삭제</a></td>
			<td><a href="logout.jsp" class="button btnLightBlue">로그아웃</a></td>
		</tr>
	</table>
</body>
</html>
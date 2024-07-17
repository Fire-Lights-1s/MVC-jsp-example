<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/write.jsp</title>
<link rel='stylesheet' href="../css/table.css">
</head>
<body>
	<h1>board2/write.jsp</h1>
	<%
	String id = "";
	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}
	%>
	<form action="writePro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=id%>"
					class='input_border' readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" class='input_border'></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="10" cols="20" name="content"
						class='input_border resize_none'></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file" class='input_border'></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>
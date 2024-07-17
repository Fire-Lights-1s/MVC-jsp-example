<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp8/update.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp8/update.jsp</h1>
	<%
	String id = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}
		
		int num = Integer.parseInt(request.getParameter("num"));

		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();

		String sql = "select num, name, subject, content, date, file " + "from fboard where num=?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			String file = rs.getString("file");
	%>
	<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>글번호</td>
				<td><input type="text" name="num" value="<%=num%>"
					class='input_border' readonly></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=id%>"
					class='input_border' readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" class='input_border'
				value="<%=subject%>" ></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="10" cols="20" name="content"
						class='input_border resize_none' ><%=content%></textarea></td>
			</tr>
			<tr>
				<td>기존 첨부파일</td>
				<td><input type="hidden" name="oldFile" class='input_border' value="<%=file%>" readonly></td>
			</tr>
			<tr>
				<td>새 첨부파일</td>
				<td><input type="file" name="file" class='input_border' readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글 수정"></td>
			</tr>
		</table>
	</form>
	<%}else{
		out.print("게시글이 없습니다.");
	} %>
</body>
</html>
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
<title>jsp8/content.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
<%
String id = "";
if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
	id = (String) session.getAttribute("id");
}
%>
</head>
<body>
	<h1>jsp8/content.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
		int readCount = 0;
		String name = "";

		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();

		String sql = "select num, name, subject, content, readCount, date, file " + "from fboard where num=?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			readCount = rs.getInt("readCount") + 1;
			name = rs.getString("name");
			String file = rs.getString("file");
	%>
	<p>
		로그인 :
		<%=id%></p>
	<table>
		<tr>
			<td>글번호</td>
			<td><%=rs.getInt("num")%></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=readCount%></td>
		</tr>
		<tr>
			<td>글 작성 날짜</td>
			<td><%=rs.getTimestamp("date")%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><%=rs.getString("subject")%></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><%=rs.getString("content").replace("\n", "<br>")%></td>
		</tr>
		<%
		if (file != null) {
		%>
		<tr>
			<td>첨부파일</td>
			<td><a href="./storage/<%=file%>" download><%=file%></a>
			<img src="./storage/<%=file%>"></td>
		</tr>
		<%
		}
		%>
		<%
		if (name.equals(id)) {
		%>
		<tr>
			<td><a href="list.jsp" class="button btnLightBlue">글 목록</a></td>
			<td>
				<a href="update.jsp?num=<%=num%>" class="button btnLightBlue">글 수정</a> 
				<a href="delete.jsp?num=<%=num%>" class="button btnLightBlue">글 삭제</a>
			</td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td colspan="2"><a href="list.jsp" class="button btnLightBlue">글
					목록</a></td>
		</tr>

		<%
		}// if id
		%>
	</table>
	<%
	} //if
	sql = "update fboard set readCount = ? where num=?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, readCount);
	pstmt.setInt(2, num);
	pstmt.executeUpdate();
	%>

</body>
</html>
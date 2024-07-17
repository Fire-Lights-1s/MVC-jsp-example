<%@page import="java.sql.Timestamp"%>
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
<title>jsp5/update.jsp</title>
</head>
<body>
	<h1>jsp5/update.jsp</h1>
	<%
	//세션 정보에서 id 가져옴
		String id = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}

		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();

		String sql = "select * from members where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			String pass = rs.getString("pass");
			String name = rs.getString("name");
	%>
	<form action="updatePro.jsp" method="post">
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
				<td>이름</td>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원정보수정"></td>
			</tr>
		</table>
	</form>
	<%
	} else {
	%>
	<tr>
		<td rowspan="2">로그인 정보 없음</td>
	</tr>

	<%
	}
	%>
</body>
</html>
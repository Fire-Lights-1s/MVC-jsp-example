<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp7/list.jsp</title>
<link rel='stylesheet' href="../css/table.css">
<%
String id = (String) session.getAttribute("id");

System.out.println((String) session.getAttribute("id"));
if (id == null)
	id = "";
%>
</head>
<body>
	<h1>jsp7/list.jsp</h1>
	<%
	String sql;
		PreparedStatement pstmt;
		ResultSet rs;
		if (id.equals("admin")) {
			MyDB_DAO mydbConn = new MyDB_DAO();
			Connection conn = mydbConn.connection();
			sql = "select id, pass, name, age, gender, email, date from members2;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>가입 날짜</td>
		</tr>
		<%
		while (rs.next()) {
			String idR = rs.getString("id");
			String passR = rs.getString("pass");
			String nameR = rs.getString("name");
			int ageR = rs.getInt("age");
			String genderR = rs.getString("gender");
			String emailR = rs.getString("email");
			Timestamp dateR = rs.getTimestamp("date");
			if (genderR == null)
				genderR = "남";
		%>
		<tr>
			<td><%=idR%></td>
			<td><%=passR%></td>
			<td><%=nameR%></td>
			<td><%=ageR%></td>
			<td><%=genderR%></td>
			<td><%=emailR%></td>
			<td><%=dateR%></td>
		</tr>
		<%
		} //while rs
		%>
		<tr>
			<td colspan="7"><a href="main.jsp">메인으로 돌아가기</a></td>
		</tr>
	</table>
	<%
	} // if admin
	%>
</body>
</html>
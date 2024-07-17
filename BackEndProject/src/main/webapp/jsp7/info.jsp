<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.ResultStreamer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp7/info.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp7/info.jsp</h1>
	<%
	String id = "";
		if(session.getAttribute("id") != null && !session.getAttribute("id").equals("")){
			id = (String)session.getAttribute("id");
		}
		
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		String sql = "select * from members2 where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
	%>
	<table>
		<%
		if(rs.next()){
			String pass = rs.getString("pass");
			String name = rs.getString("name");
			int age = rs.getInt("age");
			String gender = rs.getString("gender");
			String email = rs.getString("email");
			Timestamp date = rs.getTimestamp("date");
		%>
		<tr>
			<td>아이디</td>
			<td><%=id %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=pass %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=age %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>가입 날짜</td>
			<td><%=date %></td>
		</tr>
		<%} else{%>
		<tr>
			<td rowspan="2">로그인 정보 없음</td>
		</tr>
		
		<%} %>
	</table>
	<a href="main.jsp">main.jsp 이동</a>
</body>
</html>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/select.jsp</title>
</head>
<body>
	<h1>jsp4/select.jsp</h1>
	<%
	int i = 1;
		MyDB_DAO mysqlCon = new MyDB_DAO();

		Connection con = mysqlCon.connection();

		String sql = "select * from student;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			int num = rs.getInt("num");
			String name = rs.getString("name");
			out.print(i + "열<br> 학생 번호 - " + num + " 이름 - " + name + "<br>");
			i++;
		}
		out.println("데이터 조회 끝");
		mysqlCon.closeConnection(con);
		System.out.println("DB 연결해제");
	%>
	<form action="selectPro.jsp" method="get">
		<table>
			<tr>
				<td>학생번호</td>
				<td><input type="text" name="num"></td>
			</tr>
			<tr>
				<td>학생이름</td>
				<td><input type="text" name="name"></td>
			</tr>
		</table>
		<input type="submit" value="학생조회">
</body>
</html>
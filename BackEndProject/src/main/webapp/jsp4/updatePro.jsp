<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/updatePro.jsp</title>
</head>
<body>
	<h1>jsp4/updatePro.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
	%>
	학생번호 :<%=num%><br> 학생이름 :<%=name%><br>
	<%
	MyDB_DAO mysqlCon = new MyDB_DAO();
			
			Connection con = mysqlCon.connection();

			String sql = "update student set name = ? where num = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
	%>
	회원수정성공 <%=pstmt %>
</body>
</html>
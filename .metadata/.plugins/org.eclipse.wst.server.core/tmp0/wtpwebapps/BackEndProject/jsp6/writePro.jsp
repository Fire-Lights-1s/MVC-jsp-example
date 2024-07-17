<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp6/writePro.jsp</title>
</head>
<body>
<h1>jsp6/writePro.jsp</h1>
	<%
	String id = "";
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		int num = 1;
		int readcount = 0;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();
		
		String sql = "select max(num) as maxNum from board;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			num = rs.getInt("maxNum") + 1;
		}
		
		sql = "insert into board(num, name, subject, content, readcount, date) "+
			"values (?, ?, ?, ?, ?, ?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, subject);
		pstmt.setString(4, content);
		pstmt.setInt(5, readcount);
		pstmt.setTimestamp(6, date);
		pstmt.executeUpdate();
		response.sendRedirect("list.jsp");
	%>
</body>
</html>
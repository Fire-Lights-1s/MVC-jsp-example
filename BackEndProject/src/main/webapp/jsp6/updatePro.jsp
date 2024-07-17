<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp6/updatePro.jsp</title>
</head>
<body>
	<h1>jsp6/updatePro.jsp</h1>
	<%
	String id = "";
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));

		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}

		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();

		String sql = "update board set subject=?, content=? where num=?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);
		pstmt.executeUpdate();
		
		response.sendRedirect("content.jsp?num="+num);
	%>
	
	
</body>
</html>
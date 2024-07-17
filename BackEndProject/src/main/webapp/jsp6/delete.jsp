<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp6/delete.jsp</title>
</head>
<body>
	<h1>jsp6/delete.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
		String id = "";
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}
		
		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();
		
		String sql = "delete from board where num=? && name=?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		
		response.sendRedirect("list.jsp");
	%>

</body>
</html>
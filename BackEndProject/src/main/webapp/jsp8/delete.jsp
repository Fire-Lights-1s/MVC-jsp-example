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
<title>jsp8/delete.jsp</title>
</head>
<body>
	<h1>jsp8/delete.jsp</h1>
	<%
	String sql;
		PreparedStatement pstmt;
		ResultSet rs;
		String id=null;
		int num = Integer.parseInt(request.getParameter("num"));
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}	
		
		if(request.getParameter("num") != null && !request.getParameter("num").equals("")){
			num = Integer.parseInt(request.getParameter("num"));
		}
		System.out.println("asd "+request.getParameter("num"));
		
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		sql = "select name from fboard where num=?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String nameR = rs.getString("name");
			if(nameR.equals(id)){
		sql = "DELETE FROM fboard where num=? ;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		session.invalidate();
		response.sendRedirect("../jsp7/list.jsp");
		
			}else{
		session.setAttribute("resultM", "글쓴이가 일치하지 않음");
		response.sendRedirect("content.jsp?num="+num);
			}
		}else{
			session.setAttribute("resultM", "글이 존재하지 않음");
			response.sendRedirect("content.jsp?num="+num);
		}
	%>
</body>
</html>
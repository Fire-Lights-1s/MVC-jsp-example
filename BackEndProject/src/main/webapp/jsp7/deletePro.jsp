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
<title>jsp7/deletePro.jsp</title>
</head>
<body>
	<h1>jsp7/deletePro.jsp</h1>
	<%
	String id=null;
		String pass=null;
		String sql;
		PreparedStatement pstmt;
		ResultSet rs;
		if(request.getParameter("id") != null && !request.getParameter("id").equals("")){
			id = request.getParameter("id");
			pass = request.getParameter("pass");
		}
		
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		sql = "select id, pass from members2 where id=?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String idR = rs.getString("id");
			String passR = rs.getString("pass");
			if(idR.equals(id) && passR.equals(pass)){
		sql = "DELETE FROM members2 where id=? && pass=? ;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.executeUpdate();
		session.invalidate();
		response.sendRedirect("login.jsp");
		
			}else{
		session.setAttribute("resultM", "아이디 비밀번호가 일치하지 않음");
		response.sendRedirect("delete.jsp");
			}
		}else{
			session.setAttribute("resultM", "회원이 존재하지 않음");
			response.sendRedirect("delete.jsp");
		}
	%>

</body>
</html>
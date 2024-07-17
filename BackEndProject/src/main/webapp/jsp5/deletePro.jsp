<%@page import="java.sql.SQLException"%>
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
<title>jsp5/deletePro.jsp</title>
</head>
<body>
	<h1>jsp5/deletePro.jsp</h1>
	<%
	boolean check = false;
		String idRequest="", passRequest="";
		String sql, idDB, passDB;
		PreparedStatement pstmt;
		
		if(!request.getParameter("id").equals("") 
		&& !request.getParameter("pass").equals("")){
			idRequest = request.getParameter("id");
			passRequest = request.getParameter("pass");
			check = true;
		}
		
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		try{
			sql = "select id, pass from members where id = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idRequest);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
		idDB = rs.getString("id");
		passDB = rs.getString("pass");
		if(idRequest.equals(idDB) && passRequest.equals(passDB)){
			check = true;
		}else{
			check = false;
		}// if check id pass
			}else{
		check = false;
		session.setAttribute("resultM", "회원이 존재하지 않음");
		response.sendRedirect("login.jsp");
			}// if rs
		}catch(SQLException e){
			e.printStackTrace();
			response.sendRedirect("delete.jsp");
		}//try catch
		
		if(check){
			sql = "delete from members where id = ? && pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idRequest);
			pstmt.setString(2, passRequest);
			pstmt.executeUpdate();
			session.invalidate();
			response.sendRedirect("main.jsp");
		}
	%>
</body>
</html>
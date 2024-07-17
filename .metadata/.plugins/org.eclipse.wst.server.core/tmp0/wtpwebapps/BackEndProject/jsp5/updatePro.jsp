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
<title>jsp5/updatePro.jsp</title>
</head>
<body>
	<h1>jsp5/updatePro.jsp</h1>
	<%
	boolean check = false;
			String idRequest="", passRequest="", nameRequest="";
			String idDB, passDB;
			if(!request.getParameter("id").equals("") 
			&& !request.getParameter("pass").equals("")
			&& !request.getParameter("name").equals("")){
		idRequest = request.getParameter("id");
		passRequest = request.getParameter("pass");
		nameRequest = request.getParameter("name");
		check = true;
		System.out.println(nameRequest);
			}
			
			MyDB_DAO mydbConn = new MyDB_DAO();
			Connection conn = mydbConn.connection();
			
			if (check) {
		try {
			String sql = "select id, pass from members where id=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idRequest);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				idDB = rs.getString("id");
				passDB = rs.getString("pass");
			
				if (idRequest.equals(idDB) && passRequest.equals(passDB)) {
					sql = "update members set name = ?  where id = ?;";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, nameRequest);
					pstmt.setString(2, idRequest);
					pstmt.executeUpdate();
					response.sendRedirect("main.jsp");
				}
			}else{
				session.setAttribute("resultM", "회원이 존재하지 않음");
				response.sendRedirect("login.jsp");
			} // if rs
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("update.jsp");
		}
			} else {
		response.sendRedirect("update.jsp");
			} //if check
	%>
</body>
</html>
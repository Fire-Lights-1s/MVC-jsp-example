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
<title>jsp7/updatePro.jsp</title>
</head>
<body>
	<h1>jsp7/updatePro.jsp</h1>
	<%
	boolean check = false;
			String idRequest = null, passRequest = null, nameRequest = null,
			genderRequest = null,emailRequest = null ;
			int ageRequest = 0;
			String idDB, passDB;
			
			if(!request.getParameter("id").equals("") 
			&& !request.getParameter("pass").equals("")
			&& !request.getParameter("name").equals("")
			&& !request.getParameter("age").equals("")
			&& !request.getParameter("email").equals("")){
		idRequest = request.getParameter("id");
		passRequest = request.getParameter("pass");
		nameRequest = request.getParameter("name");
		ageRequest = Integer.parseInt( request.getParameter("age"));
		genderRequest = request.getParameter("gender");
		emailRequest = request.getParameter("email");
		check = true;
		System.out.println(ageRequest);
			}
			
			MyDB_DAO mydbConn = new MyDB_DAO();
			Connection conn = mydbConn.connection();
			
			if (check) {
		try {
			String sql = "select id, pass from members2 where id=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idRequest);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				idDB = rs.getString("id");
				passDB = rs.getString("pass");
			
				if (idRequest.equals(idDB) && passRequest.equals(passDB)) {
					sql = "update members2 set name = ?, age = ?, gender = ?, email = ? where id = ?;";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, nameRequest);
					pstmt.setInt(2, ageRequest);
					pstmt.setString(3, genderRequest);
					pstmt.setString(4, emailRequest);
					pstmt.setString(5, idRequest);
					pstmt.executeUpdate();
					response.sendRedirect("main.jsp");
				}else {
					session.setAttribute("resultM", "비밀번호가 틀림");
					response.sendRedirect("update.jsp");
				} //if check id pass
			}else{
				session.setAttribute("resultM", "회원이 존재하지 않음");
				response.sendRedirect("login.jsp");
			} // if rs
		} catch (SQLException e) {
			e.printStackTrace();
			session.setAttribute("resultM", e.toString());
			response.sendRedirect("update.jsp");
		}
			} else {
			session.setAttribute("resultM", "입력되지 않은 값이 있음");
		response.sendRedirect("update.jsp");
			} //if check
	%>
</body>
</html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DB_Connector.MyDB_DAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/insertPro.jsp</title>
</head>
<body>
	<%
	String id = "";
		String pass = "";
		String name = "";
		boolean idCheck = false, passCheck = false, nameCheck = false;
		
		if(request.getParameter("id") != null && !request.getParameter("id").equals("")){
			id = request.getParameter("id");
			idCheck = true;
		}
		if(request.getParameter("pass") != null && !request.getParameter("pass").equals("")){
			pass = request.getParameter("pass");
			passCheck = true;
		}
		if(request.getParameter("name") != null && !request.getParameter("name").equals("")){
			name = request.getParameter("name");
			nameCheck = true;
		}
		Timestamp date = new Timestamp(System.currentTimeMillis());
			
		MyDB_DAO mydbConn= new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		if(idCheck && passCheck && nameCheck){
			try{
		String sql = "insert into members(id, pass, name, date) values(?,?,?,?);";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, date);
		pstmt.executeUpdate();
		out.print("데이터 추가 완료");
		session.setAttribute("resultM", "추가완료");
		response.sendRedirect("login.jsp");
		
			}catch(SQLException e){
		session.setAttribute("resultM", e.toString());
		response.sendRedirect("insert.jsp");
			}
		}else{
			session.setAttribute("resultM", "필수 정보가 없음");
			response.sendRedirect("insert.jsp");
		}//if
	%>
</body>
</html>
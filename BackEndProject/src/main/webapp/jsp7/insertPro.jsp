<%@page import="java.sql.SQLException"%>
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
<title>jsp7/insertPro.jsp</title>
</head>
<body>
	<h1>jsp7/insertPro.jsp</h1>
	<%
	String id = "";
		String pass = "";
		String name = "";
		int age;
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		boolean idCheck = false, passCheck = false, nameCheck = false;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
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
		if(request.getParameter("age") != null && !request.getParameter("age").equals("")){
			age = Integer.parseInt(request.getParameter("age"));
		}else{
			age = 0;
		}
			
		MyDB_DAO mydbConn= new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		if(idCheck && passCheck && nameCheck){
			try{
		String sql = "insert into members2(id, pass, name, age, gender, email,date) values(?,?,?,?,?,?,?);";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, date);
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
	
	%>
</body>
</html>
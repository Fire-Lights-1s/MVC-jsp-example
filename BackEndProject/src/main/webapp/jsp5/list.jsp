<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
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
<title>jsp5/list.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp5/list.jsp</h1>
	<%
	String id, pass, name;
		Timestamp date;
		ResultSet rs = null;
		String sessionId = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			sessionId = (String) session.getAttribute("id");
			if(sessionId.equals("admin")){
		
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		try{
			String sql = "select * from members;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
		}catch(SQLException e){
			e.printStackTrace();
		}//try catch
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입 날짜</td>
		</tr>
<% 
	while(rs.next()){
		id = rs.getString("id");
		pass = rs.getString("pass");
		name = rs.getString("name");
		date = rs.getTimestamp("date");
		StringWriter stringW = new StringWriter();
		PrintWriter printW = new PrintWriter(stringW);
		printW.println("<tr>");
		printW.println("	<td>"+id+"</td>");
		printW.println("	<td>"+pass+"</td>");
		printW.println("	<td>"+name+"</td>");
		printW.println("	<td>"+date+"</td>");
		printW.println("</tr>");
		out.println(stringW.toString());
	}
%>
	</table>
<%
		}else{
			response.sendRedirect("main.jsp");
		}// if check admin
	}else{
		response.sendRedirect("login.jsp");
	}// if check session id
%>
</body>
</html>
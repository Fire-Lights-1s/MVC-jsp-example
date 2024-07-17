<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/deletePro.jsp</title>
</head>
<body>
	<h1>jsp4/deletePro.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String result = "";
	%>
	<%
	MyDB_DAO mysqlCon = new MyDB_DAO();
			Connection con = mysqlCon.connection();
			
			String sql = "delete from student where num = ? && name = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			try{
		pstmt.executeUpdate();
		result = pstmt.toString();
			}catch(Exception e){
		e.printStackTrace();
		result = "연결 오류";
			}
	%>
	회원삭제성공 <%=result%>
</body>
</html>
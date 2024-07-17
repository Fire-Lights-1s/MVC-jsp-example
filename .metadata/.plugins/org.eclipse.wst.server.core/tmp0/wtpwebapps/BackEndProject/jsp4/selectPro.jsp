<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/selectPro.jsp</title>
</head>
<body>
	<h1>jsp4/selectPro.jsp</h1>
	<%
	int num = 0;
		String name = "";
		boolean numCheck = false;
		boolean nameCheck = false;
		
		MyDB_DAO mysqlCon = new MyDB_DAO();
		ResultSet rs = null;
		int i = 1;
		
		if (request.getParameter("num") != null && !request.getParameter("num").equals("")) {
			num = Integer.parseInt(request.getParameter("num"));
			numCheck = true;
		}
		if (request.getParameter("name") != null  && !request.getParameter("name").equals("")) {
			name = "%"+request.getParameter("name")+"%";
			nameCheck = true;
		}
	%>
	검색 정보<br>
	학생번호 :<%= numCheck ? num : "" %><br> 학생이름 :<%=name%><br>
	<hr>
	<%

	Connection con = mysqlCon.connection();// null인지 체크해야함 
	
	if(numCheck && nameCheck){
		String sql = "select * from student where num = ? && name like ?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		rs = pstmt.executeQuery();
	}else if(numCheck){
		String sql = "select * from student where num = ? ;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
	}else if(nameCheck){
		String sql = "select * from student where name like ? ;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
	}else{
		String sql = "select * from student;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
	}

	while (rs.next()) {
		int numResult = rs.getInt("num");
		String nameResult = rs.getString("name");
		out.print(i + "열<br> 학생 번호 - " + numResult + " <br>이름 - " + nameResult + "<br>");
		i++;
		out.print("<br>");
	}
	out.println("<hr>데이터 조회 끝");
	mysqlCon.closeConnection(con);
	System.out.println("DB 연결해제");
	%>
</body>
</html>
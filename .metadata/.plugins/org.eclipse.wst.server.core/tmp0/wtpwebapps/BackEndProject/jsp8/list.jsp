<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp6/list.jsp</title>
<link rel='stylesheet' href="../css/table.css">
</head>
<body>
	<h1>jsp8/list.jsp</h1>
	<%
	String id = "";
		ResultSet rs = null;
		int num, readCount;
		String name, subject;
		Timestamp date;
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}
		
		MyDB_DAO mydbCon = new MyDB_DAO();
		Connection conn = mydbCon.connection();
		try {
			String sql = "select num, name, subject, readCount, date from fboard order by num desc;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} //try catch
	%>
	<table>
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>글제목</td>
			<td>조회수</td>
			<td>글 작성 날짜</td>
		</tr>
	<%
	while(rs.next() && rs != null){
		num = rs.getInt("num");
		name = rs.getString("name");
		subject = rs.getString("subject");
		readCount = rs.getInt("readCount");
		date = rs.getTimestamp("date");
		
		StringWriter stringW = new StringWriter();
		PrintWriter printW = new PrintWriter(stringW);
		printW.println("<tr>");
		printW.println("	<td><a href=\"content.jsp?num="+num+"\">"+num+"</a></td>");
		printW.println("	<td>"+name+"</td>");
		printW.println("	<td><a href=\"content.jsp?num="+num+"\">"+subject+"</a></td>");
		printW.println("	<td>"+readCount+"</td>");
		printW.println("	<td>"+date+"</td>");
		printW.println("</tr>");
		out.println(stringW.toString());
	}
	%>
	</table>
	<a href="../jsp7/main.jsp">go to main</a><br>
</body>
</html>
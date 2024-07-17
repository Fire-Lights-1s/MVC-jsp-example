<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp8/writePro.jsp</title>
</head>
<body>
	<h1>jsp8/writePro.jsp</h1>
	<%
	PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int num = 1;
		int readcount = 0;
		Timestamp date = new Timestamp(System.currentTimeMillis());

		String uploadPath = request.getServletContext().getRealPath("/jsp8/storage");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		int size = 1024 * 1024 * 100;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", policy);

		String name = null;
		String subject = null;
		String content = null;
		String file = null;
		String fileFullPath = null;
		boolean check = false;

		if (multi.getParameter("name") != null && multi.getParameter("subject") != null
		&& multi.getParameter("content") != null) {
			name = multi.getParameter("name");
			subject = multi.getParameter("subject");
			content = multi.getParameter("content");
			check = true;
		}
		if(multi.getFilesystemName("file") != null){
			file = multi.getFilesystemName("file");
			fileFullPath = uploadPath + "\\" + file;
		}
		if (check) {

			MyDB_DAO mydbCon = new MyDB_DAO();
			Connection conn = mydbCon.connection();

			sql = "select max(num) as maxNum from fboard;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
		num = rs.getInt("maxNum") + 1;
			}
			sql = "insert into fboard(num, name, subject, content, readcount, date, file) " + "values (?, ?, ?, ?, ?, ?, ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, readcount);
			pstmt.setTimestamp(6, date);
			pstmt.setString(7, fileFullPath);

			pstmt.executeUpdate();
			response.sendRedirect("../jsp7/main.jsp");
		} else {
			out.println("값이 없음");
			out.println("name " + name);
			out.println("subject " + subject);
			out.println("content " + content);
			out.println("file " + file);
		}
	%>
</body>
</html>
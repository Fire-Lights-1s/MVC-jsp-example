<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp8/updatePro.jsp</title>
<%
String id = "";
if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
	id = (String) session.getAttribute("id");
}
%>
</head>
<body>
	<h1>jsp8/updatePro.jsp</h1>
	<%
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	int num = 0;
	String name = null;
	String subject = null;
	String content = null;
	String oldFile = null;
	String oldFilePath = null;
	String newFile = null;
	String newFileFullPath = null;
	boolean check = false;

	String uploadPath = request.getServletContext().getRealPath("/jsp8/storage");
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	int size = 1024 * 1024 * 100;
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", policy);

	if (multi.getParameter("num") != null && multi.getParameter("name") != null && multi.getParameter("subject") != null
			&& multi.getParameter("content") != null) {

		num = Integer.parseInt(multi.getParameter("num"));
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		content = multi.getParameter("content");
		oldFile = multi.getParameter("oldFile");
		check = true;
	}
	if (multi.getFilesystemName("file") != null) {
		newFile = multi.getFilesystemName("file");
		newFileFullPath = uploadPath + "\\" + newFile;
	}
	if (check) {
		if (id.equals(name)) {

			MyDB_DAO mydbCon = new MyDB_DAO();
			Connection conn = mydbCon.connection();

			if (newFile != null && !newFile.equals(oldFile)) {
				oldFilePath = uploadPath + "\\" + oldFile;
				File file = new File(oldFilePath.replace("\\", "/"));
				System.out.println("경로" + oldFilePath);
				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					} else {
						System.out.println("파일삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				} //if file check
			}// if new File check
			sql = "update fboard set subject=?, content=?, file=? where num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, newFile);
			pstmt.setInt(4, num);

			pstmt.executeUpdate();
			response.sendRedirect("../jsp8/list.jsp");
		} else {
			out.print("글쓴이가 다름");
		} // if name check
	} else {
		out.println("값이 없음");
		out.println("name " + name);
		out.println("subject " + subject);
		out.println("content " + content);
		out.println("file " + oldFilePath);
	}
	%>
</body>
</html>
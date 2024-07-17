<%@page import="board2.BoardDAO2"%>
<%@page import="board2.BoardDTO2"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/writePro.jsp</title>
</head>
<body>
	<h1>board2/writePro.jsp</h1>
	<%
	BoardDTO2 board = new BoardDTO2();
		int num = 1;
		int readcount = 0;

		String uploadPath = request.getServletContext().getRealPath("/jsp8/storage");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		int size = 1024 * 1024 * 100;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", policy);

		String file = null;
		String fileFullPath = null;
		boolean check = false;

		if (multi.getParameter("name") != null && multi.getParameter("subject") != null
		&& multi.getParameter("content") != null) {
			board.setName(multi.getParameter("name"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setDate(new Timestamp(System.currentTimeMillis()));
			check = true;
		}
		if(multi.getFilesystemName("file") != null){
			file = multi.getFilesystemName("file");
			fileFullPath = uploadPath + "\\" + file;
		}
		if (check) {
			BoardDAO2 boardDAO = new BoardDAO2();
			board.setNum(boardDAO.checkMaxBoardNum());
			board.setFile(file);
			if(board.getNum() != 1){
				board.setNum(board.getNum()+1);
			}
			boardDAO.insertBoard(board);
			response.sendRedirect("../member2/main.jsp");
		} else {
			out.println("값이 없음");
			out.println("name " + board.getName());
			out.println("subject " + board.getSubject());
			out.println("content " + board.getContent());
			out.println("file " + file);
		}
	%>
</body>
</html>
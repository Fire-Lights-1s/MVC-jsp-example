<%@page import="memder.MemberDAO"%>
<%@page import="memder.MemberDTO"%>
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
<title>member/deletePro.jsp</title>
</head>
<body>
	<h1>member/deletePro.jsp</h1>
	<%
	boolean check = false;
	MemberDTO memberRequest = new MemberDTO();
	String sql, idDB, passDB;
	PreparedStatement pstmt;

	if (!request.getParameter("id").equals("") && !request.getParameter("pass").equals("")) {
		memberRequest.setId(request.getParameter("id"));
		memberRequest.setPass(request.getParameter("pass"));
		check = true;
	}

	MemberDAO memberDAO = new MemberDAO();
	
	try {
		MemberDTO memberDB =memberDAO.getMember(memberRequest.getId());
		if (memberDB != null) {
			idDB = memberDB.getId();
			passDB = memberDB.getPass();
			if (memberDAO.userCheck(memberRequest)) {
				check = true;
			} else {
				check = false;
				session.setAttribute("resultM", "비밀번호가 틀립니다");
				response.sendRedirect("delete.jsp");
			} // if check id pass
		} else {
			check = false;
			session.setAttribute("resultM", "회원이 존재하지 않음");
			response.sendRedirect("login.jsp");
		} // if memberDB is null
	} catch (SQLException e) {
		e.printStackTrace();
		session.setAttribute("resultM", "SQL 예외발생");
		response.sendRedirect("delete.jsp");
	} //try catch

	if (check) {
		memberDAO.deleteMember(memberRequest);
		session.invalidate();
		response.sendRedirect("main.jsp");
	}
	%>
</body>
</html>
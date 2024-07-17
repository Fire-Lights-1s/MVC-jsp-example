<%@page import="member2.MemberDTO2"%>
<%@page import="member2.MemberDAO2"%>
<%@page import="java.sql.ResultSet"%>
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
<title>jsp7/loginPro.jsp</title>
</head>
<body>
	<h1>jsp7/loginPro.jsp</h1>
	<%
	MemberDTO2 member = new MemberDTO2();
	boolean idCheck = false, passCheck = false;
	// id와 pass의 유효성 확인
	if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
		member.setId(request.getParameter("id"));
		idCheck = true;
	}
	if (request.getParameter("pass") != null && !request.getParameter("pass").equals("")) {
		member.setPass(request.getParameter("pass"));
		passCheck = true;
	}
	// DB connection 생성
	MemberDAO2 memberDAO = new MemberDAO2();
	try {
		if (idCheck && passCheck) {
			if (memberDAO.userCheck(member)) {
				session.setAttribute("id", member.getId());
				response.sendRedirect("main.jsp");
			} else {
				session.setAttribute("resultM", "아이디 또는 비밀번호가 다름");
				response.sendRedirect("login.jsp");
			} // if userCheck 
		} else {
			// 넘겨받은 id와 pass가 유효하지 않음
			session.setAttribute("resultM", "필수 정보가 없음");
			response.sendRedirect("login.jsp");
		} // if check id, pass
	} catch (SQLException e) {
		session.setAttribute("resultM", "SQL 예외 발생");
		e.printStackTrace();
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>
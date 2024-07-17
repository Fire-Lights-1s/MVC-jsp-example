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
<title>member/updatePro.jsp</title>
</head>
<body>
	<h1>member/updatePro.jsp</h1>
	<%
	boolean check = false;
	MemberDTO memberRequest = new MemberDTO();
	String idDB, passDB;
	if (!request.getParameter("id").equals("") && !request.getParameter("pass").equals("")
			&& !request.getParameter("name").equals("")) {
		memberRequest.setId(request.getParameter("id"));
		memberRequest.setPass(request.getParameter("pass"));
		memberRequest.setName(request.getParameter("name"));
		check = true;
	}// if request parameter have some value

	MemberDAO memberDAO = new MemberDAO();
	Connection conn = memberDAO.connection();

	if (check) {
		try {
			// id에 해당하는 멤버 정보를 DB에서 가져옴
			MemberDTO memberDB = memberDAO.getMember(memberRequest.getId());

			if (memberDB != null) {
				idDB = memberDB.getId();
				passDB = memberDB.getPass();
				// 입력된 아이디 & 비밀번호가 DB의 정보와 같은지 확인
				if (memberRequest.getId().equals(idDB) && memberRequest.getPass().equals(passDB)) {
					// 멤버 정보를 업데이트
					memberDAO.updateMember(memberRequest);
					response.sendRedirect("main.jsp");
				}else{
					session.setAttribute("resultM", "아이디 또는 비밀버호가 틀림");
					response.sendRedirect("update.jsp");
				}//if id pass check
			} else {
				session.setAttribute("resultM", "회원이 존재하지 않음");
				response.sendRedirect("login.jsp");
			} // if memberDB
		} catch (SQLException e) {
			session.setAttribute("resultM", "SQL 예외 발생");
			e.printStackTrace();
			response.sendRedirect("update.jsp");
		}//try catch
	} else {
		session.setAttribute("resultM", "정보가 전달되지 않음");
		response.sendRedirect("update.jsp");
	} //if check
	%>
</body>
</html>
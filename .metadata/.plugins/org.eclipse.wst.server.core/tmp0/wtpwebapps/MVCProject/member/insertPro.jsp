<%@page import="memder.MemberDAO"%>
<%@page import="memder.MemberDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertPro.jsp</title>
</head>
<body>
<h1>member/insertPro.jsp</h1>
	<%
	MemberDTO member = new MemberDTO();
	
	boolean idCheck = false, passCheck = false, nameCheck = false;
	
	if(request.getParameter("id") != null && !request.getParameter("id").equals("")){
		member.setId(request.getParameter("id"));
		idCheck = true;
	}
	if(request.getParameter("pass") != null && !request.getParameter("pass").equals("")){
		member.setPass(request.getParameter("pass"));
		passCheck = true;
	}
	if(request.getParameter("name") != null && !request.getParameter("name").equals("")){
		member.setName(request.getParameter("name"));
		nameCheck = true;
	}
	member.setDate(new Timestamp(System.currentTimeMillis()));
	
	MemberDAO memberDAO= new MemberDAO();
	
	if(idCheck && passCheck && nameCheck){
		try{
			memberDAO.insertMember(member);
			out.print("데이터 추가 완료");
			session.setAttribute("resultM", "추가완료");
			response.sendRedirect("login.jsp");
			
		}catch(SQLException e){
			session.setAttribute("resultM", e.toString());
			response.sendRedirect("insert.jsp");
		}
	}else{
		session.setAttribute("resultM", "필수 정보가 없음");
		response.sendRedirect("insert.jsp");
	}//if
	%>
</body>
</html>
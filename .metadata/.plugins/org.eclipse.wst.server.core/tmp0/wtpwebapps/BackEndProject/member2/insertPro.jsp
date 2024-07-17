<%@page import="member2.MemberDAO2"%>
<%@page import="member2.MemberDTO2"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2/insertPro.jsp</title>
</head>
<body>
<h1>member2/insertPro.jsp</h1>
	<%
	MemberDTO2 member = new MemberDTO2();
	
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
	if(request.getParameter("age") != null && !request.getParameter("age").equals("")){
		member.setAge(Integer.parseInt(request.getParameter("age")));
	}else{
		member.setAge(0);
	}
	member.setGender(request.getParameter("gender"));
	member.setEmail(request.getParameter("email"));
	member.setDate(new Timestamp(System.currentTimeMillis()));
	
	MemberDAO2 memberDAO= new MemberDAO2();
	
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
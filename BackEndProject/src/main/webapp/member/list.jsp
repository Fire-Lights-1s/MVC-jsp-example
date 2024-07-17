<%@page import="memder.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memder.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
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
<title>member/list.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>member/list.jsp</h1>
	<%
	ArrayList<MemberDTO> memberList = null;
	String sessionId = "";
	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		sessionId = (String) session.getAttribute("id");
		if (sessionId.equals("admin")) {

			MemberDAO memberDAO = new MemberDAO();
			Connection conn = memberDAO.connection();
			try {
				memberList = memberDAO.getMemberList();
			} catch (SQLException e) {
				e.printStackTrace();
			} //try catch
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입 날짜</td>
		</tr>
		<%
		if(memberList != null){
			for(int i=0; i < memberList.size(); i++){
				MemberDTO member = memberList.get(i);
		%>
		<tr>
			<td><%=member.getId()%></td>
			<td><%=member.getPass()%></td>
			<td><%=member.getName()%></td>
			<td><%=member.getDate()%></td>
		</tr>
		<% 
			}
		}
		%>
		<tr>
			<td colspan="4"><a href="main.jsp" class="button btnLightBlue">main으로 돌아가기</a></td>
		</tr>
	</table>
	<%
		} else {
			response.sendRedirect("main.jsp");
		} // if check admin
	} else {
		response.sendRedirect("login.jsp");
	} // if check session id
	%>
</body>
</html>
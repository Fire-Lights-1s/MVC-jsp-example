<%@page import="member2.MemberDTO2"%>
<%@page import="member2.MemberDAO2"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.ResultStreamer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2/info.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>member2/info.jsp</h1>
	<%
	MemberDTO2 member = new MemberDTO2();
	String id = "";
		if(session.getAttribute("id") != null && !session.getAttribute("id").equals("")){
			id = (String)session.getAttribute("id");
		}
		
		MemberDAO2 memberDAO = new MemberDAO2();
		member = memberDAO.getMember(id);
	%>
	<table>
		<%
		if(member != null){
			String pass = member.getPass();
			String name = member.getName();
			int age = member.getAge();
			String gender = member.getGender();
			String email = member.getEmail();
			Timestamp date = member.getDate();
		%>
		<tr>
			<td>아이디</td>
			<td><%=id %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=pass %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=age %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>가입 날짜</td>
			<td><%=date %></td>
		</tr>
		<%} else{%>
		<tr>
			<td rowspan="2">로그인 정보 없음</td>
		</tr>
		
		<%} %>
	</table>
	<a href="main.jsp">main.jsp 이동</a>
</body>
</html>
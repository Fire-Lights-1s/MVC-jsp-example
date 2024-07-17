<%@page import="memder.MemberDTO"%>
<%@page import="memder.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.ResultStreamer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/info.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp5/info.jsp</h1>
	<%
	String id = "";
	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}
	MemberDTO member;
	MemberDAO memberDAO = new MemberDAO();

	member = memberDAO.getMember(id);
	out.print("member 리턴값 " + member);
	%>
	<table>
		<%
		if (member != null) {
			String pass = member.getPass();
			String name = member.getName();
			Timestamp date = member.getDate();
		%>
		<tr>
			<td>아이디</td>
			<td><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=pass%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>가입 날짜</td>
			<td><%=date%></td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td rowspan="2">로그인 정보 없음</td>
		</tr>

		<%
		}
		%>
	</table>
	<a href="main.jsp">main.jsp 이동</a>
</body>
</html>
<%@page import="memder.MemberDTO"%>
<%@page import="memder.MemberDAO"%>
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
<title>member/update.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
<%
	String resultM = (String)session.getAttribute("resultM");
	session.removeAttribute("resultM");
 	if(resultM == null) resultM="";
%>
</head>
<body>
	<h1>member/update.jsp</h1>
	<%
	//세션 정보에서 id 가져옴
		String id = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}

		MemberDAO memberDAO = new MemberDAO();
		Connection conn = memberDAO.connection();

		MemberDTO member = memberDAO.getMember(id);

		if (member != null) {
			String name = member.getName();
	%>
	<form action="updatePro.jsp" method="post">
		<table>
			<%if(!resultM.equals("")){ %>
			<tr>
				<td>결과 메세지</td>
				<td><%=resultM%></td>
			</tr>
			<%} %>
			<tr>
				<td>아이디</td>
				<td><input type="text" class="input_border" name="id" readonly value="<%=id%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" class="input_border" name="pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" class="input_border" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td><a href="main.jsp" class="button btnLightBlue">main.jsp 이동</a></td>
				<td><input type="submit"  value="회원정보수정"></td>
			</tr>
		</table>
	</form>
	<%
	} else {
	%>
	<tr>
		<td rowspan="2">로그인 정보 없음</td>
	</tr>

	<%
	}
	%>
</body>
</html>
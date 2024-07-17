<%@page import="member2.MemberDTO2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member2.MemberDAO2"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2/list.jsp</title>
<link rel='stylesheet' href="../css/table.css">
<%
String id = (String) session.getAttribute("id");

System.out.println((String) session.getAttribute("id"));
if (id == null)
	id = "";
%>
</head>
<body>
	<h1>member2/list.jsp</h1>
	<%
	String sql;
		if (id.equals("admin")) {
			MemberDAO2 memberDAO = new MemberDAO2();
			ArrayList<MemberDTO2> memberList = memberDAO.getMemberList();
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>가입 날짜</td>
		</tr>
		<%
		if(memberList != null){
			for(int i=0; i < memberList.size(); i++){
				MemberDTO2 member = memberList.get(i);
				String idR = member.getId();
				String passR = member.getPass();
				String nameR = member.getName();
				int ageR = member.getAge();
				String genderR = member.getGender();
				String emailR = member.getEmail();
				Timestamp dateR = member.getDate();
				if (genderR == null)
					genderR = "남(임시)";
			
		%>
		<tr>
			<td><%=idR%></td>
			<td><%=passR%></td>
			<td><%=nameR%></td>
			<td><%=ageR%></td>
			<td><%=genderR%></td>
			<td><%=emailR%></td>
			<td><%=dateR%></td>
		</tr>
		<%
			}
		}
		%>
		<tr>
			<td colspan="7"><a href="main.jsp">메인으로 돌아가기</a></td>
		</tr>
	</table>
	<%
	} // if admin
	if(id.equals("")){
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>
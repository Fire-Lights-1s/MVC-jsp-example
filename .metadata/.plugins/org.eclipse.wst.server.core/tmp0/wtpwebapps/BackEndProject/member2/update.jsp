<%@page import="member2.MemberDTO2"%>
<%@page import="member2.MemberDAO2"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2/update.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>member2/update.jsp</h1>
	<%
	String resultM = (String)session.getAttribute("resultM");
		if(resultM == null) resultM="";
		session.removeAttribute("resultM");
		//세션 정보에서 id 가져옴
		String id = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}

		MemberDAO2 memberDAO = new MemberDAO2();
		MemberDTO2 member = memberDAO.getMember(id);
	%>
	<form action="updatePro.jsp" method="post">
		<table>
			<%
			if (member != null) {
				String gender = member.getGender();
				String name = member.getName();
				if(gender == null) gender = "남";
			%>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" readonly value="<%=id%>"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"
					value="<%=member.getAge()%>"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남"
					<%=gender.equals("남") ? "checked" : ""%>>남성 
					<input type="radio" name="gender" value="여"
					<%=gender.equals("여") ? "checked" : ""%>>여성</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"
					value="<%=member.getEmail()%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원정보수정"></td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<td colspan="2">로그인 정보 없음</td>
			</tr>
			<%
			}
			%>
			<%if(!resultM.equals("")){ %>
			<tr>
				<td>결과 메세지</td>
				<td><%=resultM%></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="2"><a href="main.jsp">메인으로 돌아가기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
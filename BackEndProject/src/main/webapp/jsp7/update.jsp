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
<title>jsp7/update.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp7/update.jsp</h1>
	<%
	String resultM = (String)session.getAttribute("resultM");
		if(resultM == null) resultM="";
		session.removeAttribute("resultM");
		//세션 정보에서 id 가져옴
		String id = "";
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}

		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();

		String sql = "select * from members2 where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
	%>
	<form action="updatePro.jsp" method="post">
		<table>
			<%
			if (rs.next()) {
				String gender = rs.getString("gender");
				String name = rs.getString("name");
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
					value="<%=rs.getString("age")%>"></td>
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
					value="<%=rs.getString("email")%>"></td>
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
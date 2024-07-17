<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/loginPro.jsp</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
<h1>jsp2/loginPro.jsp</h1>
<%
// http가 들고온 태그정보(파라미터정보 id=값, pass=값)를 서버 request 기억장소 저장
// request에서 id,pass 가져와서 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");

String dbID = "admin";
String dbPass = "123";
String checkID;
String checkPass = "비밀번호 미확인";
boolean check = false;

if(id.equals(dbID)){
	checkID = "아이디 일치";
	if(pass.equals(dbPass)){
		checkPass = "비밀번호 일치";
		check = true;
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	}else{
		checkPass = "비밀번호 불일치";
		response.sendRedirect("login.jsp");
	}
}else{
	checkID = "아이디 불일치";	
}
// if(id.equals(dbID) && pass.equals(dbPass)){
// 	check = true;
// }
%>
<table>
	<tr>
		<td>
		폼에서 입력한 아이디 
		</td>
		<td><%=id%></td>
	</tr>
	<tr>
		<td>
		폼에서 입력한 비밀번호
		</td>
		<td><%=pass%></td>
	</tr>
	<tr>
		<td>
		DB 아이디
		</td>
		<td><%=dbID%></td>
	</tr>
	<tr>
		<td>
		DB 비밀번호
		</td>
		<td><%=dbPass%></td>
	</tr>
	<tr>
	<tr>
		<td>
		아이디 & 비밀번호 확인
		</td>
		<td><%=checkID%> & <%=checkPass%></td>
	</tr>
	<tr>
		<td>
		로그인 확인
		</td>
	<%
	if(check){
	%>	
		<td>로그인 성공</td>	
	<% 	
	}else{
	%>
		<td>로그인 실패</td>	
	<%
	}
	%>
	</tr>
</table>

</body>
</html>
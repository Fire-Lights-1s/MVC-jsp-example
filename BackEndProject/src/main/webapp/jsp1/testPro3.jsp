<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro3.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp1/testPro3.jsp</h1>
	<table>
<%
	HashMap<String,String> nameMap = new HashMap<>();
	Enumeration e = request.getParameterNames();
	nameMap.put("id","아이디");
	nameMap.put("pwd","비밀번호");
	nameMap.put("intro","자기소개");
	nameMap.put("gender","성별");
	nameMap.put("hobby","취미");
	nameMap.put("grade","등급");
	nameMap.put("hid","숨긴값");
	
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		String[] values = request.getParameterValues(name);
	for(String value : values){
%>
		<tr>
			<td class="selfINFO"><%= nameMap.get(name)%></td>
			<td><%= value %></td>
		</tr>
<%	
	}//for
}//while
%>
	</table>
</body>
</html>
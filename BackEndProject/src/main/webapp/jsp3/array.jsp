<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/array.jsp</title>
</head>
<body>
	<h1>jsp3/array.jsp</h1>
	<%
	int[] arr = {10, 20, 30 ,40, 50};
	String[] sArr = {"java", "jsp", "db", "web"};
	
	out.print("<h3>배열 arr 주소" + arr + "</h3>");
	for(int i=0; i < arr.length; i++){
		out.print("배열의 " + (i+1) + "번째 값 : "+ arr[i] + "<br>");
	}
	
	out.print("<h3>배열 sArr 주소" + sArr + "</h3>");
	for(int i=0; i < sArr.length; i++){
		out.print("배열의 " + (i+1) + "번째 값 : "+ sArr[i] + "<br>");
	}
	out.print("<h3>반복문 연습</h3>");
	for(int i=0; i < 50; i+=10){
		out.print("반복문 " + (i+1) + "번째 값 : "+ i + "<br>");
	}
	
	%>
</body>
</html>
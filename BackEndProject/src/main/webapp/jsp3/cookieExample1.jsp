<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/cookieExample1.jsp</title>
</head>
<body>
<h1>jsp3/cookieExample1.jsp</h1>
<%
// 사용자 컴퓨터에 저장된 쿠키값 가져오기
// 사용자가 cookieExample1.jsp 보고싶다 요청 => http (서버,클라이언트,태그,쿠키,세션,헤더) 들고 서버 도착 
// => 서버 request 기억장소(내장객체)에 http들고온 값 저장
String cookieValue = "";
// 1) request에 저장된 쿠키값을 가져와서 => 변수에 저장
Cookie cookies[] = request.getCookies();
// 2) 쿠키값이 없을때 접근하면 에러발생 => 쿠키값이 있을때 접근
if(cookies != null){
	// 3) 쿠키가 저장된 배열변수 접근 for  0 1 2 .. => cookies[0] cookies[1]
	for(int i = 0; i < cookies.length  ; i++){
		// 4) 배열 한칸에 있는 쿠키의 이름을 비교
			if(cookies[i].getName().equals("clang")){
				out.println("쿠키이름 : " +  cookies[i].getName()   +"<br>");
				out.println("쿠키값 : " +   cookies[i].getValue()   +"<br>");
				// 쿠키값을 변수에 저장 
				cookieValue = cookies[i].getValue();
			}
	}
}
// if(cookieValue == null){
// 	out.println("cookieValue == null");
// }
if(cookieValue.equals("")){
// 	out.println("cookieValue.equals()");
	//쿠키값이 비어있으면 => korea 로 변경
	cookieValue = "korea";	
}
if(cookieValue.equals("korea")){
	out.println("<h1>안녕하세요, 이것은 쿠키 예제입니다.</h1>");
	
}else{
	out.println("<h1>Hello, This is Cookie example.</h1>");
}
%>
<form action="cookieExample2.jsp" method="get">
<input type="radio" name="language" value="korea" <% if(cookieValue.equals("korea")){ %> checked <% } %>>한국어 페이지 보기
<input type="radio" name="language" value="english" <% if(cookieValue.equals("english")){ %> checked <% } %>>영어 페이지 보기
<input type="submit" value="언어설정">
</form>
</body>
</html>


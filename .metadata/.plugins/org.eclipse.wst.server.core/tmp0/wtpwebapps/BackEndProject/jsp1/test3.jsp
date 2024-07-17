<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/test3.jsp</title>
</head>
<body>
<h1>jsp1/test3.jsp</h1>
	<form action="testPro3.jsp" method="post">
		<table>
			<tr>
				<td class="selfINFO">아이디</td>
				<td><input type="text" name="id" id="width100"></td>
			</tr>
			<tr>
				<td class="selfINFO">비밀번호</td>
				<td><input type="password" name="pwd" id="width100"></td>
			</tr>
			<tr>
				<td class="selfINFO">자기소개</td>
				<td><textarea name="intro" rows="10" ></textarea></td>
			</tr>
			<tr>
				<td class="selfINFO">성별</td>
				<td>
				<input type="radio" name="gender" value="남" checked="checked">남성 
				<input type="radio" name="gender" value="여">여성
				</td>
			</tr>
			<tr>
				<td class="selfINFO">취미</td>
				<td>
				<input type="checkbox" name="hobby" value="없음" checked="checked">없음
				<input type="checkbox" name="hobby" value="축구">축구 
				<input type="checkbox" name="hobby" value="게임">게임
				<input type="checkbox" name="hobby" value="야구">야구
				</td>
			</tr>
			<tr>
				<td class="selfINFO">등급(목록)</td>
				<td>
				<select name="grade" >
					<option value="목1">목록1</option>
					<option value="목2">목록2</option>
					<option value="목3">목록3</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="selfINFO">숨긴값 서버 전달</td>
				<td><input type="hidden" name="hid" value="hidValue"></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="submit" value="가입(전송, 제출)">
				<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
	<a href="test1.html">html/test1.html</a>
</body>
</html>
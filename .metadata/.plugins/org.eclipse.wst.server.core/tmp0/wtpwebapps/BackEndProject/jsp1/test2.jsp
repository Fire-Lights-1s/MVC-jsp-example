<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/test2.jsp</title>
<script>
var replaceNotInt = /[^0-9]/gi;

$(document).ready(function(){
    
    $("#age").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });

});
</script>

</head>
<body>
<h1>jsp1/test2.jsp</h1>
<form action="testPro2.jsp" method="post">
		<table>
			<tr>
				<td class="selfINFO">이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td class="selfINFO" id="age">나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td class="selfINFO">성별</td>
				<td>
				<input type="radio" name="gender" value="남">남
				<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>
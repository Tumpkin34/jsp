<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//checkId.jsp를 거치면 키값을 통해 true인지 false인지 가져온다.
String check = request.getParameter("check");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="joinOk.jsp" name="joinForm">
		<label> 아이디 <input type="text" name="userId"
			placeholder="5자 이상으로 작성해주세요."> <input type="button"
			value="중복검사" onclick="send()">
		</label>
		<p id="result">
			<%
			// check에 뭐라도 담겼다는건 checkId를 했다는 것
			if (check != null) {
			%>
			<%=// 문자열인 check를 boolean으로 만들어 삼항연산자를 사용하여 화면에 출력한다.
			Boolean.parseBoolean(check) ? "중복된 아이디입니다." : "사용 가능한 아이디입니다."%>
			<%
			}
			%>
		</p>
		<input type="submit" value="완료">
	</form>
</body>
<script>
	function send() {
		var form = document.joinForm;
		//console.log(form.userId.value); 
		//console.log(form.userId.value.length); 

		if (!form.userId.value || form.userId.value.length < 5) {
			alert("아이디를 확인해주세요.");
			return;
		}
		//주소 이동할 때 쿼리문자열로 값을 전달한다.
		location.href = "checkId.jsp?userId=" + form.userId.value;
	}
</script>
</html>














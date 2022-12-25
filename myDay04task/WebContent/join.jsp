<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.inputBox {
	display: block;
	margin-top: 10px
}
</style>
</head>
<body>
	<h1>회원가입</h1>

	<form action="joinOk.jsp" name = "joinForm" method = "post">
		<label> <input type="text" name="userId" placeholder="아이디">
			<input type="button" value="중복검사" onclick="send()">
		</label>
		<p id="result"></p>
		<input type="password" name="userPassword" placeholder="비밀번호"
			class="inputBox"> <input type="text" name="userName"
			placeholder="이름" class="inputBox"> <input type="text"
			name="userAge" placeholder="나이" class="inputBox"> <input
			type="text" name="userPhoneNumber" placeholder="핸드폰번호"
			class="inputBox"> <input type="text" name="userBirth"
			placeholder="생일" class="inputBox">
		<button>회원가입</button>
	</form>


</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function send() {
		console.log("안녕");
		var $value = $("input[name='userId']").val();
		$.ajax({
			url : "checkId.jsp",
			type : "post",
			data : "userId=" + $value,
			contentType : "application/x-www-form-urlencoded",
			dataType : "text",
			success : function(result) {
				console.log(result);
				result = result.trim();
				if (result == 1) {
					$("p#result").text("사용가능한 아이디입니다.");
				} else {
					$("p#result").text("중복된 아이디입니다.");
				}
			}
		});
	}
</script>
</html>
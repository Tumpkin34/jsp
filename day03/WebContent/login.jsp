<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//loginOK를 거쳐 키값으로 값을 받아 저장
	String check = request.getParameter("check");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 로그인 페이지 구현 -->
<!-- 아이디만 입력받아서 검사 -->
	<section>
	<!-- hidden을 사용하면 숨겨지고 value를 통해서 html에서 값을 저장한 용도로 썻다. -->
		<input type="hidden" value=<%=check%> name="check">
		<form action="loginOk.jsp" method="post">
			<label>
				아이디 <input type="text" name="userId">
			</label>
			<button>로그인</button>
		</form>
	</section>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
//태그에 html로 저장한 check를 저장
	var check = $("input[name='check']").val();
	//가져온 check에 따라 실행
	if(check != "null" && check != null){
		alert("아이디 또는 비밀번호를 다시 확인해주세요.");
	}
</script>
</html>













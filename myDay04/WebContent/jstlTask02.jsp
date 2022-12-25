<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 두번째 실습</title>
</head>
<body>
	<!-- 
   1단부터 100단까지 중 사용자에게 입력받은 단수로 구구단 출력하기
   입력받은 값이 정수인지 아닌지 판단, 값을 입력했는지 안했는지 판단.
   다른 페이지 이동 없이 현재 페이지에서만 기능 구현
   자바스크립트 사용가능
   구구단 출력은 JSTL로 구현
   입력은 form태그로 입력받는다.
 -->
	<c:set var="number" value="${param.number}" scope="page" />
	<form>
		<input type="text" name="number">
		<button type = "button" onclick="checkNum()">입력</button>
	</form>
	<c:if test="${empty number}">
		<h3>
			<c:out value="값을 입력해주세요." />
		</h3>
	</c:if>
	<%-- <c:if test="${number-number == 0}">
		<h3>
			<c:out value="정수 입니다." />
		</h3>
	</c:if> --%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function checkNum() {
		var number = $("input[name='number']")
		console.log(number);
		console.log(number.val());

	}
</script>
</html>
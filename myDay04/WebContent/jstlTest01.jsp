<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST(변수)</title>
</head>
<body>
	<h2>JSTL TEST(변수)</h2>
	<c:set var="name" value="홍길동" scope="page" />
	<h3>${name}</h3>
	<!-- 출력을 할때는 위에 방식보다는 밑에방식으로 사용한다 (약속) -->
	<h3>
		<c:out value="${name}" />
	</h3>
	<!-- 달러 표시를 출력하고 싶을 때 -->
	<h4>\${name}</h4>
	<h4>&dollar;{name}</h4>
	<!-- session : 더 큰 영역, 다른페이지에서도 쓸 수 있다. -->
	<c:set var="nation" value="미국" scope ="session"/>
	<!-- remove를 통해 메모리에서 해제 시킬 수 있다. -->
	<c:remove var="nation" scope ="session"/>
	<h4>
		<c:out value="${nation}" default="한국"></c:out>
	</h4>
	<h4>${10 + 20}</h4>
</body>
</html>
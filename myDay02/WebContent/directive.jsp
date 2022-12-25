<!-- 10/0은 수학적 오류가 생기기 때문에 errorPage를 통해 오류가 났을 때 error.jsp로 이동하게 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그</title>
</head>
<body>
	<h1>
		1+1은 <%= 1+1%>이다.
		10/ 0은 <%=10/0 %>이다.
	</h1>
</body>
</html>
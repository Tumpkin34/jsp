<!-- jsp에서의 import방법 -->
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
<style type="text/css">
h1 {
	color: red;
}
</style>
</head>
<body>
	<h1>경고! 잘못된 접근입니다.</h1>
	<!-- 오류 날짜를 출력한다. -->
	<h2><%=new Date()%></h2>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그 예제1</title>
</head>
<body>
<!-- 디렉티브 태그를 그냥 쓴다면 대부분의 자바언어를 쓸수있고
	 태그에 !를 붙이면 선언 , =를 붙이면 값입력 -->
	<h2>Scripting Tag</h2>
	<%!int count = 3;

	String makeItBeLower(String data) {
		return data.toLowerCase();
	}%>
	<%
	for(int i = 0; i<count; i++){
	%>
	<h3>Java Serve Pages <%= i+1%></h3>
	<%} %>
	<hr>
	
	<h3><%= makeItBeLower("Hello World") %></h3>
</body>
</html>
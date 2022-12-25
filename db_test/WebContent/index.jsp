<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>황지수</title>
</head>
<body>
	<h1>우린 항상 해낸다!</h1>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/milestone";
	String username = "gbjspj";
	String password = "123456789";
	Connection conn = DriverManager.getConnection(url, username, password);
	%>
	<h2>DB 연결 성공!</h2>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO"/>
<%
	String userId = request.getParameter("userId");
	System.out.print("안녕"+userId);
	// 화면쪽에 보내주는 메소드
	out.println(userDAO.checkId(userId));
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO"/>
<%
	String userId = request.getParameter("userId");
//checkId()를 통해 boolean을 가져와 boolean에 따른 주소로 이동
	response.sendRedirect(userDAO.checkId(userId) ? "index.jsp" : "login.jsp?check=false");
%>
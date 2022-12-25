<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO"/>
<%
// 쿼리문자열로 전달받아 키값인 userId로 값을 가져온다.
	String userId = request.getParameter("userId");
// sendRedirect : 주소이동 
// 해당 주소로 넘어갈 때 쿼리문자열로 값을 넘겨줌
	response.sendRedirect("join.jsp?check=" + userDAO.checkId(userId));
%>
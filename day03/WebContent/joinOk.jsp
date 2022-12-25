<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO"/>
<jsp:useBean id="userVO" class="vo.UserVO"/>
    <!-- 전달받은 데이터를 DB에 INSERT하기 -->
<%
//키값으로 사용자가 입력한 값을 받아오고
	String userId = request.getParameter("userId");
//VO에 저장
	userVO.setUserId(userId);
//insert메소드로 DB에 값 저장
	userDAO.insert(userVO);
//로그인 페이지로 이동
	response.sendRedirect("login.jsp");
%>

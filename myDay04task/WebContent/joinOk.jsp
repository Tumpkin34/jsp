<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO" />
<jsp:useBean id="userVO" class="vo.UserVO" />
<!-- 전달받은 데이터를 DB에 INSERT하기 -->
<%
//키값으로 사용자가 입력한 값을 받아오고
String userId = request.getParameter("userId");
String userPassword = request.getParameter("userPassword");
String userName = request.getParameter("userName");
String userAge = request.getParameter("userAge");
String userPhoneNumber = request.getParameter("userPhoneNumber");
String userBirth = request.getParameter("userBirth");
//VO에 저장
userVO.setUserId(userId);
userVO.setUserPassword(userPassword);
userVO.setUserName(userName);
userVO.setUserAge(Integer.parseInt(userAge));
userVO.setUserPhoneNumber(userPhoneNumber);
userVO.setUserBirth(userBirth);
//insert메소드로 DB에 값 저장
System.out.print(userVO);
userDAO.insert(userVO);
//로그인 페이지로 이동
response.sendRedirect("login.jsp");
%>

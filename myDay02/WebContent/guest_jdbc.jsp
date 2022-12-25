<%@page import="dao.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
</head>
<body>
	<%
	GuestDAO guestDAO = new GuestDAO();
	ArrayList<GuestVO> guests = guestDAO.selectAll();
	%>
	<main>
	<!-- input태그에 action이 생기면 값을 가지고 아래 링크로 이동 -->
		<form action="jdbcTask.jsp" method="get">
			<input type="text" placeholder="이름을 입력하세요." name="keyword">
		</form>
	</main>
	<table border="1">
		<%
		for (int i = 0; i < guests.size(); i++) {
		%>
		<tr>
			<td><%=guests.get(i).getGuestNumber()%></td>
			<td><%=guests.get(i).getGuestName()%></td>
			<td><%=guests.get(i).getGuestBirth()%></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
















<%@page import="dao.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	/* jsp또한 서블릿이기 때문에 request를 사용할 수 있다 */
	/* quest_jdbc에서 form태그로 넘겨받은 값을 keyword에 저장 */
	String keyword = request.getParameter("keyword");
	GuestDAO guestDAO = new GuestDAO();
	ArrayList<GuestVO> guests = guestDAO.select(keyword);
	%>
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
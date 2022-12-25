<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestVO"%>
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
	GuestDAO guestDAO = new GuestDAO();
	GuestVO guestVO = new GuestVO();
	ArrayList<GuestVO> guests = guestDAO.sort(false);
	%>

	<button>반전</button>

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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var button = $("button");
	button.on("click", function(){
		location.href = "sortdesc.jsp";
	})
</script>
</html>
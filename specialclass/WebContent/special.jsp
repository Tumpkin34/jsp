<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>이름 입력</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/input.sp" method="get"> <!--여기서 webxml의 urlpattern 그걸 이용한다.  -->
		이름:<input type="text" name="name"> <!-- name이 키값 -->
		 <button>완료</button> <!-- form안에 있으면 바로 써브밋 -->
	</form>

</body>
</html>
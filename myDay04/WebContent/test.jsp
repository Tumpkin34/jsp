<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 첫번째 실습</title>
</head>
<body>
<!-- 
   사용자에게 이름을 입력받고 확인 버튼을 눌렀을 때
   admin일 경우 "관리자", member일 경우 "일반 회원", 그 외에는 "비회원"을 출력한다.
   
   ※ 다른 페이지 없이 현재 페이지에서만 처리하고, 
      결과가 출력될 때에는 input태그와 submit버튼이 나오게 해서는 안된다.(if나 choose)
   ※ form태그의 속성은 action을 생략하면 현재 페이지로 이동이 된다.
   ※ EL과 JSTL만 사용한다(JS는 사용하지 않는다).
 -->
 
	<form name="userName">
		<input type="text" name = "name"></input>
		<button>제출</button>
	</form>

	<c:choose>
         <c:when test="${param.name=='admin'}">
            <h3>현재 로그인된 계정은 관리자 입니다.</h3>
         </c:when>
         <c:when test="${param.name=='member'}">
            <h3>현재 로그인된 계정은 일반회원 입니다.</h3>
         </c:when>
         <c:otherwise>
            <h3>현재 로그인된 계정은 비회원 입니다.</h3>
         </c:otherwise>
      </c:choose>
    
</body>
</html>
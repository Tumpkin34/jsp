<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 테스트 - GET</title>
</head>
<body>
	<h1 id="result"></h1>
	<button onclick="send()">데이터 가져오기</button>
</body>
<script>
	function send(){
		var xhr = new XMLHttpRequest();
		//xhr.open("GET", "data.jsp");
		//.open(보내는 방식,주소(URL)) : URL을 세팅하는 부분
		xhr.open("POST", "data.jsp");
		// HTTP헤더는 클라이언트와 서버가 서로에게 전달해야 할 다양한 종류의 데이터를 포함할 수 있다.
		// 헤더에 Content-Type속성에 form태그에 해당하는 자료형을 보낸다.
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		//data.jsp에 map방식으로 key와 value를 보낸다.
		xhr.send("msg1=반갑습니다&msg2=어서오세요");
		
		//onreadystatechange : HttpRequest의 상태가 변화 되었을 때 이벤트로 호출
		xhr.onreadystatechange = function(){
			//readyState상태는 0~5까지의 상태가 있고 XMLHttpRequest.DONE은 4에해당한다 
			//readyState가 4이고 상태가 200이면 응답이 준비된 것
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				//h1태그 객체화 후 태그안에 xhr.responseText로 data.jsp의 Body태그 안에 내용을 작성한다.
				document.getElementById("result").innerHTML = xhr.responseText;
			}
		}
	}
</script>
</html>

















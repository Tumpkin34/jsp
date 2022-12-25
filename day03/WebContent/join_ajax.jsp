<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="joinOk.jsp" name="joinForm" method="post">
		<label>
			아이디 <input type="text" name="userId" placeholder="5자 이상으로 작성해주세요.">
			<input type="button" value="중복검사" onclick="send()">
		</label>
		<p id="result">
		</p>
		<input type="submit" value="완료">
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	// 중복검사를 받고 다른아이디로 가입하는 것을 막기위해 입력을 위해 포커싱이 되었다면 검사해야한다
	// 문제는 옳게 중복검사를 해도 입력에 다시 포커스가 가게된다면 수정하지 않았더라도 중복검사를 다시해야한다.
	let check = true;

	// jquery로 input태그가져오고 포커스이벤트주고 input이 포커스되었을 때 체크를 true 
	$("input[name='userId']").on("focus", function(){
		check = true;
	});

	// 확인버튼 객체화 클릭시 메소드 실행
	$("input[type='submit']").on("click", function(e){
		//오류 발생시 오류 출력
		e.preventDefault();
		if(check){
			alert("아이디 중복검사를 진행해주세요.");
			return;
		}
		//완료객체가 submit이긴 하지만 메소드가 먼저 실행 되고 메소드에서 submit을 해준다(action으로 값 보냄)
		joinForm.submit();
	});

	
	function send(){
		//사용자가 입력한 아이디 저장
		var $value = $("input[name='userId']").val();
		
		//값이 없거나 길이가 5가 안되면 실행
		if(!$value || $value.length < 5){
			alert("아이디를 확인해주세요.");
			return;
		}
		
		//
		$.ajax({
			// 요청 url
			url: "checkId_ajax.jsp",
			// 데이터를 전송하는 방법(get,post)
			type: "get",
			// 요청과 함께 서버로 데이터를 전송할 값
			data: "userId=" + $value,
			
			//contentType : 보내는 데이터 타입
			//dataType : 받는 데이터 타입
			// 보내는 데이터의 타입
			contentType: "application/x-www-form-urlencoded",
			// 서버측에서 전송받은 데이터의 형식(default : xml, json, script, text, html)
			dataType: "text",
			// 데이터 요청응답 성공시 수행할 함수
			//result에는 checkId_ajax에서 out.println()으로 보내준 값이 들어있다.
			success: function(result){
				//trim()공백을 없애주는 메소드
				result = result.trim();
				console.log(result)
				//JSON문자열을 js 값이나 객체 생성
				if(JSON.parse(result)){
					//p태그에 메세지 작성
					$("p#result").text("중복된 아이디입니다.");
					check = true;
				}else{
					$("p#result").text("사용가능한 아이디입니다.");
					check = false;
				}
			},
			// 데이터 요청, 응답 실패시
			error: function(xhr, status, error){
				console.log(error);
			}
		});
		
	}
</script>
</html>














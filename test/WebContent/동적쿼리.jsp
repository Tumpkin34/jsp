<!-- 
	동적쿼리는 컬럼명이 변경되어야 할 때 사용한다.

	// 참일 때 안에 쿼리 실행
	
	<if test=""></if> 
	
	<choose>
		<when test=""></when>
		<otherwise></otherwise>
	</choose>
	
	// item에 값이 담김
	// key값을 index 변수에 담음
	// 값 여러개 가지고 있는 주소를 collection에 담음
	<forEach item="" index="" collection=""></forEach>
	
	//where 태그 생성
	<where></where>
	
	//불필요한 부분 없애거나 항상 앞 또는 뒤에 반복되는 쿼리 붙이기
	<trim></trim>
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적쿼리</title>
<style>
	div.wrap {
		width: 80%;
		display: flex;
		margin: 0 auto;
	}
	div.container1 {
		width: 50%;
		text-align: center;
	}
	
	div.container2 {
		width: 50%;
		text-align: center;
	}
	ul {
		width: fit-content;
	    margin: 30px auto;
    }
</style>
</head>
<body>
	<div class="wrap">
		<div class="container1">
			<select id="type-container" name="type">
				<option value="nsl">전체</option>
				<option value="n">이름</option>
				<option value="s">종류</option>
				<option value="l">수명</option>
				<option value="ns">이름 또는 종류</option>
			</select>
			<input type="text" name="keyword" id="keyword">
			<!-- <button onclick="showResultBySearch()">검색</button> -->
			<button onclick="show()">검색</button>
		</div>
		<div class="container2">
			<!-- <button id="n" onclick="showList(this.id)">이름순</button>
			<button id="s" onclick="showList(this.id)">종류순</button>
			<button id="l" onclick="showList(this.id)">수명순</button> -->
			<button id="n" onclick="show(this.id)">이름순</button>
			<button id="s" onclick="show(this.id)">종류순</button>
			<button id="l" onclick="show(this.id)">수명순</button>
		</div>
	</div>
	<ul id="result"></ul>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	show();

	function show(order){
		let keyword = $("#keyword").val() || 'none';
		let type = $("#type-container").val() || 'none';
		order = order || 'none';
		console.log(keyword, type, order);
		$.ajax({
			url: "${pageContext.request.contextPath}/result.s",
			type: "get",
			data: {keyword: keyword, type: type, order: order},
			dataType: "json",
			success: function(animals){
				let text = "";
				let $result = $("#result");
				if(animals.length == 0){
					$result.html("정보가 없습니다.");
				}
				$.each(animals, function(i, animal){
					text += `<li>`;
					text += animal.animalNumber + `,  `;
					text += animal.animalName + `,  `;
					text += animal.animalLife + `,  `;
					text += animal.animalSpecies + `,  `;
					text += animal.animalExplain;
					text += `</li>`;
					
					$result.html(text);
				});
			}
		});
	}









/* 	showList("default");
	
	function showList(type){
		$.ajax({
			url: "${pageContext.request.contextPath}/order.s",
			type: "get",
			data: {type: type},
			dataType: "json",
			success: function(animals){
				let text = "";
				let $result = $("#result");
				if(animals.length == 0){
					$result.html("정보가 없습니다.");
				}
				$.each(animals, function(i, animal){
					text += `<li>`;
					text += animal.animalNumber + `,  `;
					text += animal.animalName + `,  `;
					text += animal.animalLife + `,  `;
					text += animal.animalSpecies + `,  `;
					text += animal.animalExplain;
					text += `</li>`;
					
					$result.html(text);
				});
			}
		});
	}
	
	function showResultBySearch(){
		$.ajax({
			url: "${pageContext.request.contextPath}/search.s",
			type: "get",
			data: {type: $("#type-container").val(), keyword: $("#keyword").val()},
			dataType: "json",
			success: function(animals){
				let text = "";
				let $result = $("#result");
				if(animals.length == 0){
					$result.html("검색 결과가 없습니다.");
				}
				$.each(animals, function(i, animal){
					text += `<li>`;
					text += animal.animalNumber + `,  `;
					text += animal.animalName + `,  `;
					text += animal.animalLife + `,  `;
					text += animal.animalSpecies + `,  `;
					text += animal.animalExplain;
					text += `</li>`;
					
					$result.html(text);
				});
			},
			error: function(a, b, c){
				console.log(a, b, c);
			}
		});
	} */
</script>
</html>












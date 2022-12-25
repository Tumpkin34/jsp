<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무한 스크롤</title>
</head>
<body>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<h1>아하하하하하ㅏㅏ</h1>
	<p id="result"></p>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var page = 1;

	$(window).scroll(
			function() {
				let text = "";
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<h1>아하하하하하ㅏㅏ</h1>`;
					text += `<p id="result">` + page++ +`</p>`;
					$(document.body).append(text);
				}
			});
</script>
</html>

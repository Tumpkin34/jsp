<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<style>
main {
	width: 50%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<main>
		<h1>상품 관리</h1>
		<!-- 추가 -->
		<div style="width: 100%; text-align: right">
			<a href="javascript:view()">추가</a>
			<div class="input-wrap"
				style="width: 100%; text-align: center; display: none;">
				<input type="text" name="productName" placeholder="상품 이름"> <input
					type="text" name="productPrice" placeholder="상품 가격"> <input
					type="text" name="productStock" placeholder="상품 재고"> <input
					type="button" value="상품 등록" style="width: 70%" onclick="insert()">
			</div>
			<!-- 목록 -->
			<div class="listsWrap">
				<div class="lists"></div>
			</div>
			<!-- 상품별 수정, 삭제 -->
		</div>
	</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

let count = 1;

// 상품추가하기
function insert() {
	const $productNameInput = $("input[name='productName']");
	const $productPriceInput = $("input[name='productPrice']");
	const $productStockInput = $("input[name='productStock']");

	if (!$productNameInput.val()) {
		$productNameInput.focus();
		return;
	}
	if (!$productPriceInput.val()) {
		$productPriceInput.focus();
		return;
	}
	if (!$productStockInput.val()) {
		$productStockInput.focus();
		return;
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/create.prod",
		type : "post",
		data : {
			productName : $productNameInput.val(),
			productPrice : $productPriceInput.val(),
			productStock : $productStockInput.val()
		},
		success : function() {
			$productNameInput.val("");
			$productPriceInput.val("");
			$productStockInput.val("");
			show()
		}
	});
}

// 정보입력 보여주기
function view() {
	$(".input-wrap").slideToggle(function() {
		count *= -1;
		$(this).prev().text(count > 0 ? "추가" : "닫기");
	});
}

show();

// 목록
function show(){
	$.ajax({
		url : "${pageContext.request.contextPath}/select.prod",
		dataType: "json",
		success : function(lists) {
			text = "";
			text+=`<table border = 1>`
			lists.forEach(item => {
				text+=`<tr>`
				text+=`<td>`+ item.productNumber + `</tb>`
				text+=`<td>`+ item.productName + `</tb>`
				text+=`<td>`+ item.productPrice + `</tb>`
				text+=`<td>`+ item.productStock + `</tb>`
				text+=`<td class = "update-button">수정</tb>`
				text+=`<td class = "updateOk-button" style = "display:none">등록</tb>`
				text+=`<td class = "delete-button">삭제</tb>`
				text+=`<td class = "cancel-button" style = "display:none">취소</tb>`
				text+=`</tr>`
			})
			text+=`</table>`
			$('.lists').html(text);
		}
	});
}

// 삭제 버튼 눌렀을 때
$('.listsWrap').on('click','td.delete-button',function(){
	console.log('삭제입니다')
	productNumber = $(this).closest('tr').find('td').eq(0).text();
	console.log($(this).closest('tr').find('td').eq(0).text())
	$.ajax({
		url: "/product/delete.prod",
		data: {productNumber:productNumber},
		success: function(){show();}
	})
})

// 수정버튼 눌렀을 때 
$('.listsWrap').on('click','td.update-button',function(){
	
	productNumber = $(this).closest('tr').find('td').eq(0);
	productName =  $(this).closest('tr').find('td').eq(1);
	productPrice =  $(this).closest('tr').find('td').eq(2);
	productStock =  $(this).closest('tr').find('td').eq(3);
	
	$('.update-button').hide();
	$('.updateOk-button').show();
	$('.delete-button').hide();
	$('.cancel-button').show();
	
	productName.replaceWith('<td><input type = "text"  value = "' + productName.text() + '"></td>')
	productPrice.replaceWith('<td><input type = "text"  value = "' + productPrice.text() + '"></td>')
	productStock.replaceWith('<td><input type = "text"  value = "' + productStock.text() + '"></td>')

})

// 취소버튼 눌렀을 때 
$('.listsWrap').on('click','td.cancel-button',function(){
	productNumber = $(this).closest('tr').find('td').eq(0);
	productName =  $(this).closest('tr').find('input').eq(0);
	productPrice =  $(this).closest('tr').find('input').eq(1);
	productStock =  $(this).closest('tr').find('input').eq(2);
	
	$('.update-button').show();
	$('.updateOk-button').hide();
	$('.delete-button').show();
	$('.cancel-button').hide();
	
	productName.parents('td').replaceWith('<td>' + productName.val() + '</td>')
	productPrice.parents('td').replaceWith('<td>' + productPrice.val() + '</td>')
	productStock.parents('td').replaceWith('<td>' + productStock.val() + '</td>')
})

// 등록버튼 눌렀을 때 
$('.listsWrap').on('click','td.updateOk-button',function(){
	productNumber = $(this).closest('tr').find('td').eq(0).text();
	productName =  $(this).closest('tr').find('input').eq(0).val();
	productPrice =  $(this).closest('tr').find('input').eq(1).val();
	productStock =  $(this).closest('tr').find('input').eq(2).val();
	
// 	console.log(productPrice.val())
// 	console.log(productStock.val())
// 	console.log(productName)
// 	console.log(productPrice)
	
	$.ajax({
		url: "${pageContext.request.contextPath}/update.prod",
		data: {productNumber:productNumber, productName:productName,productPrice:productPrice,productStock:productStock},
		success: function(){show();}
	})
	
})
</script>
</html>




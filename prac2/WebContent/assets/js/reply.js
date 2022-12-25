/**
 * 댓글 
 */

show();

function show(){
	$.ajax({
		url: "/reply/listOk.re",
		type: "get",
		data: {boardNumber: boardNumber},
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: showList
	});
}

function showList(replies) {
	if (replies.length > 0) {
		let text = "";

		replies.forEach(reply => {
			text += `<div class="reply">`;
			text += `<div class="info">`
			text += `<p class="writer">` + reply.memberId + `</p>`;
			text += `<p class="date">` + reply.replyDate + `</p>`;
			text += `</div>`
			text += `<div class="content" style="width:100%">`;
			text += `<pre>` + reply.replyContent + `</pre>`;
			text += `</div>`;
//			if (reply.memberId == memberId) {
//				text += `<div class="button-wrap">`;
//				text += `<div class="modify-button" data-number=` + reply.replyNumber + `></div>`;
//				text += `<div class="delete-button" data-number=` + reply.replyNumber + `></div>`;
//				text += `</div>`;
//			}
			text += `</div>`;
		});

		$("#replies").html(text);
	}
}

function send() {
	console.log('안녕');
	let replyContent = replyForm.replyContent.value;
	if (!replyContent) {
		alert('댓글을 작성해주세요');
		return;
	}
	$.ajax({
		url: "/reply/writeOk.re",
		type: "GET",
		contentType: "application/json; charset= utf-8",
		data: { "replyContent": replyContent,"boardNumber":boardNumber,"memberNumber":memberNumber},
		success: function(){
			show();
		}

	})
}




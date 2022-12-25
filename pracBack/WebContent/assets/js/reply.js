/**
 * 댓글 
 */

function showList(replies){
	if(replies.length > 0){
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
			if(reply.memberId == memberId){
				text += `<div class="button-wrap">`;
				text += `<div class="modify-button" data-number=` + reply.replyNumber +`></div>`;
				text += `<div class="delete-button" data-number=` + reply.replyNumber +`></div>`;
				text += `</div>`;
			}
			text += `</div>`;
		});
		
		$("#replies").html(text);
	}
}




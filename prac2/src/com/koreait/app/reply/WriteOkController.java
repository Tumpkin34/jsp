package com.koreait.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.Result;
import com.koreait.app.reply.dao.ReplyDAO;
import com.koreait.app.reply.vo.ReplyVO;

public class WriteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("들어왔습니다");
		String replyContent = req.getParameter("replyContent");
		int memberNumber = Integer.valueOf(req.getParameter("memberNumber"));
		int boardNumber = Integer.valueOf(req.getParameter("boardNumber"));
		
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
		
		
		replyVO.setReplyContent(replyContent);
		replyVO.setMemberNumber(memberNumber);
		replyVO.setBoardNumber(boardNumber);
		
		System.out.println(replyVO);
		replyDAO.insert(replyVO);
		
		return null;
	}

}

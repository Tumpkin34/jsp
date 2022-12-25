package com.koreait.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.Result;
import com.koreait.app.member.dao.MemberDAO;
import com.koreait.app.member.vo.MemberVO;

public class JoinOkController implements Execute{
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Result result = new Result();
		
		MemberVO memberVO = new MemberVO();
		
		
		memberVO.setMemberId(req.getParameter("memberId"));
		memberVO.setMemberPw(req.getParameter("memberPw"));
		memberVO.setMemberName(req.getParameter("memberName"));
		System.out.println(req.getParameter("memberAge"));
		//memberVO.setMemberAge(req.getParameter("memberAge"));
		memberVO.setMemberGender(req.getParameter("memberGender"));
		memberVO.setMemberEmail(req.getParameter("memberEmail"));
	 	memberVO.setMemberZipcode(req.getParameter("memberZipcode"));
		memberVO.setMemberAddress(req.getParameter("memberAddress"));
		memberVO.setMemberAddressDetail(req.getParameter("memberAddressDetail"));
		
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.insert(memberVO);
				
		
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/member/login.me");
		return result;
	}
}

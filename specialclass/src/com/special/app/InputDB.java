package com.special.app;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.special.app.vo.NameVO;

public class InputDB extends HttpServlet { // HttpServlet 이걸 붙이는 순간부터 서블릿이 된다.

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name"); // 사용자가 입력한 값 키값으로 가져옴 input type="text" name="name"> <!-- name이 키값 -->

		NameDAO nameDAO = new NameDAO();
		NameVO nameVO = new NameVO();

		nameVO.setName(name);
		nameDAO.insert(nameVO);

		req.setAttribute("nameVO", nameDAO.select().getName());

		System.out.println("Asd");
		System.out.println(nameVO);
		System.out.println(req.getAttribute("nameVO"));
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/hello.jsp");
		requestDispatcher.forward(req, resp); // 포워드 방식
		
		// resp.sendRedirect(req.getContextPath() + "/hello.jsp"); // 리다이렉트 방식
	} // 이걸로 디비 인썰트 준비 완료!!!

}

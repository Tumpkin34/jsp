package com.koreait.task;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Oper
 */
public class Oper extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Oper() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calc calc = new Calc();
		response.setContentType("text/html; charset = UTF-8");
		PrintWriter out = response.getWriter();
		int result = 0;
		boolean check = false;
		String finalResult = "잘못된 수식입니다.";

		String expression = request.getParameter("expression");
		System.out.println(expression);
		String[] numbers = null;
		if (expression.contains("+")) {
			numbers = expression.split("\\+");
			result = calc.sum(Integer.parseInt(numbers[0]), Integer.parseInt(numbers[1]));
			check = true;
		} else if (expression.contains("-")) {
			numbers = expression.split("\\-");
			result = calc.sub(Integer.parseInt(numbers[0]), Integer.parseInt(numbers[1]));
			check = true;
		} else if (expression.contains("*")) {
			numbers = expression.split("\\*");
			result = calc.mul(Integer.parseInt(numbers[0]), Integer.parseInt(numbers[1]));
			check = true;
		} else if (expression.contains("/")) {
			numbers = expression.split("\\/");
			String[] searchDiv = expression.split("\\/");
			if (numbers[0].equals("0") || numbers[1].equals("0")) {
				finalResult = "0으로는 나눌 수 없습니다.";
			} else {
				result = calc.div(Integer.parseInt(numbers[0]), Integer.parseInt(numbers[1]));
				check = true;
			}
		}
		out.print("<a href = 'calc'>다시 계산하러 가기</a>");
		if (check) {
			out.print("<div>" + result + "</div>");
		} else {
			out.print("<div>" + finalResult + "</div>");
		}

	}

}

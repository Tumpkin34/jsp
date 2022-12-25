package com.special.app.animal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnimalFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String target = uri.substring(req.getContextPath().length());
		if(target.equals("/order.s")) {
			new OrderController().execute(req, resp);
			
		}else if(target.equals("/search.s")) {
			new SearchController().execute(req, resp);
			
		}else if(target.equals("/result.s")) {
			new OrderAndSearchController().execute(req, resp);
			
		}
	}
}















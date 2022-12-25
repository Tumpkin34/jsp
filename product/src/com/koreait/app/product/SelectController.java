package com.koreait.app.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.koreait.app.Execute;
import com.koreait.app.product.dao.ProductDAO;
import com.koreait.app.product.vo.ProductVO;

public class SelectController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();
		PrintWriter out = resp.getWriter();
		
		JSONArray lists = new JSONArray();
		productDAO.select().forEach(item ->{JSONObject jsonObject = new JSONObject(item); lists.put(jsonObject);});
		
		out.print(lists);
		out.close();
		

	}

}

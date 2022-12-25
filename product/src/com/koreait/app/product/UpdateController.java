package com.koreait.app.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.product.dao.ProductDAO;
import com.koreait.app.product.vo.ProductVO;

public class UpdateController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productNumber = Integer.valueOf(req.getParameter("productNumber"));
		String productName = req.getParameter("productName");
		int productPrice = Integer.valueOf(req.getParameter("productPrice"));
		int productStock = Integer.valueOf(req.getParameter("productStock"));
		
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();
		
		productVO.setProductNumber(productNumber);
		productVO.setProductName(productName);
		productVO.setProductPrice(productPrice);
		productVO.setProductStock(productStock);
		
		productDAO.update(productVO);
		System.out.println("수정완료");
	}

}

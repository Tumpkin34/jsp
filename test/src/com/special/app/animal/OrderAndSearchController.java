package com.special.app.animal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.special.app.Execute;
import com.special.app.dao.AnimalDAO;
import com.special.app.vo.Criteria;

public class OrderAndSearchController implements Execute{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		
		String keyword = req.getParameter("keyword");
		String type = req.getParameter("type");
		String order = req.getParameter("order");
		
		Criteria criteria = new  Criteria(keyword, type, order);
		
		AnimalDAO animalDAO = new AnimalDAO();
		JSONArray animals = new JSONArray();
		PrintWriter out = resp.getWriter();
		animalDAO.findAll(criteria).stream().map(vo -> new JSONObject(vo)).forEach(animal -> animals.put(animal));
		
		out.print(animals.toString());
		out.close();
	}
}










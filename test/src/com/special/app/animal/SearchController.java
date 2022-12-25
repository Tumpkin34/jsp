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
import com.special.app.vo.SearchDTO;

public class SearchController implements Execute{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		SearchDTO searchDTO = new SearchDTO(type, keyword);
		
		AnimalDAO animalDAO = new AnimalDAO();
		JSONArray animals = new JSONArray();
		PrintWriter out = resp.getWriter();
		animalDAO.findAllSearchBy(searchDTO).stream().map(vo -> new JSONObject(vo)).forEach(animal -> animals.put(animal));
		
		out.print(animals.toString());
		out.close();
	}
}










package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FoodDAO;
import model.FoodDTO;
import model.RecipeDAO;
import model.RecipeDTO;

@WebServlet("/UsearchCon")
public class UsearchCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("search");
		System.out.println(search);
		RecipeDAO dao = new RecipeDAO();
		FoodDAO dao2 = new FoodDAO();
		
		ArrayList<RecipeDTO> recipe = dao.Usearch_recipe(search);
		ArrayList<FoodDTO> food = dao2.search_food(search);
		
		if( food != null) {
			HttpSession session = request.getSession();
			session.setAttribute("search_recipe", recipe);
			session.setAttribute("search_food", food);
			
			response.sendRedirect("search_main_page.jsp");
		
		}
		
	}

}

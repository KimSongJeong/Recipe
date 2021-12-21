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


@WebServlet("/DiseaseCon")
public class DiseaseCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		ArrayList<FoodDTO> food_dang = new ArrayList<FoodDTO>();
		ArrayList<FoodDTO> food_go = new ArrayList<FoodDTO>();
		ArrayList<FoodDTO> food_we = new ArrayList<FoodDTO>();
		ArrayList<FoodDTO> food_ho = new ArrayList<FoodDTO>();
		ArrayList<RecipeDTO> recipe_dang = new ArrayList<RecipeDTO>();
		ArrayList<RecipeDTO> recipe_go = new ArrayList<RecipeDTO>();
		ArrayList<RecipeDTO> recipe_we = new ArrayList<RecipeDTO>();
		ArrayList<RecipeDTO> recipe_ho = new ArrayList<RecipeDTO>();
		
		FoodDAO food = new FoodDAO();
		RecipeDAO recipe = new RecipeDAO();

		
		food_dang = food.custom_food("¥Á¥¢");
		session.setAttribute("dang", food_dang);
		food_go = food.custom_food("∞Ì«˜æ–");
		session.setAttribute("go", food_go);
		food_we = food.custom_food("¿ß¿Â");
		session.setAttribute("we", food_we);
		food_ho = food.custom_food("»£»Ì±‚");
		session.setAttribute("ho", food_ho);
		
		recipe_dang = recipe.custom_recipe("v_dang", food_dang);
		session.setAttribute("dang_recipe", recipe_dang);
		recipe_go = recipe.custom_recipe("v_go", food_go);
		session.setAttribute("go_recipe", recipe_go);
		recipe_we = recipe.custom_recipe("v_we", food_we);
		session.setAttribute("we_recipe", recipe_we);
		recipe_ho = recipe.custom_recipe("v_ho", food_ho);
		session.setAttribute("ho_recipe", recipe_ho);
		
		
		response.sendRedirect("main.jsp");
		
		
	}

}

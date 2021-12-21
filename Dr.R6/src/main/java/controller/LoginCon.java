package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FoodDAO;
import model.FoodDTO;
import model.MyfoodDAO;
import model.MyrecipeDAO;
import model.RecipeDAO;
import model.RecipeDTO;
import model.UserDAO;
import model.UserDTO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		
		UserDAO dao = new UserDAO();
		UserDTO user = dao.user_login(u_id, u_pw);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login_User", user);
			
			ArrayList<String> dis = new ArrayList<>();
			ArrayList<FoodDTO> food1 = new ArrayList<FoodDTO>();
			ArrayList<FoodDTO> food2 = new ArrayList<FoodDTO>();
			FoodDAO food = new FoodDAO();
			MyfoodDAO mf = new MyfoodDAO();
			
			String[] not;
			int size = 0;
			
			not = mf.select_not(user.getU_id());
			for(int i =0; i < not.length; i++){
				if(not[i] != null)
					size++;
			}
			
			if (user.getU_dang() == 1)
				dis.add("당뇨");
			if (user.getU_go() == 1)
				dis.add("고혈압");
			if (user.getU_we() == 1)
				dis.add("위장");
			if (user.getU_ho() == 1)
				dis.add("호흡기");
			session.setAttribute("dis", dis);
			
			if (size != 0){
				/* 못먹는 음식 있으면 !  */
				food1 = food.food_custom(dis, mf.select_not(user.getU_id()));
				food2 = food.food_custom_season(dis, mf.select_not(user.getU_id()), (int)session.getAttribute("month"));
				session.setAttribute("food1", food1);
				session.setAttribute("food2", food2);
			}else{
				/* 못먹는 음식 없으면 ! */
				food1 = food.food_custom(dis);
				food2 = food.food_custom_season(dis, (int)session.getAttribute("month"));
				session.setAttribute("food1", food1);
				session.setAttribute("food2", food2);
			}
			
			RecipeDAO rec = new RecipeDAO();
			
			ArrayList<RecipeDTO> recipe = rec.custom_recipe(dis, food1);
			session.setAttribute("recipe", recipe);
			
			MyrecipeDAO dao3 = new MyrecipeDAO();
			ArrayList<Integer> myrecipe = dao3.select_recipe(u_id);
			session.setAttribute("Myrecipe", myrecipe);
			session.setAttribute("notfood", mf.select_not(user.getU_id()));
			System.out.println("성공");
			// 로그인 성공 후 이동페이지
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("실패");
			response.sendRedirect("login.html");
			// 로그인 실패 후 이동페이지
		}
	}

}

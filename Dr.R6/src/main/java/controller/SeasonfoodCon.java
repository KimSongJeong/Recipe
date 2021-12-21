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

@WebServlet("/SeasonfoodCon")
public class SeasonfoodCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		int month = Integer.parseInt(request.getParameter("month"));
		
		response.sendRedirect("Season_products.jsp?month="+month);
		
//		ArrayList<FoodDTO> food = new ArrayList<FoodDTO>();
//		FoodDAO dao = new FoodDAO();
//		
//		food = dao.season_food(month);
//		
//		for (int i = 0; i < food.size(); i++) {
//			System.out.println(food.get(i).getFood_name());
//		}
		
		
	}

}

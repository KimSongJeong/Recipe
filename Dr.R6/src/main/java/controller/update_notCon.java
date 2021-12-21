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
import model.MyfoodDAO;
import model.MyfoodDTO;
import model.UserDAO;
import model.UserDTO;

@WebServlet("/update_notCon")
public class update_notCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO)session.getAttribute("login_User");
		
		String id = User.getU_id();
		String notfood = request.getParameter("notfood");
		int size = Integer.parseInt(request.getParameter("size"));
		
		
		System.out.println(size);
		System.out.println(notfood);
		System.out.println(id);
		
		MyfoodDAO dao = new MyfoodDAO();
		
		int cnt = dao.update_not(notfood, id, size);
		
		if(cnt > 0) {
			String[] not;
			int size1 = 0;
			not = dao.select_not(User.getU_id());
			for(int i =0; i < not.length; i++){
				if(not[i] != null)
					size++;
			}
			if (size1 != 0){
				
				FoodDAO food = new FoodDAO();
				ArrayList<String> dis = (ArrayList<String>)session.getAttribute("dis");
				ArrayList<FoodDTO> food1 = food.food_custom(dis, dao.select_not(User.getU_id()));
				ArrayList<FoodDTO> food2 = food.food_custom_season(dis, dao.select_not(User.getU_id()), (int)session.getAttribute("month"));
				session.setAttribute("food1", food1);
				session.setAttribute("food2", food2);
			}
			System.out.println("못먹는 음식 저장 성공");
			response.sendRedirect("food_filter.jsp");
		}
		else {
			System.out.println("못먹는 음식 저장 실패");
			response.sendRedirect("food_filter.jsp");
		}
		

	}
		

}

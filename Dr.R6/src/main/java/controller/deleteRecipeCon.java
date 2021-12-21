package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyrecipeDAO;
import model.UserDTO;


@WebServlet("/deleteRecipeCon")
public class deleteRecipeCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("recipe_name");
		UserDTO user = (UserDTO)session.getAttribute("login_User");
		String id = user.getU_id();
		int code = (int)session.getAttribute("recipe_code");
			
		
		MyrecipeDAO dao = new MyrecipeDAO();
		int cnt = dao.delete_recipe(code, id);
		if(cnt > 0) {
			ArrayList<Integer> myrecipe = dao.select_recipe(id);
			session.setAttribute("Myrecipe", myrecipe);
			session.setAttribute("click", 1);
			response.sendRedirect("recipe_page.jsp?name=" + URLEncoder.encode(name, "euc-kr"));
		
		}
	}

}

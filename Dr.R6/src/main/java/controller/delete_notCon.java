package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyfoodDAO;
import model.UserDAO;
import model.UserDTO;

@WebServlet("/delete_notCon")
public class delete_notCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO)session.getAttribute("login_User");
		
		String id = User.getU_id();
		String not = request.getParameter("not");
		int index = Integer.parseInt(request.getParameter("index"));
		
		System.out.println(index);
		
		MyfoodDAO dao = new MyfoodDAO();
		int cnt = dao.delete_not(id, not, index);
		
			if (cnt > 0) {
					response.sendRedirect("food_filter.jsp");
					System.out.println("못먹는 음식 삭제 성공");
				} else {
					response.sendRedirect("food_filter.jsp");
					System.out.println("못먹는 음식 삭제 실패");
				}
			}
		
	
	
	
	
	}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserDTO;

@WebServlet("/UpdataConCheck")
public class UpdataConCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO)session.getAttribute("login_User");

		
		String id = User.getU_id();
		String pw = request.getParameter("pw");
		
		UserDTO update_User_check = new UserDTO(id, pw);
		
		UserDAO dao = new UserDAO();
		int cnt = dao.User_update_check(id, pw);
		
		if (cnt > 0) {
//			session.setAttribute("login_User", update_User_check);
			response.sendRedirect("member_info_change2.jsp");
		}else {
			response.sendRedirect("member_info_change1.jsp");
		}


	}

}

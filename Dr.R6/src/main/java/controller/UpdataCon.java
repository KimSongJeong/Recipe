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

@WebServlet("/UpdataCon")
public class UpdataCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO)session.getAttribute("login_User");

		
		String u_id = User.getU_id();
		String u_pw = request.getParameter("pw");
		String u_name = request.getParameter("name");
		String u_email = User.getU_email();
		int u_sex = User.getU_sex();
		int u_dang = 0;
		int u_go = 0;
		int u_we = 0;
		int u_ho = 0;
//		int u_no = 0;
		
		if(request.getParameter("dis_dang") != null)
			u_dang = 1;
		if(request.getParameter("dis_go") != null)
			u_go = 1;
		if(request.getParameter("dis_we") != null)
			u_we = 1;
		if(request.getParameter("dis_ho") != null)
			u_ho = 1;
//		if(request.getParameter("dis_no") != null)
//			u_no = 1;
		
		UserDTO user = new UserDTO(u_id, u_pw, u_email, u_name, u_sex, u_dang, u_go, u_we, u_ho);
//		UserDTO user = new UserDTO(u_id, u_pw, u_email, u_name, u_sex, u_dang, u_go, u_we, u_ho, u_no);
		UserDAO dao = new UserDAO();
		int cnt = dao.User_update(user);
		
		if(cnt > 0) {
			session.setAttribute("login_User", user);
			response.sendRedirect("logout.jsp");
		}
		else {
			response.sendRedirect("member_info_change2.jsp");
		}
		

	}

}

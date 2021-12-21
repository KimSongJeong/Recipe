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

@WebServlet("/DeleteCon")
public class DeleteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO) session.getAttribute("login_User");
		
		String u_id = User.getU_id();
		String u_pw = request.getParameter("pw");
		String u_email = User.getU_email();
		String u_name = User.getU_name();
		int u_sex = User.getU_sex();

		UserDAO dao = new UserDAO();
		int cnt1 = dao.User_delete_check(u_id, u_pw);
		
			if (cnt1 > 0) {
				int cnt2 = dao.User_delete(u_id);

				if (cnt2 > 0) {
					response.sendRedirect("login.html");
					session.removeAttribute("login_User");
					System.out.println("È¸¿ø Å»Åð ¿Ï·á!");
				} else {
					response.sendRedirect("member_dele.jsp");
					System.out.println("È¸¿ø Å»Åð ½ÇÆÐ..");
				}
			}
			
			
			
	}
}

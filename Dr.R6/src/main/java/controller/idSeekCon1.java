package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.UserDTO;


@WebServlet("/idSeekCon1")
public class idSeekCon1 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "search_id22";
		String email = request.getParameter("id");
		UserDTO UDto = null;
//		
		UserDAO uDao = new UserDAO();
		int cnt = uDao.seekId(email);
//		// 여기서 값이 1이면 존재하는 이메일 + id 담교있어
//		// -1나오면 존재하지 않는 이메일
//		if (cnt == 1) {
////			String id = UDto.getU_id();
//			HttpSession session = request.getSession();
////			session.setAttribute("seekid", id);
////			request.setAttribute("message", "회원님의 아이디입니다 :)");
//			
//		}else {
//			request.setAttribute("message", "이메일을 다시 한번 확인 부탁드릴게요...");
//		}
//		
		RequestDispatcher dispatcher = request.getRequestDispatcher("search_id.html");
		dispatcher.forward(request, response);
		
		
	}

}

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

@WebServlet("/idSeekCon")
public class idSeekCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "search_id22.jsp";
		String email = request.getParameter("email");
//		UserDTO UDto = new UserDTO();
		
		
		
		
		request.setAttribute("email",email);
		
		UserDAO uDao = new UserDAO();
		UserDTO UDto = uDao.getUser_email(email);
		
		String id = "";
		int cnt = uDao.seekId(email);
		
		
		// 여기서 값이 1이면 존재하는 이메일 + id 담교있어
		// -1나오면 존재하지 않는 이메일
		if (cnt == 1) {
			id = UDto.getU_id();
			request.setAttribute("seekid", id);
			request.setAttribute("message", "회원님의 아이디입니다 :)");
			
		}else {
			request.setAttribute("seekid", " ");
			request.setAttribute("message", "이메일을 다시 한번 확인 부탁드릴게요...");
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	
	
	
	
	}

}

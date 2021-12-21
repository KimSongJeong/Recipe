package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;
import model.UserDTO;

@WebServlet("/pwSeekCon")
public class pwSeekCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String url = "search_pw22.jsp";
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
//		UserDTO UDto = new UserDTO();
		request.setAttribute("email",email);
		request.setAttribute("id",id);
		
		
		UserDAO uDao = new UserDAO();
		
		UserDTO UDto = uDao.getUser(id);
		// 아이디를 통해서 비밀번호 가져오는 툴
		
		String pw = "";
		
		int cnt = uDao.seekPw(id,email);
		// 아이디가 있고 이메일도 맞으면 1
		// 아이디는 있는데 이메일 다르면 -1
		// 아이디 자체가 없는 경우 0
		
		
		
		
		
		// 여기서 값이 1이면 존재하는 이메일 + id 담교있어
		// -1나오면 존재하지 않는 이메일
		if (cnt == 1) {
			pw = UDto.getU_pw();
			request.setAttribute("seekpw", pw);
			request.setAttribute("message", "회원님의 비밀번호입니다 :)");
			
		}else if(cnt == -1) {
			request.setAttribute("seekpw", " ");
			request.setAttribute("message", "이메일을 다시 한번 확인 부탁드릴게요...");
			
		}else if(cnt == 0) {
			request.setAttribute("seekpw", " ");
			request.setAttribute("message", "아이디를 다시 한번 확인 부탁드릴게요...");
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

}

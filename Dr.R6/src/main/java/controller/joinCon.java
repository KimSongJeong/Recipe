package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyfoodDAO;
import model.MyrecipeDAO;
import model.UserDAO;
import model.UserDTO;


@WebServlet("/joinCon")
public class joinCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		
//		1이면 남자, 0이면 여자
		int sex = Integer.parseInt(request.getParameter("gender"));
		
//		체크되면 on 안되면 null
		String[] dis = request.getParameterValues("disease");
//		int[] disease = new int[5];
		int[] disease = new int[4];
		for (int i = 0; i < dis.length; i++) {
			if(dis[i].equals("당뇨"))
				disease[0] = 1;
			if(dis[i].equals("고혈압"))
				disease[1] = 1;
			if(dis[i].equals("위장"))
				disease[2] = 1;
			if(dis[i].equals("호흡기"))
				disease[3] = 1;
			/*
			 * if(dis[i].equals("해당없음")) disease[4] = 1;
			 */
		}

		UserDTO user = new UserDTO(id, pw, email, nick, sex, disease[0], disease[1], disease[2], disease[3]);
//		UserDTO user = new UserDTO(id, pw, email, nick, sex, disease[0], disease[1], disease[2], disease[3], disease[4]);
		UserDAO dao = new UserDAO();
		MyfoodDAO dao2 = new MyfoodDAO();
		MyrecipeDAO dao3 = new MyrecipeDAO();
		
		int cnt = dao.user_insert(user);
		int cnt2 = dao2.insert_not(id);

		
		if(cnt > 0 && cnt2 > 0) {
			out.print("<script> alert(\"회원가입에 성공하였습니다!\");</script>");
			response.sendRedirect("main.jsp");
		}else {
			out.print("<script> alert(\"회원가입에 실패하였습니다ㅜㅜ\");</script>");
			response.sendRedirect("main.jsp");
		}
		
		
	}

}

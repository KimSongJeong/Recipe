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
		
//		1�̸� ����, 0�̸� ����
		int sex = Integer.parseInt(request.getParameter("gender"));
		
//		üũ�Ǹ� on �ȵǸ� null
		String[] dis = request.getParameterValues("disease");
//		int[] disease = new int[5];
		int[] disease = new int[4];
		for (int i = 0; i < dis.length; i++) {
			if(dis[i].equals("�索"))
				disease[0] = 1;
			if(dis[i].equals("������"))
				disease[1] = 1;
			if(dis[i].equals("����"))
				disease[2] = 1;
			if(dis[i].equals("ȣ���"))
				disease[3] = 1;
			/*
			 * if(dis[i].equals("�ش����")) disease[4] = 1;
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
			out.print("<script> alert(\"ȸ�����Կ� �����Ͽ����ϴ�!\");</script>");
			response.sendRedirect("main.jsp");
		}else {
			out.print("<script> alert(\"ȸ�����Կ� �����Ͽ����ϴ٤̤�\");</script>");
			response.sendRedirect("main.jsp");
		}
		
		
	}

}

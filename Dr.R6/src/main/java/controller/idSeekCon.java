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
		
		
		// ���⼭ ���� 1�̸� �����ϴ� �̸��� + id �㱳�־�
		// -1������ �������� �ʴ� �̸���
		if (cnt == 1) {
			id = UDto.getU_id();
			request.setAttribute("seekid", id);
			request.setAttribute("message", "ȸ������ ���̵��Դϴ� :)");
			
		}else {
			request.setAttribute("seekid", " ");
			request.setAttribute("message", "�̸����� �ٽ� �ѹ� Ȯ�� ��Ź�帱�Կ�...");
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	
	
	
	
	}

}

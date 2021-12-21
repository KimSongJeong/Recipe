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
//		// ���⼭ ���� 1�̸� �����ϴ� �̸��� + id �㱳�־�
//		// -1������ �������� �ʴ� �̸���
//		if (cnt == 1) {
////			String id = UDto.getU_id();
//			HttpSession session = request.getSession();
////			session.setAttribute("seekid", id);
////			request.setAttribute("message", "ȸ������ ���̵��Դϴ� :)");
//			
//		}else {
//			request.setAttribute("message", "�̸����� �ٽ� �ѹ� Ȯ�� ��Ź�帱�Կ�...");
//		}
//		
		RequestDispatcher dispatcher = request.getRequestDispatcher("search_id.html");
		dispatcher.forward(request, response);
		
		
	}

}

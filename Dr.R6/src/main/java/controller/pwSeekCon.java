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
		// ���̵� ���ؼ� ��й�ȣ �������� ��
		
		String pw = "";
		
		int cnt = uDao.seekPw(id,email);
		// ���̵� �ְ� �̸��ϵ� ������ 1
		// ���̵�� �ִµ� �̸��� �ٸ��� -1
		// ���̵� ��ü�� ���� ��� 0
		
		
		
		
		
		// ���⼭ ���� 1�̸� �����ϴ� �̸��� + id �㱳�־�
		// -1������ �������� �ʴ� �̸���
		if (cnt == 1) {
			pw = UDto.getU_pw();
			request.setAttribute("seekpw", pw);
			request.setAttribute("message", "ȸ������ ��й�ȣ�Դϴ� :)");
			
		}else if(cnt == -1) {
			request.setAttribute("seekpw", " ");
			request.setAttribute("message", "�̸����� �ٽ� �ѹ� Ȯ�� ��Ź�帱�Կ�...");
			
		}else if(cnt == 0) {
			request.setAttribute("seekpw", " ");
			request.setAttribute("message", "���̵� �ٽ� �ѹ� Ȯ�� ��Ź�帱�Կ�...");
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

}

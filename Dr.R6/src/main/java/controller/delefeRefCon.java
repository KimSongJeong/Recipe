package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyfoodDAO;
import model.UserDTO;


@WebServlet("/deleteRefCon")
public class delefeRefCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("EUC-KR");
	      HttpSession session = request.getSession();
	      UserDTO User = (UserDTO)session.getAttribute("login_User");
	      
	      String id = User.getU_id();
	      String no = request.getParameter("no");
	      int index = Integer.parseInt(request.getParameter("index"));
	      
	      System.out.println(index);
	      
	      MyfoodDAO dao = new MyfoodDAO();
	      int cnt = dao.delete_no(id, no, index);
	      
	         if (cnt > 0) {
	               response.sendRedirect("ref_food.jsp");
	               System.out.println("냉장고 음식 삭제 성공");
	            } else {
	               response.sendRedirect("ref_food.jsp");
	               System.out.println("냉장고 음식 삭제 실패");
	            }
	         }

	
}

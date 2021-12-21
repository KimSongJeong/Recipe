package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CommentDAO;
import model.CommentDTO;
import model.UserDTO;


@WebServlet("/CommentCon")
public class CommentCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		UserDTO User = (UserDTO) session.getAttribute("login_User");
		String cmt_id = User.getU_id();
		String name = (String)session.getAttribute("recipe_name");
		
		
		
//		if (User.getU_id() != null) {
//			cmt_id = User.getU_id();
//		}
		
		
		
		
		int cmt_recipe = (int)session.getAttribute("recipe_code");
//		int cmt_recipe = (Integer)session.getAttribute("cmt_recipe");
//		int cmt_recipe = (Integer)request.getParameter("cmt_recipe");
		
		
//		현재 날짜, recipe_page의 textarea에서 입력한 값 가져오기
//		String cmt_date = ?;
//		String cmt_content = ?;
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date cmt_date = new Date();
		
		//날짜
		String cmt_date1 = format1.format(cmt_date);
		
		//코멘트
		String cmt_content = request.getParameter("comment");
		
		
		//레시피 코드
//		댓글DTO 객체 생성해서 앞에서 받아온 cmt_id, cmt_recipe, cmt_date, cmt_content 값 넣기
//		CommentDTO vo = new CommentDTO();
//		vo.setCmt_id(cmt_id);
//		vo.setCmt_recipe(cmt_recipe);
//		vo.setCmt_content(cmt_content);
		
		CommentDTO vo = new CommentDTO(cmt_content, cmt_recipe, cmt_id);
		
		System.out.println(name);
		//이거를 이제 CommentDAO를 이용해서 db에 저장하기
		
		CommentDAO dao = new CommentDAO();
		int cnt = dao.comment_insert(vo);
		
//		CommentDTO cmt = new CommentDTO();

		if(cnt > 0) {
			response.sendRedirect("recipe_page.jsp?name=" + URLEncoder.encode(name, "euc-kr"));
		}else {
			
		}
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("recipe_page2.jsp");
//		dispatcher.forward(request, response);
		
		
		
//		추가하는 함수 comment_insert 호출하고 페이지 이동
		
	}

}
